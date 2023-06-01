/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.TreeMap;

/**
 *
 * @author ADMIN
 */
public class Giohang {
    private String cartID;
    private String productID;
    private String hinhAnh;
    private String tenThietBi;
    private String so_luong;
    private String giaDonThue;
    public Giohang() {
    }

    public Giohang(String cartID, String productID, String hinhAnh, String tenThietBi, String giaDonThue , String so_luong) {
        this.cartID = cartID;
        this.productID = productID;
        this.hinhAnh = hinhAnh;
        this.tenThietBi = tenThietBi;
        this.so_luong = so_luong;
        this.giaDonThue = giaDonThue;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    

    public String getTenThietBi() {
        return tenThietBi;
    }

    public void setTenThietBi(String tenThietBi) {
        this.tenThietBi = tenThietBi;
    }

    

    

    public String getCartID() {
        return cartID;
    }

    public void setCartID(String cartID) {
        this.cartID = cartID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getSo_luong() {
        return so_luong;
    }

    public void setSo_luong(String so_luong) {
        this.so_luong = so_luong;
    }

    public String getGiaDonThue() {
        return giaDonThue;
    }

    public void setGiaDonThue(String giaDonThue) {
        this.giaDonThue = giaDonThue;
    }

    @Override
    public String toString() {
        return "Giohang{" + "cartID=" + cartID + ", productID=" + productID + ", so_luong=" + so_luong + ", giaDonThue=" + giaDonThue + '}';
    }

    
    
    
    
    
}
