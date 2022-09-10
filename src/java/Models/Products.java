/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Products {

    private String Id;
    private String Name;
    private String Price;
    private String DiscountPrice;
    private String Brand;
    private String Screen;
    private String CPU;
    private String RAM;
    private String HardDrive;
    private String Graphics;
    private String OS;
    private String Weight;
    private int Buyed, Quantity;
    private String Img;
    
    public Products() {
    }
    
    public Products(String brand) {
        this.Brand = Brand;
    }

    public Products(String Id, String Name, String Price, String DiscountPrice, String Brand, String Screen, String CPU, String RAM, String HardDrive, String Graphics, String OS, String Weight, int Buyed, int Quantity, String Img) {
        this.Id = Id;
        this.Name = Name;
        this.Price = Price;
        this.DiscountPrice = DiscountPrice;
        this.Brand = Brand;
        this.Screen = Screen;
        this.CPU = CPU;
        this.RAM = RAM;
        this.HardDrive = HardDrive;
        this.Graphics = Graphics;
        this.OS = OS;
        this.Weight = Weight;
        this.Buyed = Buyed;
        this.Quantity = Quantity;
        this.Img = Img;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getDiscountPrice() {
        return DiscountPrice;
    }

    public void setDiscountPrice(String DiscountPrice) {
        this.DiscountPrice = DiscountPrice;
    }

    public String getBrand() {
        return Brand;
    }

    public void setBrand(String Brand) {
        this.Brand = Brand;
    }

    public String getScreen() {
        return Screen;
    }

    public void setScreen(String Screen) {
        this.Screen = Screen;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getHardDrive() {
        return HardDrive;
    }

    public void setHardDrive(String HardDrive) {
        this.HardDrive = HardDrive;
    }

    public String getGraphics() {
        return Graphics;
    }

    public void setGraphics(String Graphics) {
        this.Graphics = Graphics;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public String getWeight() {
        return Weight;
    }

    public void setWeight(String Weight) {
        this.Weight = Weight;
    }

    public int getBuyed() {
        return Buyed;
    }

    public void setBuyed(int Buyed) {
        this.Buyed = Buyed;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String Img) {
        this.Img = Img;
    }
    
    public String getTitle(){
        if (Name.length()>21){
            return Name.substring(0, 21);
        }
        return Name;
    }
    

    
                 
}
