package controller.common;

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

@WebServlet(name = "OrderListServlet", urlPatterns = {"/orderlist"})
public class OrderListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //g?i ra d? li?u c?a phi�n ng??i d�ng hi?n t?i
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (acc == null) {
            Authorization.redirectToHome(session, response);
        } else {
            DAO d = new DAO();
            List<Order> listO = new ArrayList<>();
            String uid = request.getParameter("uid");
            if (uid == null) {
                if (acc.isIsAdmin()) { // neu la admin, lay ra danh sach tat ca order
                    listO = d.getAllOrders();
                } else { // neu la customer, lay ra nhung don hang cua chinh minh
                    listO = d.getMyOrderByUID(acc.getUser_id());
                }
            } else {
                listO = d.getMyOrderByUID(Integer.parseInt(uid));
            }

            request.setAttribute("listO", listO);
            request.getRequestDispatcher("orderList.jsp").forward(request, response);

        }

    }

}
