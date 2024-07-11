/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.AccountDetail;
import model.Cart;
import model.Category;
import model.Color;
import model.Item;
import model.Product;
import model.Specifications;

/**
 *
 * @author PV
 */
public class DAO extends DBContext {

    public List<Product> getAllProduct() {
        String sql = "select * from Products";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;

    }

    //lay san pham moi nhat
    public List<Product> getNewProduct() {
        String sql = "select top 8 * from Products order by release_date desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;

    }

    //lay san pham best seller
    public List<Product> getBestProduct() {
        String sql = "select top 8 * from Products order by Quantity";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;

    }

    //lay san pham hot theo cid
    public List<Product> getBestProductByCid1(String cid) {
        String sql = "select * from Products where c_id=? order by Quantity OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;

    }

    //lay san pham hot theo cid
    public List<Product> getBestProductByCid2(String cid) {
        String sql = "select * from Products where c_id=? order by Quantity OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;

    }

    // lay color cua san pham 
    public List<Color> getColor(String name) {
        String sql = "SELECT C.color_id, C.name\n"
                + "FROM Color C\n"
                + "INNER JOIN ProductColor PC ON C.color_id = PC.color_id\n"
                + "INNER JOIN Products P ON PC.product_id = P.product_id\n"
                + "WHERE P.name = ?";
        List<Color> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name); // Sử dụng setString để truyền tham số name
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Color(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    //lay san pham moi nhat
    public List<Product> getNewProductByCid(String cid) {
        String sql = "select top 5 * from Products where c_id=? order by release_date desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;

    }

    //đưa Categary load vào hôm
    public List<Category> getAllCategory() {
        String sql = "select * from Category";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;

    }

    //đưa về sản phẩm theo category
    public List<Product> getProductByCID(String cid) {
        String sql = "select * from Products where c_id=?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;

    }

    //search theo gia
    public List<Product> getProductByPrice(double from, double to) {
        String sql = "select * from Products where price between ? and ?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, from);
            st.setDouble(2, to);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;

    }

    //search theo check
    public List<Product> searchByCheck(int[] cid) {
        String sql = "select * from Products where 1=1";
        if (cid != null && cid[0] != 0) {
            sql += " and c_id in(";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //vao detail san phảm
    public Product getProductByID(String id) {
        String sql = "select * from Products where product_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        } catch (SQLException e) {
        }
        return null;

    }

    //lay thong so chi tiet san pham
    public Specifications getProductDetail(String id) {
        String sql = "select * from ProductSpecifications where product_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Specifications(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }
        } catch (SQLException e) {
        }
        return null;

    }

    //Search
    public List<Product> searchByName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }

        } catch (SQLException e) {
        }

        return list;
    }

    //lay user
    public Account login(String user, String pass) {
        String sql = "select * from Users where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), user, pass);
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccount(String user) {
        String sql = "select * from Users where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), user, rs.getString(3));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user, String pass) {
        String sql = "insert into Users values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    //phan trang
    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    //them order
    public void addOrder(Account a, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "insert into Orders values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getUser_id());
            st.setString(2, date);
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();
            //lay id cua Order vua add
            String sql1 = "select top 1 order_id from Orders order by order_id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into OrderDetails values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
            // cap nhat so luong
            String sql3 = "update Products set Quantity=Quantity-? where product_id=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }

        } catch (Exception e) {
        }

    }

    //lay profile
    public AccountDetail getProfile(Account a) {
        String sql = "select * from UserDetails where user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getUser_id());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new AccountDetail(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
     return null;
    }
    
    // doi mk
    public void changepass(Account a ,String newpass){
    String sql="UPDATE Users SET password = ? WHERE user_id = ? ";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,newpass);
            st.setInt(2, a.getUser_id());
            st.executeUpdate();
            
        } catch (Exception e) {
        }
    }
    
    public void changeprofile(Account a ,String first_name,String last_name,String email,String phone,String address){
    String sql="UPDATE UserDetails SET first_name = ?,last_name =?,email=?,phone=?,address=? WHERE user_id = ? ";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,first_name);
            st.setString(2,last_name);
            st.setString(3,email);
            st.setString(4,phone);
            st.setString(5,address);            
            st.setInt(6, a.getUser_id());
            st.executeUpdate();
            
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Category> list = d.getAllCategory();
        List<Product> list1 = d.searchByName("iphone");
        Account a = d.login("fubao", "1");
        System.out.println(a);

    }
}
