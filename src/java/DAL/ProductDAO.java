/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import Model.Constants;
import Model.ImageProduct;
import Model.Product;
import Model.Type;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class ProductDAO extends DBContext {

    public Product getProductByID(int productID, boolean status) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Products] Where (ProductId = ? or ParentId = ?) and Status = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setInt(2, productID);
            stm.setBoolean(3, status);
            ResultSet rs = stm.executeQuery();

            TypeDAO tDao = new TypeDAO();
            CategoryDAO cDao = new CategoryDAO();
            ImageProductDAO imageDao = new ImageProductDAO();

            Product product = new Product();
            Category category = new Category();
            ArrayList<ImageProduct> listImage;

            while (rs.next()) {

                Type type = tDao.getTypeByID(rs.getInt("ClassType"));

                category = cDao.getCategoryByID(rs.getInt("CategoryId"));

                boolean isParent = rs.getBoolean("IsParent");
                if (isParent) {
                    listImage = new ArrayList<>();
                    product.setProductId(rs.getInt("ProductId"));
                    product.setName(rs.getString("Name"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setQuantity(rs.getInt("Quantity"));
                    product.setStatus(rs.getBoolean("Status"));
                    product.setClassType(type);
                    product.setClassValue(rs.getString("ClassValue"));
                    product.setCreateDate(rs.getDate("createDate"));
                    product.setCategory(category);
                    product.setIsParent(isParent);
                    product.setDescription(rs.getString("Description"));

                    listImage = imageDao.getImageByProductID(product.getProductId(), Constants.DeleteFalse);
                    product.setImages(listImage);
                } else {
                    Product children = new Product(
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
                            isParent,
                            rs.getString("Description"));
                    listImage = new ArrayList<>();
                    listImage = imageDao.getImageByProductID(product.getProductId(), Constants.DeleteFalse);
                    children.setImages(listImage);
                    product.getChildren().add(children);
                }

            }
            return product;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Product getProductByID(int productID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Products] Where ProductId = ? or ParentId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setInt(2, productID);
            ResultSet rs = stm.executeQuery();

            TypeDAO tDao = new TypeDAO();
            CategoryDAO cDao = new CategoryDAO();
            ImageProductDAO imageDao = new ImageProductDAO();

            Product product = new Product();
            Category category = new Category();
            ArrayList<ImageProduct> listImage;

            while (rs.next()) {

                Type type = tDao.getTypeByID(rs.getInt("ClassType"));

                category = cDao.getCategoryByID(rs.getInt("CategoryId"));

                boolean isParent = rs.getBoolean("IsParent");
                if (isParent) {
                    listImage = new ArrayList<>();
                    product.setProductId(rs.getInt("ProductId"));
                    product.setName(rs.getString("Name"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setQuantity(rs.getInt("Quantity"));
                    product.setStatus(rs.getBoolean("Status"));
                    product.setClassType(type);
                    product.setClassValue(rs.getString("ClassValue"));
                    product.setCreateDate(rs.getDate("createDate"));
                    product.setCategory(category);
                    product.setIsParent(isParent);
                    product.setDescription(rs.getString("Description"));

                    listImage = imageDao.getImageByProductID(product.getProductId(), Constants.DeleteFalse);
                    product.setImages(listImage);
                } else {
                    Product children = new Product(
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
                            isParent,
                            rs.getString("Description"));
                    listImage = new ArrayList<>();
                    listImage = imageDao.getImageByProductID(product.getProductId(), Constants.DeleteFalse);
                    children.setImages(listImage);
                    product.getChildren().add(children);
                }

            }
            return product;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Product getProductDetailsByID(int productID, boolean status) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Products] Where ProductId = ? and Status = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setBoolean(2, status);
            ResultSet rs = stm.executeQuery();

            TypeDAO tDao = new TypeDAO();
            CategoryDAO cDao = new CategoryDAO();
            ImageProductDAO imageDao = new ImageProductDAO();

            Product product = new Product();
            Category category = new Category();
            ArrayList<ImageProduct> listImage;

            if (rs.next()) {

                Type type = tDao.getTypeByID(rs.getInt("ClassType"));

                category = cDao.getCategoryByID(rs.getInt("CategoryId"));

                boolean isParent = rs.getBoolean("IsParent");
                listImage = new ArrayList<>();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getDouble("Price"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setStatus(rs.getBoolean("Status"));
                product.setClassType(type);
                product.setClassValue(rs.getString("ClassValue"));
                product.setCreateDate(rs.getDate("createDate"));
                product.setCategory(category);
                product.setIsParent(isParent);
                product.setDescription(rs.getString("Description"));

                listImage = imageDao.getImageByProductID(product.getProductId(), Constants.DeleteFalse);
                product.setImages(listImage);
                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Product> getAllProductParent(int offset, int recordsPerPage,
            int collectionID, int categoryID, int tagID, String textSearch,
            double minPrice, double maxPrice, boolean status, int sortOption) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 1;
            String sql = "SELECT Distinct p.Name\n"
                    + "FROM [Products] p\n"
                    + "left join Product_Collection pc\n"
                    + "on pc.ProductId = p.ProductId\n"
                    + "left join Collections c\n"
                    + "on c.CollectionID = pc.CollectionId\n"
                    + "left join Categories cg\n"
                    + "on cg.CategoryID = p.CategoryId\n"
                    + "left join Tags t\n"
                    + "on t.TagId = cg.TagId\n"
                    + "Where p.IsParent = 1 and p.Status = ? and p.DeleteFlag = 0\n"
                    + "and p.Price >= ? and p.Price <= ?\n";
            setter.put(count, status);
            setter.put(++count, minPrice);
            setter.put(++count, maxPrice);

            if (collectionID != -1) {
                sql += "  and c.CollectionID = ?";
                setter.put(++count, collectionID);
            }
            if (categoryID != -1) {
                sql += " and p.CategoryId = ?";
                setter.put(++count, categoryID);
            }
            if (tagID != -1) {
                sql += " and t.TagId = ?";
                setter.put(++count, tagID);
            }
            if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                textSearch = "%" + textSearch + "%";
                sql += " and Name like ?";
                setter.put(++count, textSearch);
            }

            sql = "Select Products.* from Products\n"
                    + "right join\n"
                    + "(" + sql;

            sql += ") as pro\n"
                    + "on pro.Name = Products.Name\n"
                    + "Where IsParent = 1\n";

            switch (sortOption) {
                case -1:
                    sql += " order by ProductId\n";
                    break;
                case 1:
                    sql += " order by Name asc\n";
                    break;
                case 2:
                    sql += " order by Name desc\n";
                    break;
                case 3:
                    sql += " order by Price asc\n";
                    break;
                case 4:
                    sql += " order by Price desc\n";
                    break;
            }
            sql += "  offset ? ROW\n"
                    + "  FETCH Next ? Rows only";
            setter.put(++count, offset);
            setter.put(++count, recordsPerPage);

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();

            Product product = new Product();

            while (rs.next()) {
                product = getProductByID(rs.getInt("ProductId"));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getNoOfRecordsParent(int collectionID, int categoryID,
            int tagID, String textSearch, double minPrice, double maxPrice, boolean status) {
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 1;
            String sql = "SELECT Distinct p.Name\n"
                    + "FROM [Products] p\n"
                    + "left join Product_Collection pc\n"
                    + "on pc.ProductId = p.ProductId\n"
                    + "left join Collections c\n"
                    + "on c.CollectionID = pc.CollectionId\n"
                    + "left join Categories cg\n"
                    + "on cg.CategoryID = p.CategoryId\n"
                    + "left join Tags t\n"
                    + "on t.TagId = cg.TagId\n"
                    + "Where p.IsParent = 1 and p.Status = ? and p.DeleteFlag = 0\n"
                    + "and p.Price >= ? and p.Price <= ?\n";
            setter.put(count, status);
            setter.put(++count, minPrice);
            setter.put(++count, maxPrice);

            if (collectionID != -1) {
                sql += "  and c.CollectionID = ?";
                setter.put(++count, collectionID);
            }
            if (categoryID != -1) {
                sql += " and p.CategoryId = ?";
                setter.put(++count, categoryID);
            }
            if (tagID != -1) {
                sql += " and t.TagId = ?";
                setter.put(++count, tagID);
            }
            if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                textSearch = "%" + textSearch + "%";
                sql += " and Name like ?";
                setter.put(++count, textSearch);
            }

            sql = "Select count(*) as 'total' from Products\n"
                    + "right join\n"
                    + "(" + sql;

            sql += ") as pro\n"
                    + "on pro.Name = Products.Name\n"
                    + "Where IsParent = 1\n";

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
        return 0;
    }

    public ArrayList<Product> getAllProductParent(int offset, int recordsPerPage,
            int collectionID, int categoryID, int tagID, String textSearch,
            double minPrice, double maxPrice, int sortOption) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
            String sql = "SELECT Distinct p.Name\n"
                    + "FROM [Products] p\n"
                    + "left join Product_Collection pc\n"
                    + "on pc.ProductId = p.ProductId\n"
                    + "left join Collections c\n"
                    + "on c.CollectionID = pc.CollectionId\n"
                    + "left join Categories cg\n"
                    + "on cg.CategoryID = p.CategoryId\n"
                    + "left join Tags t\n"
                    + "on t.TagId = cg.TagId\n"
                    + "Where p.IsParent = 1\n"
                    + "and p.Price >= ? and p.Price <= ? and p.DeleteFlag = 0\n";
            setter.put(++count, minPrice);
            setter.put(++count, maxPrice);

            if (collectionID != -1) {
                sql += "  and c.CollectionID = ?";
                setter.put(++count, collectionID);
            }
            if (categoryID != -1) {
                sql += " and p.CategoryId = ?";
                setter.put(++count, categoryID);
            }
            if (tagID != -1) {
                sql += " and t.TagId = ?";
                setter.put(++count, tagID);
            }
            if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                textSearch = "%" + textSearch + "%";
                sql += " and Name like ?";
                setter.put(++count, textSearch);
            }

            sql = "Select Products.* from Products\n"
                    + "right join\n"
                    + "(" + sql;

            sql += ") as pro\n"
                    + "on pro.Name = Products.Name\n"
                    + "Where IsParent = 1\n";

            switch (sortOption) {
                case -1:
                    sql += " order by ProductId\n";
                    break;
                case 1:
                    sql += " order by Name asc\n";
                    break;
                case 2:
                    sql += " order by Name desc\n";
                    break;
                case 3:
                    sql += " order by Price asc\n";
                    break;
                case 4:
                    sql += " order by Price desc\n";
                    break;
            }
            sql += "  offset ? ROW\n"
                    + "  FETCH Next ? Rows only";
            setter.put(++count, offset);
            setter.put(++count, recordsPerPage);

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();
            Product product = new Product();

            while (rs.next()) {
                product = getProductByID(rs.getInt("ProductId"));

                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getNoOfRecordsParent(int collectionID, int categoryID,
            int tagID, String textSearch, double minPrice, double maxPrice) {
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
            String sql = "SELECT Distinct p.Name\n"
                    + "FROM [Products] p\n"
                    + "left join Product_Collection pc\n"
                    + "on pc.ProductId = p.ProductId\n"
                    + "left join Collections c\n"
                    + "on c.CollectionID = pc.CollectionId\n"
                    + "left join Categories cg\n"
                    + "on cg.CategoryID = p.CategoryId\n"
                    + "left join Tags t\n"
                    + "on t.TagId = cg.TagId\n"
                    + "Where p.IsParent = 1\n"
                    + "and p.Price >= ? and p.Price <= ? and p.DeleteFlag = 0\n";
            setter.put(++count, minPrice);
            setter.put(++count, maxPrice);

            if (collectionID != -1) {
                sql += "  and c.CollectionID = ?";
                setter.put(++count, collectionID);
            }
            if (categoryID != -1) {
                sql += " and p.CategoryId = ?";
                setter.put(++count, categoryID);
            }
            if (tagID != -1) {
                sql += " and t.TagId = ?";
                setter.put(++count, tagID);
            }
            if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                textSearch = "%" + textSearch + "%";
                sql += " and Name like ?";
                setter.put(++count, textSearch);
            }

            sql = "Select count(*) as 'total' from Products\n"
                    + "right join\n"
                    + "(" + sql;

            sql += ") as pro\n"
                    + "on pro.Name = Products.Name\n"
                    + "Where IsParent = 1\n";

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
        return 0;
    }

    public int getMaxProductID() {
        try {
            String sql = "SELECT Max(ProductId) as 'max'\n"
                    + "  FROM [Products] ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("max");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void insert(Product product) {
        try {
            String sql = "INSERT INTO [dbo].[Products]\n"
                    + "           ([ProductId]\n"
                    + "           ,[Name]\n"
                    + "           ,[Price]\n"
                    + "           ,[Quantity]\n"
                    + "           ,[Status]\n"
                    + "           ,[ClassType]\n"
                    + "           ,[ClassValue]\n"
                    + "           ,[createDate]\n"
                    + "           ,[ParentId]\n"
                    + "           ,[CategoryId]\n"
                    + "           ,[IsParent]\n"
                    + "           ,[Description]\n"
                    + "           ,[DeleteFlag])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product.getProductId());
            stm.setString(2, product.getName());
            stm.setDouble(3, product.getPrice());
            stm.setInt(4, product.getQuantity());
            stm.setBoolean(5, product.isStatus());
            try {
                stm.setInt(6, product.getClassType().getTypeID());
            } catch (Exception e) {
                stm.setObject(6, null);
            }
            stm.setString(7, product.getClassValue());
            stm.setDate(8, product.getCreateDate());
            try {
                stm.setInt(9, product.getClassType().getTypeID());
            } catch (Exception e) {
                stm.setObject(9, null);
            }
            stm.setInt(10, product.getCategory().getCategoryId());
            stm.setBoolean(11, product.isIsParent());
            stm.setString(12, product.getDescription());
            stm.setBoolean(13, false);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void delete(int productID) {
        try {
            String sql = "UPDATE [dbo].[Products]\n"
                    + "   SET [DeleteFlag] = 1\n"
                    + "       ,[Status] = 0\n"
                    + " WHERE ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update(Product product) {
        try {
            String sql = "UPDATE [dbo].[Products]\n"
                    + "   SET [Name] = ?\n"
                    + "      ,[Price] = ?\n"
                    + "      ,[Quantity] = ?\n"
                    + "      ,[Status] = ?\n"
                    + "      ,[CategoryId] = ?\n"
                    + "      ,[Description] = ?\n"
                    + " WHERE ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, product.getName());
            stm.setDouble(2, product.getPrice());
            stm.setInt(3, product.getQuantity());
            stm.setBoolean(4, product.isStatus());
            stm.setInt(5, product.getCategory().getCategoryId());
            stm.setString(6, product.getDescription());
            stm.setInt(7, product.getProductId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Product getProductDetailsByID(int productID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Products] where ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            ResultSet rs = stm.executeQuery();

            TypeDAO tDao = new TypeDAO();
            CategoryDAO cDao = new CategoryDAO();
            ImageProductDAO imageDao = new ImageProductDAO();

            Product product = new Product();
            Category category = new Category();
            ArrayList<ImageProduct> listImage;

            if (rs.next()) {

                Type type = tDao.getTypeByID(rs.getInt("ClassType"));

                category = cDao.getCategoryByID(rs.getInt("CategoryId"));

                listImage = new ArrayList<>();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getDouble("Price"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setStatus(rs.getBoolean("Status"));
                product.setClassType(type);
                product.setClassValue(rs.getString("ClassValue"));
                product.setCreateDate(rs.getDate("createDate"));
                product.setCategory(category);
                product.setIsParent(rs.getBoolean("IsParent"));
                product.setDescription(rs.getString("Description"));

                listImage = imageDao.getImageByProductID(product.getProductId(), Constants.DeleteFalse);
                product.setImages(listImage);

            }
            return product;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getTotalProduct() {
        try {
            String sql = "SELECT COUNT(*) as 'total'\n"
                    + "  FROM [Products]\n"
                    + "  Where IsParent = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
