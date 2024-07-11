/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PV
 */
public class Account {
    private int user_id;
    private String user;
    private String pass;
    private boolean isAdmin;
    

    public Account() {
    }

    public Account(int user_id, String user) {
        this.user_id = user_id;
        this.user = user;
    }


    
    

    public Account(int user_id, String user, String pass, boolean isAdmin) {
        this.user_id = user_id;
        this.user = user;
        this.pass = pass;
        this.isAdmin = isAdmin;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" + "user_id=" + user_id + ", user=" + user + ", pass=" + pass + ", isAdmin=" + isAdmin + '}';
    }

  
    
    
    
}
