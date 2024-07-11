package controller.admin;

import controller.common.Authorization;
import dal.DAO;
import model.*;
import java.util.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "EditProductServlet", urlPatterns = {"/editproduct"})
public class EditProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (!Authorization.isAdmin(acc)) {
            Authorization.redirectToHome(session, response);
        } else {
            // hien thi lai thong tin cua san pham
            String strId = request.getParameter("ID");
            DAO d = new DAO();
            Product p = d.getProductByID(strId);
            request.setAttribute("detail", p);

            // danh sach cac category
            List<Category> listC = d.getAllCategory();
            request.setAttribute("listC", listC);

            request.getRequestDispatcher("edit_product.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // lay ra thong tin cua san pham sau khi cap nhat
        int productID = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        // String image =  request.getParameter("image");
        Double Price = Double.parseDouble(request.getParameter("price"));
        int cateID = Integer.parseInt(request.getParameter("category"));
        String des = request.getParameter("des");

        // cap nhat san pham
        DAO d = new DAO();
        Product productUpdate = new Product(name, des, Price, cateID);
        d.editProduct(productID, productUpdate);

        // lay ra danh sach san pham
        List<Product> listP;
        listP = d.getAllProduct();
        request.setAttribute("listP", listP);

        request.getRequestDispatcher("list_product.jsp").forward(request, response);

    }
}
