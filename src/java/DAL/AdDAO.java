/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Admins;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AdDAO {

    public String status = "ok";
    Connection con;

    public AdDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection " + e.getMessage();
        }
    }

    public ArrayList<Admins> getAdminList() {
        ArrayList<Admins> adList = new ArrayList<Admins>();
        String sql = "select * from Admins_HE160592";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String logName = rs.getString(1);
                String pass = rs.getString(2);
                String name = rs.getString(3);
                int roleId = rs.getInt(4);
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String add = rs.getString(7);
                adList.add(new Admins(logName, pass, name, roleId, email, phone, add));
            }
        } catch (Exception e) {
            status = "Error Admin" + e.getMessage();
        }
        return adList;
    }

    public Admins getAdByLogName(String logName) {
        String sql = "select * from Admins_HE160592 where LoginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, logName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                logName = rs.getString(1);
                String pass = rs.getString(2);
                String name = rs.getString(3);
                int roleId = rs.getInt(4);
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String add = rs.getString(7);
                Admins ad = new Admins(logName, pass, name, roleId, email, phone, add);
                return ad;
            }
        } catch (Exception e) {
            status = "Error Customers" + e.getMessage();
        }
        return null;
    }

     public void Insert(String loginName, String password, String name, int roleId, String email, String phone, String add) {
        String sql = "insert into Admins_HE160592 values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, loginName);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(5, email);
            ps.setString(6, phone);
            ps.setString(7, add);
            ps.setInt(4, roleId);
            ps.execute();
        } catch (Exception e) {
            status = "Error " + e.getMessage();
        }
    }

    public void Del(String LoginName) {
        String sql = "delete from Admins_HE160592 where LoginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, LoginName);
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete admin" + e.getMessage();
        }
    }

    public void Update(String loginName, String password, String name, int roleId, String email, String phone, String add) {
        String sql = "Update Admins_HE160592 set password = ?, name = ?, roleId= ?, email = ?, phone = ?, address = ? where loginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, name);
            ps.setString(6, add);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setInt(3, roleId);
            ps.setString(7, loginName);
            ps.execute();

        } catch (Exception e) {
            status = "Error at Update admin " + e.getMessage();
        }
    }

    public void InforUpdate(String loginName, String name, String email, String phone, String add) {
        String sql = "Update Admins_HE160592 set name = ?, email = ?,  phone = ?,  address = ? where loginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(4, add);
            ps.setString(5, loginName);
            ps.execute();

        } catch (Exception e) {
            status = "Error at Update Admins" + e.getMessage();
        }
    }
    
     public void UpdatePass(String loginName, String pass) {
        String sql = "Update Admins_HE160592 set password = ? where loginName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, loginName);
            ps.execute();

        } catch (Exception e) {
            status = "Error at Update pass " + e.getMessage();
        }
    }

}
