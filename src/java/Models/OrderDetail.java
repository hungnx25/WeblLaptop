/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private int Bid;
    private String Pid;
    private int quantity, price;

    public OrderDetail() {
    }

    public OrderDetail(int Bid, String Pid, int quantity, int price) {
        this.Bid = Bid;
        this.Pid = Pid;
        this.quantity = quantity;
        this.price = price;
    }

    public int getBid() {
        return Bid;
    }

    public void setBid(int Bid) {
        this.Bid = Bid;
    }

    public String getPid() {
        return Pid;
    }

    public void setPid(String Pid) {
        this.Pid = Pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
}
