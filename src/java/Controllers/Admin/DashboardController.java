/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import DAL.OrderDAO;
import DAL.ProductDAO;
import Model.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

/**
 *
 * @author dell
 */
public class DashboardController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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

        ProductDAO pDao = new ProductDAO();
        OrderDAO oDao = new OrderDAO();

        double totalMoney = oDao.getToTalMoney();

        LocalDate currentDate = LocalDate.now();
        int currentMonth = currentDate.getMonthValue();
        double totalMoneyByMonth = oDao.getToTalMoneyByMonth(currentMonth);

        //get total order 
        double totalOrder = oDao.getTotalOrder();
        double totalOrderFinish = oDao.getTotalOrder(Constants.StatusOrderFinish);
        double totalOrderCancel = oDao.getTotalOrder(Constants.StatusOrderCancel);
        double totalOrderFail = oDao.getTotalOrder(Constants.StatusOrderFail);

        float percentCancel = (float) Math.round((totalOrderCancel / totalOrder) * 100);
        float percentFinish = (float) Math.round((totalOrderFinish / totalOrder) * 100);
        float percentFail = (float) Math.round((totalOrderFail / totalOrder) * 100);
        
        
        //get total product
        int totalProduct = pDao.getTotalProduct();

        request.setAttribute("totalProduct", totalProduct);

        request.setAttribute("percentFail", percentFail);
        request.setAttribute("percentFinish", percentFinish);
        request.setAttribute("percentCancel", percentCancel);

        request.setAttribute("totalMoneyByMonth", totalMoneyByMonth);
        request.setAttribute("totalMoney", totalMoney);

        for (int i = 1; i <= 12; i++) {
            double moneyByMonth = oDao.getToTalMoneyByMonth(i);
            request.setAttribute("month"+i, moneyByMonth);
        }
        
        request.getRequestDispatcher("/views/Admin/Dashboard.jsp").forward(request, response);
    }

//    public static void main(String[] args) {
//        System.out.println(Math.round((1.0/3.0)*100));
//    }
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
