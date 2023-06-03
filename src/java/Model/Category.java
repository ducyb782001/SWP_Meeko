/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author dell
 */
public class Category {
    private int categoryId;
    private String categoryName;
    private boolean status;
    private String description;
    private boolean isParent;
    private Category parent;
    

    public Category() {
    }

    public Category(int categoryId, String categoryName, boolean status, String description, boolean isParent, Category parent) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.status = status;
        this.description = description;
        this.isParent = isParent;
        this.parent = parent;
    }

    public Category(int categoryId, String categoryName, boolean status, String description) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.status = status;
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isIsParent() {
        return isParent;
    }

    public void setIsParent(boolean isParent) {
        this.isParent = isParent;
    }

    public Category getParent() {
        return parent;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }
    
    
}
