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

/**
 *
 * @author havie
 */
@WebServlet(name = "ListProductServlet", urlPatterns = {"/listproduct"})
public class ListProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (!Authorization.isAdmin(acc)) {
            Authorization.redirectToHome(session, response);
        } else {
            // lay ra danh sach san pham
            DAO pd = new DAO();
            List<Product> listP;
            listP = pd.getAllProduct();
            request.setAttribute("listP", listP);

            request.getRequestDispatcher("list_product.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // search san pham
        String txt = request.getParameter("txt");
        DAO pd = new DAO();
        List<Product> listP;
        listP = pd.searchByName(txt);
        request.setAttribute("listP", listP);

        request.getRequestDispatcher("list_product.jsp").forward(request, response);

    }
}
