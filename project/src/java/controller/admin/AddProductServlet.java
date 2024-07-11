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

@WebServlet(name = "AddProductServlet", urlPatterns = {"/addproduct"})
public class AddProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (!Authorization.isAdmin(acc)) {
            Authorization.redirectToHome(session, response);
        } else {
            // lay ra list category de chon category cho san pham moi
            DAO d = new DAO();
            List<Category> listC = d.getAllCategory();
            request.setAttribute("listC", listC);

            request.getRequestDispatcher("add_product.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // lay thong tin cua san pham moi tu trang jsp
        String name = request.getParameter("name");
        String image = "img/product/" + request.getParameter("image");
        int price = Integer.parseInt(request.getParameter("price"));
        String des = request.getParameter("des");
        int category = Integer.parseInt(request.getParameter("category"));

        // them moi 1 san pham
        DAO pd = new DAO();
        pd.addProduct(new Product(name, des, price, image, category));

        // lay ra danh sach san pham
        List<Product> listP;
        listP = pd.getAllProduct();
        request.setAttribute("listP", listP);

        request.getRequestDispatcher("list_product.jsp").forward(request, response);

    }
}
