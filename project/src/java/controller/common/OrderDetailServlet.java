package controller.common;

import dal.*;
import model.*;
import java.util.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/orderdetail"})
public class OrderDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // lay thong tin chi tiet orderItems cua 1 order
        int odid = Integer.parseInt(request.getParameter("odid"));
        DAO oid = new DAO();
        List<OrderDetail> detail = oid.getOdDetailByOdId(odid);    
        request.setAttribute("detail", detail);
        
        request.getRequestDispatcher("orderdetail.jsp").forward(request, response);


    }

}
