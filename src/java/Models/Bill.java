/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */

public class Bill {
   private int id;
    private String CustomerLogName;
    private int quantity;
    private String Price,TotalPay,Address,Phone;
    private String PaymentTime;

    public Bill() {
    }

    public Bill(int id, String CustomerLogName, int quantity, String Price, String TotalPay, String Address, String Phone, String PaymentTime) {
        this.id = id;
        this.CustomerLogName = CustomerLogName;
        this.quantity = quantity;
        this.Price = Price;
        this.TotalPay = TotalPay;
        this.Address = Address;
        this.Phone = Phone;
        this.PaymentTime = PaymentTime;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    

    public String getCustomerLogName() {
        return CustomerLogName;
    }

    public void setCustomerLogName(String CustomerLogName) {
        this.CustomerLogName = CustomerLogName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getTotalPay() {
        return TotalPay;
    }

    public void setTotalPay(String TotalPay) {
        this.TotalPay = TotalPay;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPaymentTime() {
        return PaymentTime;
    }

    public void setPaymentTime(String PaymentTime) {
        this.PaymentTime = PaymentTime;
    }
  
    
}
