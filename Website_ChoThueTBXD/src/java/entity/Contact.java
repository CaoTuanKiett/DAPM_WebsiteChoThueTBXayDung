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
public class Contact {
    private String maDonThue;
    private Date ngayTaoDon;
    private String tenThonTo;
    private String tenPhuongXa;
    private String tenQuanHuyen;
    private String tenTinhThanh;
    private String SDT;
    private String trangthaiHoaDon;
    private String ghiChu;

    public Contact() {
    }

    public Contact(String maDonThue, Date ngayTaoDon, String tenThonTo, String tenPhuongXa, String tenQuanHuyen, String tenTinhThanh, String SDT, String trangthaiHoaDon, String ghiChu) {
        this.maDonThue = maDonThue;
        this.ngayTaoDon = ngayTaoDon;
        this.tenThonTo = tenThonTo;
        this.tenPhuongXa = tenPhuongXa;
        this.tenQuanHuyen = tenQuanHuyen;
        this.tenTinhThanh = tenTinhThanh;
        this.SDT = SDT;
        this.trangthaiHoaDon = trangthaiHoaDon;
        this.ghiChu = ghiChu;
    }

    public String getMaDonThue() {
        return maDonThue;
    }

    public void setMaDonThue(String maDonThue) {
        this.maDonThue = maDonThue;
    }

    public Date getNgayTaoDon() {
        return ngayTaoDon;
    }

    public void setNgayTaoDon(Date ngayTaoDon) {
        this.ngayTaoDon = ngayTaoDon;
    }

    public String getTenThonTo() {
        return tenThonTo;
    }

    public void setTenThonTo(String tenThonTo) {
        this.tenThonTo = tenThonTo;
    }

    public String getTenPhuongXa() {
        return tenPhuongXa;
    }

    public void setTenPhuongXa(String tenPhuongXa) {
        this.tenPhuongXa = tenPhuongXa;
    }

    public String getTenQuanHuyen() {
        return tenQuanHuyen;
    }

    public void setTenQuanHuyen(String tenQuanHuyen) {
        this.tenQuanHuyen = tenQuanHuyen;
    }

    public String getTenTinhThanh() {
        return tenTinhThanh;
    }

    public void setTenTinhThanh(String tenTinhThanh) {
        this.tenTinhThanh = tenTinhThanh;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getTrangthaiHoaDon() {
        return trangthaiHoaDon;
    }

    public void setTrangthaiHoaDon(String trangthaiHoaDon) {
        this.trangthaiHoaDon = trangthaiHoaDon;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    

    
    
    
}
