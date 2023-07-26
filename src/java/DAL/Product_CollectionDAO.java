/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class Product_CollectionDAO extends DBContext{
    public void insert(int productID, int collectionID) {
        try {
            String sql = "INSERT INTO [dbo].[Product_Collection]\n"
                    + "           ([ProductId]\n"
                    + "           ,[CollectionId]\n"
                    + "           ,[DeleteFlag])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setInt(2, collectionID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Product_CollectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
