/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Bill;
import Models.Cart;
import Models.Customers;
import Models.Item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class BillDAO {

    Connection con;
    public String status = "ok";

    public BillDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection " + e.getMessage();
        }
    }

    public void addBill(Customers cus, Cart cart, String Address) {
        LocalDate curDate = LocalDate.now();
        String PaymentTime = curDate.toString();
        try {
            String sql = "INSERT INTO [dbo].[Bills_HE160592]\n"
                    + "           ([Id]\n"
                    + "           ,[CustomerLogName]\n"
                    + "           ,[Price]\n"
                    + "           ,[TotalPay]\n"
                    + "           ,[Address]\n"
                    + "           ,[Phone]\n"
                    + "           ,[PaymentTime]) values(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setInt(1, cus.getLoginName());
            ps.setString(2, cus.getLoginName());
            ps.setInt(3, cart.getTotalPay());
            ps.setInt(4, cart.getTotalPay());
            ps.setString(5, Address);
            ps.setString(6, cus.getPhone());
            ps.setString(7, PaymentTime);
            ps.execute();

            //add vao orderDetails
            String sql2 = "INSERT INTO [dbo].[OrderDetail_HE160592]\n"
                    + "           ([bid]\n"
                    + "           ,[ProId]\n"
                    + "           ,[Quantity]\n"
                    + "           ,[Price])\n"
                    + "     VALUES(?,?,?,?)";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            for (Item i : cart.getItems()) {
                ps2.setInt(1, i.getProduct().getQuantity() - i.getQuantity());
                ps2.setString(2, i.getProduct().getId());
                ps2.setInt(3, i.getQuantity());
                ps2.setInt(4, Integer.parseInt(i.getPrice()));
                ps2.execute();
            }

            //cap nhat so luong san pham
            String sql3 = "UPDATE [dbo].[[Products_HE160592]]\n"
                    + "   SET [Quantity] = ?\n"
                    + "      ,[[Buyed]] = ?\n"
                    + " WHERE Id = ?";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                ps3.setInt(1, i.getProduct().getQuantity() - i.getQuantity());
                ps3.setString(3, i.getProduct().getId());
                ps3.setInt(2, i.getProduct().getBuyed() + i.getQuantity());
                ps3.execute();
            }

        } catch (Exception e) {
            status = "Error " + e.getMessage();
        }
    }

}
