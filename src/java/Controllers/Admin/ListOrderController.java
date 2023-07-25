/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import DAL.OrderDAO;
import DAL.OrderDetailsDAO;
import Model.Constants;
import Model.Order;
import Model.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class ListOrderController extends HttpServlet {

    final int recordsPerPage = 5;

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
            out.println("<title>Servlet ListOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListOrderController at " + request.getContextPath() + "</h1>");
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
        OrderDetailsDAO odDao = new OrderDetailsDAO();
        OrderDAO oDao = new OrderDAO();

        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(
                    request.getParameter("page"));
        }

        //get all order with status = 1
        ArrayList<Order> orders = oDao.getOrderByStatusExceptPending((page - 1) * recordsPerPage,
                recordsPerPage);

        int noOfRecords = oDao.getNoOfRecordsExceptPending();

        int noOfPages = (int) Math.ceil((double) noOfRecords
                / recordsPerPage);

        for (Order order : orders) {
            ArrayList<OrderDetails> orderDetails = odDao.getOrderDetailsByOrderID(order.getOrderId());
            order.setOrderDetails(orderDetails);
        }

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfRecords", noOfRecords);

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/views/Admin/OrderManagement.jsp").forward(request, response);
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
        OrderDAO oDao = new OrderDAO();
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        switch (action) {
            case "finish":
                oDao.setStatusOrder(id, Constants.StatusOrderFinish);
                doGet(request, response);
                break;
            case "fail":
                oDao.setStatusOrder(id, Constants.StatusOrderFail);
                doGet(request, response);
                break;
        }
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
