package SellerPackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/SellerController")
public class SellerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SellerService sellerService;

    @Override
    public void init() {
        sellerService = new SellerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertSeller(request, response);
                    break;
                case "delete":
                    deleteSeller(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateSeller(request, response);
                    break;
                case "list":
                default:
                    listSellers(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listSellers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<SellerModel> sellers = sellerService.getAllSellers();
        request.setAttribute("listSellers", sellers);
        request.getRequestDispatcher("Seller.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("SellerForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SellerModel seller = sellerService.getSellerById(id);
        request.setAttribute("seller", seller);
        request.getRequestDispatcher("SellerForm.jsp").forward(request, response);
    }

    private void insertSeller(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String status = request.getParameter("status");

        SellerModel newSeller = new SellerModel(name, email, phone, status);
        sellerService.addSeller(newSeller);
        response.sendRedirect("SellerController?action=list");
    }

    private void updateSeller(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String status = request.getParameter("status");

        SellerModel seller = new SellerModel(id, name, email, phone, status, null, null);
        sellerService.updateSeller(seller);
        response.sendRedirect("SellerController?action=list");
    }

    private void deleteSeller(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        sellerService.deleteSeller(id);
        response.sendRedirect("SellerController?action=list");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
