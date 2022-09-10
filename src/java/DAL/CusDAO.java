/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Customers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CusDAO {

    public String status = "ok";
    Connection con;

    public CusDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection " + e.getMessage();
        }
    }

    public ArrayList<Customers> getCustomerList() {
        ArrayList<Customers> cusList = new ArrayList<Customers>();
        String sql = "select * from Customer_HE160592";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String logName = rs.getString(1);
                String pass = rs.getString(2);
                String name = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                int quesId = rs.getInt(6);
                String ans = rs.getString(7);
                boolean active = rs.getBoolean(8);
                cusList.add(new Customers(logName, pass, name, email, phone, quesId, ans, active));
            }
        } catch (Exception e) {
            status = "Error customer" + e.getMessage();
        }
        return cusList;
    }
    
    public Customers getCustomerByLogName(String logName) {
        String sql = "select * from Customer_HE160592 where LoginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, logName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                logName = rs.getString(1);
                String pass = rs.getString(2);
                String name = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                int quesId = rs.getInt(6);
                String ans = rs.getString(7);
                boolean active = rs.getBoolean(8);
                Customers c = new Customers(logName, pass, name, email, phone, quesId, ans, active);
                return c;
            }
        } catch (Exception e) {
            status = "Error Customers" + e.getMessage();
        }
        return null;
    }

    public void Insert(String loginName, String password, String name, String email, String phone,
            int questionId, String answer, boolean active) {
        String sql = "insert into Customer_HE160592 values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, loginName);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setInt(6, questionId);
            ps.setString(7, answer);
            ps.setBoolean(8, active);
            ps.execute();
        } catch (Exception e) {
            status = "Error " + e.getMessage();
        }
    }

    public void Del(String LoginName) {
        String sql = "delete from Customer_HE160592 where LoginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, LoginName);
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete customer" + e.getMessage();
        }
    }

    public void Update(String loginName, String password, String name, String email, String phone,
            int questionId, String answer, boolean active) {
        String sql = "Update Customer_HE160592 set password = ?, name = ?,  email = ?,  phone = ?,  questionId = ?,  answer = ?,  active = ? where loginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setInt(5, questionId);
            ps.setString(6, answer);
            ps.setBoolean(7, active);
            ps.setString(8, loginName);
            ps.execute();

        } catch (Exception e) {
            status = "Error at Update customer " + e.getMessage();
        }
    }
    
    public void AdUpdate(String loginName, String name, String email, String phone,
            int questionId, String ans, boolean active) {
        String sql = "Update Customer_HE160592 set name = ?, email = ?, phone = ?, questionId = ?, answer=?,active = ? where loginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setInt(4, questionId);
            ps.setBoolean(6, active);
            ps.setString(5, ans);
            ps.setString(7, loginName);
            ps.execute();

        } catch (Exception e) {
            status = "Error at Update customer " + e.getMessage();
        }
    }
    
    public void InforUpdate(String loginName,  String name, String email, String phone) {
        String sql = "Update Customer_HE160592 set name = ?, email = ?, phone = ? where loginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, loginName);
            ps.execute();

        } catch (Exception e) {
            status = "Error at Update customer " + e.getMessage();
        }
    }


    public void UpdateActive(String loginName, boolean active) {
        String sql = "Update Customer_HE160592 set active = ? where loginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setBoolean(1, active);
            ps.setString(2, loginName);
            ps.execute();

        } catch (Exception e) {
            status = "Error at Update active " + e.getMessage();
        }
    }

    public void UpdatePass(String loginName, String pass) {
        String sql = "Update Customer_HE160592 set password = ? where loginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, loginName);
            ps.execute();

        } catch (Exception e) {
            status = "Error at Update pass " + e.getMessage();
        }
    }

    public ArrayList<Customers> searchCustomerByName(String name) {
        ArrayList<Customers> cusList = new ArrayList<Customers>();
        String sql = "select * from Customer_HE160592 where Name like '%?%'";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String logName = rs.getString(1);
                String pass = rs.getString(2);
                name = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                int quesId = rs.getInt(6);
                String ans = rs.getString(7);
                boolean active = rs.getBoolean(8);
                Customers c = new Customers(logName, pass, name, email, phone, quesId, ans, active);
                cusList.add(c);
            }
        } catch (Exception e) {
            status = "Error Customers" + e.getMessage();
        }
        return cusList;
    }
    
}
