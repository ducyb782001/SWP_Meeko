/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author dell
 */
public class Product {
    private String productId;
    private String name;
    private double price;
    private int quantity;
    private boolean status;
    private String className;
    private String classValue;
    private Product productParent;
    private Category category;
    private boolean isParent;

    public Product() {
    }

    public Product(String productId, String name, double price, int quantity, boolean status, String className, String classValue, Product productParent, Category category, boolean isParent) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.className = className;
        this.classValue = classValue;
        this.productParent = productParent;
        this.category = category;
        this.isParent = isParent;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getClassValue() {
        return classValue;
    }

    public void setClassValue(String classValue) {
        this.classValue = classValue;
    }

    public Product getProductParent() {
        return productParent;
    }

    public void setProductParent(Product productParent) {
        this.productParent = productParent;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isIsParent() {
        return isParent;
    }

    public void setIsParent(boolean isParent) {
        this.isParent = isParent;
    }
    
    
}
