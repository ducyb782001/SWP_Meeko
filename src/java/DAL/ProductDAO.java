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
import java.util.HashMap;
import java.util.Map;

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
                    product.setAvatar(rs.getString("avatar"));
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

    public ArrayList<Product> getAllProduct(boolean status) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Products] Where Status = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, status);
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
                    product = new Product();
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
                    product.setAvatar(rs.getString("avatar"));
                    list.add(product);
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Product> getAllProduct(int offset, int recordsPerPage,
            int collectionID, int subcategoryID, int categoryID, String textSearch,
            double minPrice, double maxPrice, boolean status) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 1;
            String sql = "SELECT p.*\n"
                    + "  FROM [Products] p\n"
                    + "  left join Product_Collection pc\n"
                    + "  on pc.ProductId = p.ProductId\n"
                    + "  left join Collections c\n"
                    + "  on c.CollectionID = pc.CollectionId\n"
                    + "  left join Categories cg \n"
                    + "  on cg.CategoryID = p.ProductId\n"
                    + "  left join Categories parentCg\n"
                    + "  on parentCg.CategoryID = cg.ParentID\n"
                    + "Where p.IsParent = 1 and p.Status = ?\n"
                    + "  and p.Price >= ? and p.Price <= ?\n";
            setter.put(count, status);
            setter.put(++count, minPrice);
            setter.put(++count, maxPrice);

            if (collectionID != -1) {
                sql += "  and c.CollectionID = ?";
                setter.put(++count, collectionID);
            }
            if (subcategoryID != -1) {
                sql += " and CategoryId = ?";
                setter.put(++count, categoryID);
            }
            if (categoryID != -1) {
                sql += "   and  parentCg.CategoryID = ?";
                setter.put(++count, categoryID);
            }
            if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                textSearch = "%" + textSearch + "%";
                sql += " and Name like ?";
                setter.put(++count, textSearch);
            }

            sql += " order by ProductId\n"
                    + "  offset ? ROW\n"
                    + "  FETCH Next ? Rows only";
            setter.put(++count, offset);
            setter.put(++count, recordsPerPage);

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();
            Product product = new Product();
            TypeDAO tDao = new TypeDAO();
            CategoryDAO cDao = new CategoryDAO();
            Category category = new Category();
            while (rs.next()) {
                Type type = tDao.getTypeByID(rs.getInt("ClassType"));

                category = cDao.getCategoryByID(rs.getInt("CategoryId"));

                product = new Product();
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
                product.setAvatar(rs.getString("avatar"));

                list.add(product);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getNoOfRecords(int collectionID, int subcategoryID,
            int categoryID, String textSearch, double minPrice, double maxPrice, boolean status) {
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 1;
            String sql = "SELECT Count(*) as 'total'\n"
                    + "FROM [Products] p\n"
                    + "  left join Product_Collection pc\n"
                    + "  on pc.ProductId = p.ProductId\n"
                    + "  left join Collections c\n"
                    + "  on c.CollectionID = pc.CollectionId\n"
                    + "  left join Categories cg \n"
                    + "  on cg.CategoryID = p.ProductId\n"
                    + "  left join Categories parentCg\n"
                    + "  on parentCg.CategoryID = cg.ParentID\n"
                    + "Where p.IsParent = 1 and p.Status = ?\n"
                    + "  and p.Price >= ? and p.Price <= ?\n";
            setter.put(count, status);
            setter.put(++count, minPrice);
            setter.put(++count, maxPrice);

            if (collectionID != -1) {
                sql += "  and c.CollectionID = ?";
                setter.put(++count, collectionID);
            }
            if (subcategoryID != -1) {
                sql += " and CategoryId = ?";
                setter.put(++count, categoryID);
            }
            if (categoryID != -1) {
                sql += "   and  parentCg.CategoryID = ?";
                setter.put(++count, categoryID);
            }
            if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                textSearch = "%" + textSearch + "%";
                sql += " and Name like ?";
                setter.put(++count, textSearch);
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
