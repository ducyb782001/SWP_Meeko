/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import DAL.ImageProductDAO;
import DAL.ProductDAO;
import Model.Category;
import Model.ImageProduct;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author dell
 */
@MultipartConfig
public class AddProductSevrlet extends HttpServlet {

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
            out.println("<title>Servlet AddProductSevrlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductSevrlet at " + request.getContextPath() + "</h1>");
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
        try {
            ProductDAO pDao = new ProductDAO();
            ImageProductDAO imgDao = new ImageProductDAO();

            //lay thong tin tu client gui ve
            String name = request.getParameter("name");
            Double price = Double.parseDouble(request.getParameter("price"));
            int categoryID = Integer.parseInt(request.getParameter("category"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            boolean status = Boolean.valueOf(request.getParameter("status"));
            String description = request.getParameter("description");

            Category category = new Category();
            category.setCategoryId(categoryID);

            //tao san pham
            Product product = new Product();
            product.setName(name);
            product.setPrice(price);
            product.setCategory(category);
            product.setQuantity(quantity);
            product.setStatus(status);
            product.setDescription(description);
            product.setCreateDate(Date.valueOf(LocalDate.now()));
            product.setIsParent(true);

            //tao id cho product
            int maxID = pDao.getMaxProductID();
            product.setProductId(maxID + 1);

            //them product vao database
            pDao.insert(product);

            //lay file anh client gui len server
            List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList());

            //lay ra duong dan luu folder anh
            String realPath =  getServletContext().getRealPath("") + File.separator + "images";

            for (Part part : fileParts) {
                //random ten cho image
                UUID uuid = UUID.randomUUID();
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String fileExtension = FilenameUtils.getExtension(filename);

                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectory(Paths.get(realPath));
                }
                filename = uuid + "." + fileExtension;
                part.write(realPath + File.separator + filename);

                String pathImage = "/" + "images" + "/" + filename;

                //them anh vao database
                ImageProduct image = new ImageProduct(product.getProductId(), pathImage, false);
                imgDao.insert(image);
            }
            response.sendRedirect("listAllProductAdmin");
        } catch (Exception e) {

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

//    public static void main(String[] args) {
//        Product product = new Product();
//        try {
//            System.out.println(product.getParent().getProductId());
//        } catch (Exception e) {
//            System.out.println("oke");
//        }
//    }
}
