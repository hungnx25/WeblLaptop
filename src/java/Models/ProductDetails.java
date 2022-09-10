/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class ProductDetails {
    private String ProId;
    private String ImgLink;
    private String Description;
    

    public ProductDetails() {
    }

    public ProductDetails(String ProId, String ImgLink, String Description) {
        this.ProId = ProId;
        this.ImgLink = ImgLink;
        this.Description = Description;
    }

    public String getProId() {
        return ProId;
    }

    public void setProId(String ProId) {
        this.ProId = ProId;
    }

    public String getImgLink() {
        return ImgLink;
    }

    public void setImgLink(String ImgLink) {
        this.ImgLink = ImgLink;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    
    
}
