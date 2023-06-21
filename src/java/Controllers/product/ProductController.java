/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.product;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.CollectionDAO;
import DAL.ProductDAO;
import Model.Collection;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author dell
 */
public class ProductController extends HttpServlet {

    int collectionID = -1;
    int categoryID = -1;
    int subcategoryID = -1;
    public static String header = null;
    private int page = 1;
    private int recordsPerPage = 5;
    double minPrice = 0;
    double maxPrice = 1000000000;
    String textSearch = "";
    int sortOption = -1;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(
                    request.getParameter("page"));
        }

        textSearch = (String) request.getSession().getAttribute("textSearch");
        if (textSearch == null) {
            textSearch = "";
        }

        ProductDAO pDao = new ProductDAO();
        ArrayList<Product> products = pDao.getAllProduct((page - 1) * recordsPerPage,
                recordsPerPage, collectionID, subcategoryID, categoryID, textSearch,
                minPrice, maxPrice, true);
        int noOfRecords = pDao.getNoOfRecords(collectionID, subcategoryID, categoryID, textSearch, minPrice, maxPrice, true);
        int noOfPages = (int) Math.ceil((double) noOfRecords
                / recordsPerPage);

        if (request.getSession().getAttribute("sortOption") != null) {
            sortOption = (int) request.getSession().getAttribute("sortOption");
            if (sortOption != -1) {
                switch (sortOption) {
                    case 1:
                        Collections.sort(products, new Comparator<Product>() {
                            @Override
                            public int compare(Product o1, Product o2) {
                                return o1.getName().compareToIgnoreCase(o2.getName());
                            }
                        });
                        break;
                    case 2:
                        Collections.sort(products, new Comparator<Product>() {
                            @Override
                            public int compare(Product o1, Product o2) {
                                return o2.getName().compareToIgnoreCase(o1.getName());
                            }
                        });
                        break;
                    case 3:
                        Collections.sort(products, new Comparator<Product>() {
                            @Override
                            public int compare(Product o1, Product o2) {
                                if (o1.getPrice() < o2.getPrice()) {
                                    return 1;
                                }
                                if (o1.getPrice() > o2.getPrice()) {
                                    return -1;
                                }
                                return 0;
                            }
                        });
                        break;
                    case 4:
                        Collections.sort(products, new Comparator<Product>() {
                            @Override
                            public int compare(Product o1, Product o2) {
                                if (o1.getPrice() < o2.getPrice()) {
                                    return -1;
                                }
                                if (o1.getPrice() > o2.getPrice()) {
                                    return 1;
                                }
                                return 0;
                            }
                        });
                        break;
                }
            }
        }

        //get all collection
        CollectionDAO clDao = new CollectionDAO();
        ArrayList<Collection> collections = clDao.getAllCollection(true);

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfRecords", noOfRecords);
        request.setAttribute("sortOption", sortOption);

        request.setAttribute("header", header);
        request.setAttribute("products", products);
        request.setAttribute("collections", collections);
        request.setAttribute("textSearch", textSearch);
        request.getRequestDispatcher("views/Product/Products.jsp").forward(request, response);

    }
//
//    public static void main(String[] args) {
//        ProductDAO pDao = new ProductDAO();
//        ArrayList<Product> products = pDao.getAllProduct(0,
//                5, -1, -1, -1, "",0,1000000, true);
//       // int noOfRecords = pDao.getNoOfRecords(-1, -1, -1, "", true);
//        System.out.println(products.size());
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "searchByPrice":
                    minPrice = Double.parseDouble(request.getParameter("minPrice"));
                    maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
                    doGet(request, response);
                    break;
                case "sort":
                    sortOption = Integer.parseInt(request.getParameter("sortOption"));
                    request.getSession().setAttribute("sortOption", sortOption);
                    doGet(request, response);
                    break;
            }
        }
    }

    public void searchCollection(int collectionID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.collectionID = collectionID;
        request.getSession().setAttribute("textSearch", null);
        request.getSession().setAttribute("sortOption", -1);
        doGet(request, response);
    }

    public void searchCategory(int categoryID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.categoryID = categoryID;
        request.getSession().setAttribute("textSearch", null);
        request.getSession().setAttribute("sortOption", -1);
        doGet(request, response);
    }

    public void searchSubCategory(int subCategoryID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.subcategoryID = subCategoryID;
        request.getSession().setAttribute("textSearch", null);
        request.getSession().setAttribute("sortOption", -1);
        doGet(request, response);
    }

    public void searchByText(String textSearch, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("sortOption", -1);
        this.textSearch = textSearch;
        doGet(request, response);
    }

    void listAllProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("textSearch", null);
        request.getSession().setAttribute("sortOption", -1);
        doGet(request, response);
    }
}
