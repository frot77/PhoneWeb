/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.guest;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.*;

/**
 *
 * @author PV
 */
@WebServlet(name = "StoreServlet", urlPatterns = {"/store"})
public class StoreServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DAO d = new DAO();
        List<model.Category> listC = d.getAllCategory();
        List<Product> list = d.getAllProduct();
        int page, numperpage = 9;
        int size = list.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> list1 = d.getListByPage(list, start, end);

        request.setAttribute("cid", 0);

        request.setAttribute("sort", 0);
        request.setAttribute("key", 0);
        request.setAttribute("listP", list1);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("store.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //search theo name
        List<Product> product = new ArrayList<>();
        String key = request.getParameter("key");
        String price = request.getParameter("price");
        String sortType = request.getParameter("sort");
        DAO d = new DAO();
        List<model.Category> listC = d.getAllCategory();

        if (key.equals("0")) {
            product = d.getAllProduct();
        } else {
            product = d.getBestProductByCid2(key);
        }

        List<Product> filteredProducts = new ArrayList<>();

        switch (price) {
            case "0":
                filteredProducts = product;
                break;
            case "1":
                for (Product p : product) {
                    if (p.getPrice() < 1000) {
                        filteredProducts.add(p);
                    }
                }
                break;
            case "2":
                for (Product p : product) {
                    if (p.getPrice() >= 1000 && p.getPrice() <= 2000) {
                        filteredProducts.add(p);
                    }
                }
                break;
            case "3":
                for (Product p : product) {
                    if (p.getPrice() >= 2000 && p.getPrice() <= 3000) {
                        filteredProducts.add(p);
                    }
                }
                break;
            case "4":
                for (Product p : product) {
                    if (p.getPrice() > 3000) {
                        filteredProducts.add(p);
                    }
                }
                break;
            default:
                break;
        }
        product = filteredProducts;

        if (sortType != null) {
            if (sortType.equals("1")) {
                Collections.sort(product, Comparator.comparingDouble(Product::getPrice));
            } else if (sortType.equals("2")) {
                Collections.sort(product, Comparator.comparingDouble(Product::getPrice));
                Collections.reverse(product);
            }//else if (sortType.equals("3")) {
//                Collections.sort(product, Comparator.comparing(Product::getRelease_date));
//                Collections.reverse(product);
//            }else if (sortType.equals("4")) {
//                Collections.sort(product, Comparator.comparingDouble(Product::getRelease_date));
//                Collections.reverse(product);
//            }
        }

        //phan  trang
        int page, numperpage = 9;
        int size = product.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> list1 = d.getListByPage(product, start, end);

        request.setAttribute("key", key);
        request.setAttribute("price", price);

        request.setAttribute("listP", list1);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("store.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
