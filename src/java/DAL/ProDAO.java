/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author Admin
 */
public class ProDAO {

    public String status = "ok";
    Connection con;

    public ProDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection " + e.getMessage();
        }
    }

    public ArrayList<Products> getProductList() {
        ArrayList<Products> proList = new ArrayList<Products>();
        String sql = "select * from Products_HE160592";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String price = rs.getString(3);
                String discountPrice = rs.getString(4);
                String brand = rs.getString(5);
                String screen = rs.getString(6);
                String cpu = rs.getString(7);
                String ram = rs.getString(8);
                String hardDrive = rs.getString(9);
                String graphics = rs.getString(10);
                String os = rs.getString(11);
                String weight = rs.getString(12);
                int buyed = rs.getInt(13);
                int quantity = rs.getInt(14);
                String img = rs.getString(15);
                proList.add(new Products(id, name, price, discountPrice, brand, screen, cpu, ram, hardDrive, graphics, os, weight, buyed, quantity, img));
            }
        } catch (Exception e) {
            status = "Error Product" + e.getMessage();
        }
        return proList;

    }

    public Products getProductById(String id) {
        String sql = "select * from Products_HE160592 where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString(1);
                String name = rs.getString(2);
                String price = rs.getString(3);
                String discountPrice = rs.getString(4);
                String brand = rs.getString(5);
                String screen = rs.getString(6);
                String cpu = rs.getString(7);
                String ram = rs.getString(8);
                String hardDrive = rs.getString(9);
                String graphics = rs.getString(10);
                String os = rs.getString(11);
                String weight = rs.getString(12);
                int buyed = rs.getInt(13);
                int quantity = rs.getInt(14);
                String img = rs.getString(15);
                Products p = new Products(id, name, price, discountPrice, brand, screen, cpu, ram, hardDrive, graphics, os, weight, buyed, quantity, img);
                return p;
            }
        } catch (Exception e) {
            status = "Error Product" + e.getMessage();
        }
        return null;
    }

    public ProductDetails getProductDetailById(String pid) {
        String sql = "select * from Product_Details_HE160592 where ProId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pid = rs.getString(1);
                String imgLink = rs.getString(2);
                String des = rs.getString(3);
                ProductDetails p = new ProductDetails(pid, imgLink, des);
                return p;
            }
        } catch (Exception e) {
            status = "Error Product" + e.getMessage();
        }
        return null;
    }

    public ArrayList<Products> getProductDesc() {
        ArrayList<Products> proList = new ArrayList<Products>();
        String sql = "select * from Products_HE160592 order by Buyed desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String price = rs.getString(3);
                String discountPrice = rs.getString(4);
                String brand = rs.getString(5);
                String screen = rs.getString(6);
                String cpu = rs.getString(7);
                String ram = rs.getString(8);
                String hardDrive = rs.getString(9);
                String graphics = rs.getString(10);
                String os = rs.getString(11);
                String weight = rs.getString(12);
                int buyed = rs.getInt(13);
                int quantity = rs.getInt(14);
                String img = rs.getString(15);
                proList.add(new Products(id, name, price, discountPrice, brand, screen, cpu, ram, hardDrive, graphics, os, weight, buyed, quantity, img));
            }
        } catch (Exception e) {
            status = "Error Product" + e.getMessage();
        }
        return proList;

    }

    public ArrayList<ProductDetails> getProDetailList() {
        ArrayList<ProductDetails> proDetailList = new ArrayList<ProductDetails>();
        String sql = "select * from Product_Details_HE160592";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String proId = rs.getString(1);
                String imgLink = rs.getString(2);
                String description = rs.getString(3);
                proDetailList.add(new ProductDetails(proId, imgLink, description));
            }
        } catch (Exception e) {
            status = "Error Product" + e.getMessage();
        }
        return proDetailList;
    }

    public void Insert(String id, String name, String price, String discountPrice, String brand, String screen, String cpu,
            String ram, String hardDrive, String graphics, String os, String weight, int buyed, int quantity, String img) {
        String sql = "insert into Products_HE160592 values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, price);
            ps.setString(4, discountPrice);
            ps.setString(5, brand);
            ps.setString(6, screen);
            ps.setString(7, cpu);
            ps.setString(8, ram);
            ps.setString(9, hardDrive);
            ps.setString(10, graphics);
            ps.setString(11, os);
            ps.setString(12, weight);
            ps.setInt(13, buyed);
            ps.setInt(14, quantity);
            ps.setString(15, img);
            ps.execute();
        } catch (Exception e) {
            status = "Error insert Product " + e.getMessage();
        }
    }

    public void InsertDes(String id, String img, String description) {
        String sql = "insert into Product_Details_HE160592 values(?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, img);
            ps.setString(3, description);
            ps.execute();
        } catch (Exception e) {
            status = "Error insert Product Des " + e.getMessage();
        }
    }

    public void Del(String id) {
        String sql = "Delete from Products_HE160592 where Id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete product" + e.getMessage();
        }
    }

    public void DelDes(String id) {
        String sql = "Delete from Product_Details_HE160592 where Id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete product" + e.getMessage();
        }
    }

    public void Update(String id, String name, String price, String discountPrice, String brand, String screen, String cpu,
            String ram, String hardDrive, String graphics, String os, String weight, int buyed, int quantity, String img) {
        String sql = "Update Products_HE160592 set name = ?, price = ?, discountPrice = ?,brand = ?,"
                + "screen = ? ,ram = ? ,hardDrive = ? , graphics = ? , os = ? , weight = ? "
                + ",buyed = ? ,quantity = ?, img = ? where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, discountPrice);
            ps.setString(4, brand);
            ps.setString(5, screen);
            ps.setString(6, cpu);
            ps.setString(7, ram);
            ps.setString(8, hardDrive);
            ps.setString(9, graphics);
            ps.setString(10, os);
            ps.setString(11, weight);
            ps.setInt(12, buyed);
            ps.setInt(13, quantity);
            ps.setString(14, id);
            ps.setString(15, img);
            ps.execute();

        } catch (Exception e) {
            status = "Error at Update product " + e.getMessage();
        }
    }

    public ArrayList<Products> getByPrice(String from, String to) {
        ArrayList<Products> proList = new ArrayList<Products>();
        String sql = "select * from products_HE160592 where \n"
                + "DiscountPrice between "+from+" and "+to+" ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String price = rs.getString(3);
                String discountPrice = rs.getString(4);
                String brand = rs.getString(5);
                String screen = rs.getString(6);
                String cpu = rs.getString(7);
                String ram = rs.getString(8);
                String hardDrive = rs.getString(9);
                String graphics = rs.getString(10);
                String os = rs.getString(11);
                String weight = rs.getString(12);
                int buyed = rs.getInt(13);
                int quantity = rs.getInt(14);
                String img = rs.getString(15);
                proList.add(new Products(id, name, price, discountPrice, brand, screen, cpu, ram, hardDrive, graphics, os, weight, buyed, quantity, img));
            }
        } catch (Exception e) {
            status = "Error Product" + e.getMessage();
        }
        return proList;

    }

    public ArrayList<Products> sortByPrice(ArrayList<Products> list) {
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = i + 1; j < list.size(); j++) {
                int p1 = Integer.parseInt(list.get(i).getDiscountPrice());
                int p2 = Integer.parseInt(list.get(j).getDiscountPrice());
                if (p1 > p2) {
                    Collections.swap(list, i, j);
                }
            }
        }
        return list;
    }

    public ArrayList<Products> sortByName(ArrayList<Products> list) {
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).getName().compareTo(list.get(j).getName()) < 0) {
                    Collections.swap(list, i, j);
                }
            }
        }
        return list;
    }

    public ArrayList<Products> searchByKey(String key, String type) {
        ArrayList<Products> proList = new ArrayList<Products>();
        String sql = "select * from Products_HE160592 where " + type + " like '%" + key + "%' ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String price = rs.getString(3);
                String discountPrice = rs.getString(4);
                String brand = rs.getString(5);
                String screen = rs.getString(6);
                String cpu = rs.getString(7);
                String ram = rs.getString(8);
                String hardDrive = rs.getString(9);
                String graphics = rs.getString(10);
                String os = rs.getString(11);
                String weight = rs.getString(12);
                int buyed = rs.getInt(13);
                int quantity = rs.getInt(14);
                String img = rs.getString(15);
                proList.add(new Products(id, name, price, discountPrice, brand, screen, cpu, ram, hardDrive, graphics, os, weight, buyed, quantity, img));
            }
        } catch (Exception e) {
            status = "Error Product" + e.getMessage();
        }
        return proList;

    }

    public ArrayList<Products> loadByBrand(ArrayList<Products> list, String Brand) {
        ArrayList<Products> p = new ArrayList<>();
        for (int i = 0; i < list.size() - 1; i++) {
            if (list.get(i).getBrand().contains(Brand)) {
                p.add(list.get(i));
            }            
        }
        return p;
    }

}
