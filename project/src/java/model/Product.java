/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PV
 */
public class Product {

    private int id;
    private String name;
    private String description;
    private double price;
    private String release_date;
    private int quantity;
    private String url_img, url_img2, url_img3;
    private int categoryID;

    public Product() {
    }

    public Product(String name, String description, double price, int categoryID) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.categoryID = categoryID;
    }
    
    

    public Product(String name, String description, double price, String url_img, int categoryID) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.url_img = url_img;
        this.categoryID = categoryID;
    }
    
    

    public Product(String name, String description, double price, String url_img) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.url_img = url_img;
    }

    public Product(int id, String name, String description, double price, String release_date, int quantity, String url_img, String url_img2, String url_img3) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.release_date = release_date;
        this.quantity = quantity;
        this.url_img = url_img;
        this.url_img2 = url_img2;
        this.url_img3 = url_img3;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRelease_date() {
        return release_date;
    }

    public void setRelease_date(String release_date) {
        this.release_date = release_date;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUrl_img() {
        return url_img;
    }

    public void setUrl_img(String url_img) {
        this.url_img = url_img;
    }

    public String getUrl_img2() {
        return url_img2;
    }

    public void setUrl_img2(String url_img2) {
        this.url_img2 = url_img2;
    }

    public String getUrl_img3() {
        return url_img3;
    }

    public void setUrl_img3(String url_img3) {
        this.url_img3 = url_img3;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", release_date=" + release_date + ", quantity=" + quantity + ", url_img=" + url_img + ", url_img2=" + url_img2 + ", url_img3=" + url_img3 + '}';
    }

}
