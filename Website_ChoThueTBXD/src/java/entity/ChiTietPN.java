/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;


/**
 *
 * @author ADMIN
 */
public class ChiTietPN {
    private String maPN;
    private String maThietBi;
    private int soLuongNhap;
    private double giaNhap;
    private Date ngayNhapHang;
    private String maNCC;
    private String tenNCC;

    

    public ChiTietPN() {
    }

    public ChiTietPN(String maPN, String maThietBi, int soLuongNhap, double giaNhap, Date ngayNhapHang, String maNCC, String tenNCC) {
        this.maPN = maPN;
        this.maThietBi = maThietBi;
        this.soLuongNhap = soLuongNhap;
        this.giaNhap = giaNhap;
        this.ngayNhapHang = ngayNhapHang;
        this.maNCC = maNCC;
        this.tenNCC = tenNCC;
    }

    public String getTenNCC() {
        return tenNCC;
    }

    public void setTenNCC(String tenNCC) {
        this.tenNCC = tenNCC;
    }
     
    public String getMaPN() {
        return maPN;
    }

    public void setMaPN(String maPN) {
        this.maPN = maPN;
    }

    public String getMaThietBi() {
        return maThietBi;
    }

    public void setMaThietBi(String maThietBi) {
        this.maThietBi = maThietBi;
    }

    public int getSoLuongNhap() {
        return soLuongNhap;
    }

    public void setSoLuongNhap(int soLuongNhap) {
        this.soLuongNhap = soLuongNhap;
    }

    public Date getNgayNhapHang() {
        return ngayNhapHang;
    }

    public void setNgayNhapHang(Date ngayNhapHang) {
        this.ngayNhapHang = ngayNhapHang;
    }

    public String getMaNCC() {
        return maNCC;
    }

    public void setMaNCC(String maNCC) {
        this.maNCC = maNCC;
    }

    public double getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(double giaNhap) {
        this.giaNhap = giaNhap;
    }
    
    

    
}
