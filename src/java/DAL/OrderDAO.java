/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Order;
import Model.PaymentMethod;
import Model.StatusOrder;
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
public class OrderDAO extends DBContext {

    public void insert(Order order) {

        try {
            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([OrderID]\n"
                    + "           ,[OrderFromUser]\n"
                    + "           ,[Customer_Name]\n"
                    + "           ,[Customer_Email]\n"
                    + "           ,[Customer_Phone]\n"
                    + "           ,[Customer_Address]\n"
                    + "           ,[DateTime]\n"
                    + "           ,[PaymentMethod]\n"
                    + "           ,[TotalOrder]\n"
                    + "           ,[Status])\n"
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
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, order.getOrderId());
            stm.setInt(2, order.getOrderFromUser().getUserID());
            stm.setString(3, order.getCustomerName());
            stm.setString(4, order.getCustomerEmail());
            stm.setString(5, order.getCustomerPhone());
            stm.setString(6, order.getCustomerAddress());
            stm.setDate(7, order.getDateTime());
            stm.setInt(8, order.getPaymentMethod().getPaymentId());
            stm.setDouble(9, order.getTotalOrder());
            stm.setInt(10, 1);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public int getMaxID() {
        try {
            String sql = "SELECT Max(OrderID) as 'max'\n"
                    + "  FROM [Orders]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("max");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Order> getOrdersByUser(int userID) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            UserDAO uDao = new UserDAO();
            String sql = "  SELECT *\n"
                    + "  FROM [Orders] where OrderFromUser = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();

            StatusOrderDAO stDao = new StatusOrderDAO();

            while (rs.next()) {
                User fromUser = new User();
                fromUser.setUserID(userID);

                StatusOrder status = stDao.getStatusOrderByID(rs.getInt("Status"));

                PaymentMethodDAO pmDao = new PaymentMethodDAO();
                PaymentMethod pm = pmDao.getPaymentByID(rs.getInt("PaymentMethod"));

                list.add(new Order(rs.getInt("OrderID"),
                        fromUser,
                        rs.getString("Customer_Name"),
                        rs.getString("Customer_Email"),
                        rs.getString("Customer_Phone"),
                        rs.getString("Customer_Address"),
                        null,
                        rs.getDate("DateTime"),
                        pm,
                        rs.getDouble("TotalOrder"),
                        status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Order getOrderByID(int orderId) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Orders] Where OrderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();

            StatusOrderDAO stDao = new StatusOrderDAO();

            while (rs.next()) {
                User fromUser = new User();
                fromUser.setUserID(rs.getInt("OrderFromUser"));

                StatusOrder status = stDao.getStatusOrderByID(rs.getInt("Status"));

                PaymentMethodDAO pmDao = new PaymentMethodDAO();
                PaymentMethod pm = pmDao.getPaymentByID(rs.getInt("PaymentMethod"));

                return new Order(rs.getInt("OrderID"),
                        fromUser,
                        rs.getString("Customer_Name"),
                        rs.getString("Customer_Email"),
                        rs.getString("Customer_Phone"),
                        rs.getString("Customer_Address"),
                        null,
                        rs.getDate("DateTime"),
                        pm,
                        rs.getDouble("TotalOrder"),
                        status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Order> getOrderByStatus(int offset, int recordsPerPage, int StatusOrderPending) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
            String sql = "SELECT *\n"
                    + "  FROM [Orders]\n"
                    + "  Where Status = ?\n";
            setter.put(++count, StatusOrderPending);

            sql += "  Order by OrderID\n"
                    + "  offset ? Row\n"
                    + "  Fetch next ? rows only";
            setter.put(++count, offset);
            setter.put(++count, recordsPerPage);

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();

            StatusOrderDAO stDao = new StatusOrderDAO();
            UserDAO uDao = new UserDAO();

            while (rs.next()) {
                User fromUser = uDao.getUserByID(rs.getInt("OrderFromUser"));

                StatusOrder status = stDao.getStatusOrderByID(rs.getInt("Status"));

                PaymentMethodDAO pmDao = new PaymentMethodDAO();
                PaymentMethod pm = pmDao.getPaymentByID(rs.getInt("PaymentMethod"));

                list.add(new Order(rs.getInt("OrderID"),
                        fromUser,
                        rs.getString("Customer_Name"),
                        rs.getString("Customer_Email"),
                        rs.getString("Customer_Phone"),
                        rs.getString("Customer_Address"),
                        null,
                        rs.getDate("DateTime"),
                        pm,
                        rs.getDouble("TotalOrder"),
                        status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void setStatusOrder(int id, int statusOrder) {
        try {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "   SET [Status] = ?\n"
                    + " WHERE OrderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusOrder);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        OrderDAO oDao = new OrderDAO();
        oDao.setStatusOrder(13, 2);
    }

    public int getNoOfRecords(int statusOrder) {
        try {
            String sql = "SELECT COUNT(*) as 'total'\n"
                    + "  FROM [Orders]\n"
                    + "  Where Status = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusOrder);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<Order> getOrderByStatusExceptPending(int offset, int recordsPerPage) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
            String sql = "SELECT *\n"
                    + "  FROM [Orders]\n"
                    + "  Where Status != 1\n";

            sql += "  Order by OrderID\n"
                    + "  offset ? Row\n"
                    + "  Fetch next ? rows only";
            setter.put(++count, offset);
            setter.put(++count, recordsPerPage);

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();

            StatusOrderDAO stDao = new StatusOrderDAO();
            UserDAO uDao = new UserDAO();

            while (rs.next()) {
                User fromUser = uDao.getUserByID(rs.getInt("OrderFromUser"));

                StatusOrder status = stDao.getStatusOrderByID(rs.getInt("Status"));

                PaymentMethodDAO pmDao = new PaymentMethodDAO();
                PaymentMethod pm = pmDao.getPaymentByID(rs.getInt("PaymentMethod"));

                list.add(new Order(rs.getInt("OrderID"),
                        fromUser,
                        rs.getString("Customer_Name"),
                        rs.getString("Customer_Email"),
                        rs.getString("Customer_Phone"),
                        rs.getString("Customer_Address"),
                        null,
                        rs.getDate("DateTime"),
                        pm,
                        rs.getDouble("TotalOrder"),
                        status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getNoOfRecordsExceptPending() {
        try {
            String sql = "SELECT COUNT(*) as 'total'\n"
                    + "  FROM [Orders]\n"
                    + "  Where Status != 1";
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
