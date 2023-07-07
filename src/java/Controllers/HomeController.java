/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Controllers.Order.OrderDetail;
import DAL.BestSellerDAO;
import DAL.CategoryDAO;
import DAL.CollectionDAO;
import DAL.NewArrivalDAO;
import DAL.ProductDAO;
import DAL.TagDAO;
import Model.BestSeller;
import Model.Category;
import Model.Collection;
import Model.NewArrival;
import Model.Order;
import Model.OrderDetails;
import Model.Product;
import Model.Tag;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author dell
 */
public class HomeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double totalPrice = 0.0;
        
        HttpSession sesion = request.getSession();

        CollectionDAO clDao = new CollectionDAO();
        ProductDAO pDao = new ProductDAO();
        TagDAO tDao = new TagDAO();
        NewArrivalDAO naDao = new NewArrivalDAO();

        String regiester = (String) sesion.getAttribute("register");

        User acc = (User) sesion.getAttribute("account");

        ArrayList<OrderDetails> cart = new ArrayList<>();

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
                    Product pro = pDao.getProductByID(Integer.parseInt(proQua[0]), true);
                    order.setProduct(pro);
                    order.setQuantity(Integer.parseInt(proQua[1]));
                    cart.add(order);

                    totalPrice += pro.getPrice() * order.getQuantity();
                }
            }

        }
//        
        for (OrderDetails orderDetails : cart) {
            response.getWriter().println(orderDetails.getProduct().getProductId() + "-" + orderDetails.getQuantity());
        }

        //get all collection
        ArrayList<Collection> collections = clDao.getAllCollection(true);

        ArrayList<Tag> tags = tDao.getAll();

        //get all categories belong to tag
        for (Tag tag : tags) {
            CategoryDAO cDao = new CategoryDAO();
            ArrayList<Category> categories = cDao.getAllByTagID(tag.getTagId());
            tag.setCategories(categories);
        }

        //get all new arrival product
        ArrayList<NewArrival> newArrivals = naDao.getAllNew(false, true);

        //get all best seller product
        BestSellerDAO bDao = new BestSellerDAO();
        ArrayList<BestSeller> bestSellers = bDao.getAllNew(false, true);

        if (regiester != null) {
            request.setAttribute("msg", "Bạn đã đăng ký tài khoản thành công!");
            sesion.setAttribute("register", null);
        }

        Cookie priceCookie = new Cookie("totalP", String.valueOf(totalPrice));
        response.addCookie(priceCookie);

        request.getSession().setAttribute("tags", tags);
        request.getSession().setAttribute("cart", cart);
        request.getSession().setAttribute("totalPrice", totalPrice);
        request.getSession().setAttribute("bestSellers", bestSellers);
        request.getSession().setAttribute("bestSellers", bestSellers);
        request.getSession().setAttribute("collections", collections);
        request.getSession().setAttribute("newArrivals", newArrivals);
        request.getRequestDispatcher("views/HomePage.jsp").forward(request, response);
    }
//    
//
//    public static void main(String[] args) {
//        double a = 22222.000;
//        System.out.println(String.valueOf(a));
//    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
