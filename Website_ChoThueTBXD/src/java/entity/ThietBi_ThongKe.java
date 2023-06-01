/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author dell
 */
public class ThietBi_ThongKe {
    private String maThietBi;
    private String tenThietBi;
    private double donGiaDat;
    private int soLuongDat;
    private double tongTien;
    private String ngayThanhToan;

    public ThietBi_ThongKe(String maThietBi, String tenThietBi, double donGiaDat, int soLuongDat, double tongTien, String ngayThanhToan) {
        this.maThietBi = maThietBi;
        this.tenThietBi = tenThietBi;
        this.donGiaDat = donGiaDat;
        this.soLuongDat = soLuongDat;
        this.tongTien = tongTien;
        this.ngayThanhToan = ngayThanhToan;
    }

    public ThietBi_ThongKe() {
    }

    public String getMaThietBi() {
        return maThietBi;
    }

    public void setMaThietBi(String maThietBi) {
        this.maThietBi = maThietBi;
    }

    public String getTenThietBi() {
        return tenThietBi;
    }

    public void setTenThietBi(String tenThietBi) {
        this.tenThietBi = tenThietBi;
    }

    public double getDonGiaDat() {
        return donGiaDat;
    }

    public void setDonGiaDat(double donGiaDat) {
        this.donGiaDat = donGiaDat;
    }

    public int getSoLuongDat() {
        return soLuongDat;
    }

    public void setSoLuongDat(int soLuongDat) {
        this.soLuongDat = soLuongDat;
    }

    public double getTongTien() {
        return getSoLuongDat()*getDonGiaDat();
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public String getNgayThanhToan() {
        return ngayThanhToan;
    }

    public void setNgayThanhToan(String ngayThanhToan) {
        this.ngayThanhToan = ngayThanhToan;
    }
}
