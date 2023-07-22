/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.ImageProduct;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class ImageProductDAO extends DBContext {

    public ArrayList<ImageProduct> getImageByProductID(int productID, boolean deleteFlag) {
        ArrayList<ImageProduct> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Image_Product]\n"
                    + "  where ProductID = ? and deleteFlag = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setBoolean(2, deleteFlag);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new ImageProduct(productID,
                        rs.getString("image"),
                        deleteFlag));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<ImageProduct> getAllImageByProductID(int productID, boolean deleteFlag) {
        ArrayList<ImageProduct> list = new ArrayList<>();
        try {
            String sql = "SELECT img.*\n"
                    + "FROM [Products] p\n"
                    + "left join Image_Product img\n"
                    + "on p.ProductId = img.productID\n"
                    + "Where (p.ProductId = ? or ParentId = ?)\n"
                    + "and img.deleteFlag = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setInt(2, productID);
            stm.setBoolean(3, deleteFlag);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new ImageProduct(productID,
                        rs.getString("image"),
                        deleteFlag));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insert(ImageProduct image) {
        try {
            String sql = "INSERT INTO [dbo].[Image_Product]\n"
                    + "           ([ProductID]\n"
                    + "           ,[image]\n"
                    + "           ,[deleteFlag])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, image.getProductID());
            stm.setString(2, image.getImage());
            stm.setBoolean(3, image.isDeleteFlag());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int productID) {
        try {
            String sql = "DELETE FROM [dbo].[Image_Product]\n"
                    + "      WHERE ProductID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
