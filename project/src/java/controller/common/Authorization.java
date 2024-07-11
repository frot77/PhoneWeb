package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.*;

public class Authorization extends HttpServlet {

    //cac ham check role
    public static boolean isCustomer(Account user) {
        boolean customer = false;
        return user != null && user.isIsAdmin() == customer;
    }

    public static boolean isAdmin(Account user) {
        boolean admin = true;
        return user != null && user.isIsAdmin() == admin;
    }

    public static void redirectToHome(HttpSession session, HttpServletResponse response)
            throws ServletException, IOException {
        //day ve trang home va thong bao
        session.setAttribute("message", "Bạn không có quyền truy cập!");
        response.sendRedirect("home");
    }
}
