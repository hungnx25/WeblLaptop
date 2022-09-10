/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Admins {
    private String LoginName;
    private String Password;
    private String Name;
    private int RoleId;
    private String Email;
    private String Phone;
    private String Address;

    public Admins() {
    }

    public Admins(String LoginName, String Password, String Name, int RoleId, String Email, String Phone, String Address) {
        this.LoginName = LoginName;
        this.Password = Password;
        this.Name = Name;
        this.RoleId = RoleId;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
    }

    public String getLoginName() {
        return LoginName;
    }

    public void setLoginName(String LoginName) {
        this.LoginName = LoginName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getRoleId() {
        return RoleId;
    }

    public void setRoleId(int RoleId) {
        this.RoleId = RoleId;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }
    
    
}
