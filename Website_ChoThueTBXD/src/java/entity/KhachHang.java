/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ADMIN
 */
public class KhachHang {
    public String maKH;
    public String tenKH;
    public String diachiKH;
    public String SDT;
    public String DCEmail;
    public String matKhau;
    public String maQuyenTruyCap;

    public KhachHang() {
    }

    public KhachHang(String maKH, String tenKH, String diachiKH, String SDT, String DCEmail, String matKhau, String maQuyenTruyCap) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.diachiKH = diachiKH;
        this.SDT = SDT;
        this.DCEmail = DCEmail;
        this.matKhau = matKhau;
        this.maQuyenTruyCap = maQuyenTruyCap;
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public String getDiachiKH() {
        return diachiKH;
    }

    public void setDiachiKH(String diachiKH) {
        this.diachiKH = diachiKH;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String DCEmail() {
        return DCEmail;
    }

    public void setEmail(String DCEmail) {
        this.DCEmail = DCEmail;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getMaQuyenTruyCap() {
        return maQuyenTruyCap;
    }

    public void setMaQuyenTruyCap(String maQuyenTruyCap) {
        this.maQuyenTruyCap = maQuyenTruyCap;
    }
    
}
