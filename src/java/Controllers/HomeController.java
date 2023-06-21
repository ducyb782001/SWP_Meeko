/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.BestSellerDAO;
import DAL.CollectionDAO;
import DAL.NewArrivalDAO;
import Model.BestSeller;
import Model.Collection;
import Model.NewArrival;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

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
        HttpSession sesion = request.getSession();
        String regiester = (String) sesion.getAttribute("register");

        //get all collection
        CollectionDAO clDao = new CollectionDAO();
        ArrayList<Collection> collections = clDao.getAllCollection(true);

        //get all new arrival product
        NewArrivalDAO naDao = new NewArrivalDAO();
        ArrayList<NewArrival> newArrivals = naDao.getAllNew(false, true);
        
        BestSellerDAO bDao = new BestSellerDAO();
        ArrayList<BestSeller> bestSellers = bDao.getAllNew(false, true);
        
        if (regiester != null) {
            request.setAttribute("msg", "Bạn đã đăng ký tài khoản thành công!");
            sesion.setAttribute("register", null);
        }
        request.setAttribute("bestSellers", bestSellers);
        request.setAttribute("collections", collections);
        request.setAttribute("newArrivals", newArrivals);
        request.getRequestDispatcher("views/HomePage.jsp").forward(request, response);
    }
//    
//    public static void main(String[] args) {
//        BestSellerDAO bDao = new BestSellerDAO();
//        ArrayList<BestSeller> bestSellers = bDao.getAllNew(false, true);
//        System.out.println(bestSellers.get(0).getProduct().getAvatar());
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
