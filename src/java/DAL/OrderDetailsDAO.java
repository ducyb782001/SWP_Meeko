/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Order;
import Model.OrderDetails;
import Model.Product;
import Model.StatusOrder;
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
public class OrderDetailsDAO extends DBContext {

    public void insert(OrderDetails orderDetails) {
        try {
            String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                    + "           ([OrderId]\n"
                    + "           ,[ProductId]\n"
                    + "           ,[Quantity])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderDetails.getOrder().getOrderId());
            stm.setInt(2, orderDetails.getProduct().getProductId());
            stm.setInt(3, orderDetails.getQuantity());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
