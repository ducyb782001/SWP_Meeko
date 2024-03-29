/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Order;

import Controllers.ReloadController;
import DAL.OrderDAO;
import DAL.OrderDetailsDAO;
import DAL.ProductDAO;
import Model.Order;
import Model.OrderDetails;
import Model.PaymentMethod;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class OrderCustomer extends ReloadController {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);

        ProductDAO pDao = new ProductDAO();

        double totalPrice = 0.0;
        int totalProduct = 0;

        ArrayList<OrderDetails> cart = new ArrayList<>();

        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");

        HttpSession sesion = request.getSession();

        User acc = (User) sesion.getAttribute("account");
        //declare cookies
        String cookieName = "cart";
        if (acc != null) {
            cookieName += acc.getUserID();
        }

        // Get the cookies from the request
        Cookie[] cookies = request.getCookies();
        String cartValue = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    cartValue = cookie.getValue();
                }
            }
        }

        //check if cookies exist or not
        if (!cartValue.equals("")) {
            String[] products = cartValue.split("_");
            for (String product : products) {
                //check the length of the product cookie
                if (product.length() != 0) {
                    String[] proQua = product.split("-");
                    OrderDetails order = new OrderDetails();
                    Product pro = pDao.getProductDetailsByID(Integer.parseInt(proQua[0]));

                    //check quantity of product
                    int quantityBuy = Integer.parseInt(proQua[1]);
                    if (quantityBuy > pro.getQuantity()) {
                        quantityBuy = pro.getQuantity();
                        request.setAttribute("overQuantity", "true");
                    }
                    if (!pro.isStatus()) {
                        quantityBuy = 0;
                        request.setAttribute("overQuantity", "true");
                    }

                    order.setProduct(pro);
                    order.setQuantity(quantityBuy);
                    cart.add(order);

                    totalPrice += pro.getPrice() * order.getQuantity();
                    totalProduct += order.getQuantity();
                }
            }

        }

        if (account == null) {
            request.getSession().setAttribute("notLogin", "True");
            response.sendRedirect("home");
        } else if (cartValue.trim().equalsIgnoreCase("")) {
            request.getSession().setAttribute("emptyCart", "True");
            response.sendRedirect("home");
        } else {
            request.getSession().setAttribute("cart", cart);
            request.getSession().setAttribute("totalPrice", totalPrice);
            request.getSession().setAttribute("totalProduct", totalProduct);
            request.getRequestDispatcher("views/Order/OrderCustomer.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO pDao = new ProductDAO();
        OrderDetailsDAO odDao = new OrderDetailsDAO();

        //insert order
        String customerEmail = request.getParameter("email");
        String customerPhone = request.getParameter("phone");
        String customerFullName = request.getParameter("fullName");
        String customerAddress = request.getParameter("address");
        int paymentMethodID = Integer.parseInt(request.getParameter("payment"));

        Order order = new Order();
        order.setCustomerEmail(customerEmail);
        order.setCustomerPhone(customerPhone);
        order.setCustomerName(customerFullName);
        order.setCustomerAddress(customerAddress);

        PaymentMethod payment = new PaymentMethod();
        payment.setPaymentId(paymentMethodID);

        order.setPaymentMethod(payment);

        User account = (User) request.getSession().getAttribute("account");
        order.setOrderFromUser(account);

        Date currentDate = new Date(System.currentTimeMillis());
        order.setDateTime(currentDate);

        order.setTotalOrder(Double.parseDouble(request.getParameter("totalOrder")));

        OrderDAO oDao = new OrderDAO();

        int orderID = oDao.getMaxID();
        orderID++;

        order.setOrderId(orderID);

        oDao.insert(order);
        ///////////////////////////////

        //insert order details
        ArrayList<OrderDetails> cart = new ArrayList<>();
        String cookieName = "cart" + account.getUserID();
        // Get the cookies from the request
        Cookie[] cookies = request.getCookies();
        String cartValue = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    cartValue = cookie.getValue();
                }
            }
        }

        //check if cookies exist or not
        if (!cartValue.equals("")) {
            String[] products = cartValue.split("_");
            for (String product : products) {
                //check the length of the product cookie
                if (product.length() != 0) {
                    String[] proQua = product.split("-");
                    OrderDetails orderDetails = new OrderDetails();
                    Product pro = pDao.getProductDetailsByID(Integer.parseInt(proQua[0]));

                    //check quantity of product
                    int quantityBuy = Integer.parseInt(proQua[1]);
                    if (quantityBuy > pro.getQuantity()) {
                        quantityBuy = pro.getQuantity();
                        request.setAttribute("overQuantity", "true");
                    }
                    if (!pro.isStatus()) {
                        quantityBuy = 0;
                        request.setAttribute("overQuantity", "true");
                    }

                    orderDetails.setProduct(pro);
                    orderDetails.setQuantity(quantityBuy);
                    cart.add(orderDetails);
                }
            }

        }

        for (OrderDetails orderDetails : cart) {
            if (orderDetails.getQuantity() != 0) {
                orderDetails.setOrder(order);
                odDao.insert(orderDetails);
            }
        }

        //clear cookies
        String priceName = "totalP" + account.getUserID();
        Cookie cookieOrder = new Cookie(cookieName, "");
        Cookie cookiePrice = new Cookie(priceName, "");
        cookieOrder.setMaxAge(0);
        cookiePrice.setMaxAge(0);
        response.addCookie(cookieOrder);
        response.addCookie(cookiePrice);

        request.getSession().setAttribute("orderStatus", "True");
        response.sendRedirect("home");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

//    public static void main(String[] args) {
//        
//        OrderDAO oDao = new OrderDAO();
//
//        int orderID = oDao.getMaxID();
//        orderID++;
//        
//        User user = new User();
//        user.setUserID(18);
//        
//        Order order = new Order(orderID, user, "HI Hi", "Khongco@gmail.com", "0987654321", "asdfa32 423234", null, new Date(System.currentTimeMillis()), new PaymentMethod(1, "", true), 320, 1);
//        oDao.insert(order);
//    }
}
