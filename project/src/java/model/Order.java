/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PV
 */
public class Order {
    private int id;
    private String date;
    private String user_name;
    private int user_id;
    private double totalMoney;

    public Order() {
    }

    public Order(String date, int user_id, double totalMoney) {
        this.date = date;
        this.user_id = user_id;
        this.totalMoney = totalMoney;
    }
    
    

    public Order(int id, String date, int user_id, double totalMoney) {
        this.id = id;
        this.date = date;
        this.user_id = user_id;
        this.totalMoney = totalMoney;
    }

    public Order(int id, String date, String user_name, int user_id, double totalMoney) {
        this.id = id;
        this.date = date;
        this.user_name = user_name;
        this.user_id = user_id;
        this.totalMoney = totalMoney;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
    
    
    
}
