/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.BestSellerDAO;
import DAL.CategoryDAO;
import DAL.CollectionDAO;
import DAL.NewArrivalDAO;
import DAL.OrderDAO;
import DAL.OrderDetailsDAO;
import DAL.ProductDAO;
import DAL.TagDAO;
import Model.BestSeller;
import Model.Category;
import Model.Collection;
import Model.Constants;
import Model.NewArrival;
import Model.Order;
import Model.OrderDetails;
import Model.Product;
import Model.Tag;
import Model.User;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class ReloadController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        double totalPrice = 0.0;
        int totalProduct = 0;

        HttpSession sesion = request.getSession();
        ProductDAO pDao = new ProductDAO();
        OrderDetailsDAO odDao = new OrderDetailsDAO();

        User acc = (User) sesion.getAttribute("account");

        ArrayList<OrderDetails> cart = new ArrayList<>();

        //declare cookies
        String cookieName = "cart";
        String priceName = "totalP";
        if (acc != null) {
            cookieName += acc.getUserID();
            priceName += acc.getUserID();
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
                    order.setProduct(pro);
                    order.setQuantity(Integer.parseInt(proQua[1]));
                    cart.add(order);

                    totalPrice += pro.getPrice() * order.getQuantity();
                    totalProduct += order.getQuantity();
                }
            }

        }

        Cookie priceCookie = new Cookie(priceName, String.valueOf(totalPrice));
        response.addCookie(priceCookie);

        request.getSession().setAttribute("cart", cart);
        request.getSession().setAttribute("totalPrice", totalPrice);
        request.getSession().setAttribute("totalProduct", totalProduct);

        ArrayList<Order> orders = new ArrayList<>();
        //lay thong tin gio hang
        if (acc != null) {
            OrderDAO oDao = new OrderDAO();
            orders = oDao.getOrdersByUser(acc.getUserID());
            for (Order order : orders) {
                ArrayList<OrderDetails> orderDetails = odDao.getOrderDetailsByOrderID(order.getOrderId());
                order.setOrderDetails(orderDetails);
            }
        }
        request.getSession().setAttribute("orders", orders);

        TagDAO tDao = new TagDAO();
        ArrayList<Tag> tags = tDao.getAll();

        //get all categories belong to tag
        for (Tag tag : tags) {
            CategoryDAO cDao = new CategoryDAO();
            ArrayList<Category> categories = cDao.getAllByTagID(tag.getTagId());
            tag.setCategories(categories);
        }

        request.getSession().setAttribute("tags", tags);

        CollectionDAO cDao = new CollectionDAO();
        ArrayList<Collection> collections = cDao.getAllCollection(Constants.Active);
        request.getSession().setAttribute("collections", collections);
    }

    public static void main(String[] args) {
        ArrayList<Order> orderStatus = new ArrayList<>();
        OrderDAO oDao = new OrderDAO();
        orderStatus = oDao.getOrdersByUser(18);
    }
}
