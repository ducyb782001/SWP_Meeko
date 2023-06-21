/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import Model.NewArrival;
import Model.Product;
import Model.Type;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class ProductDAO extends DBContext {
    
    public Product getProductByID(int productID, boolean status) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Products] Where ProductId = ? or ParentId = ? and Status = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setInt(2, productID);
            stm.setBoolean(3, status);
            ResultSet rs = stm.executeQuery();
            Product product = new Product();
            TypeDAO tDao = new TypeDAO();
            CategoryDAO cDao = new CategoryDAO();
            Category category = new Category();
            while (rs.next()) {
                
                Type type = tDao.getTypeByID(rs.getInt("ClassType"));
                
                category = cDao.getCategoryByID(rs.getInt("CategoryId"));
                
                boolean isParent = rs.getBoolean("IsParent");
                if (isParent) {
                    product.setProductId(rs.getInt("ProductId"));
                    product.setName(rs.getString("Name"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setQuantity(rs.getInt("Quantity"));
                    product.setStatus(rs.getBoolean("Status"));
                    product.setClassType(type);
                    product.setClassValue(rs.getString("ClassValue"));
                    product.setCreateDate(rs.getDate("createDate"));
                    product.setCategory(category);
                    product.setIsParent(true);
                    product.setDescription(rs.getString("Description"));
                    product.setAvatar( rs.getString("avatar"));
                } else {
                    product.getChildren().add(new Product(
                            rs.getInt("ProductId"),
                            rs.getString("Name"),
                            rs.getDouble("Price"),
                            rs.getInt("Quantity"),
                            rs.getBoolean("Status"),
                            type,
                            rs.getString("ClassValue"),
                            rs.getDate("createDate"),
                            product,
                            category,
                            false,
                            rs.getString("Description"),
                            rs.getString("avatar")));
                }
                
            }
            return product;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
