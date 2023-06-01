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
public class ALL_ChiTietTB {
    public String maNCC;
    public String tennCC;
    public String diachiNCC;
    public String SDT;
    public String Email;
    public String nhanVienLienHe;
    private String maPN;
    private Date ngayNhapHang;
    public String maThietBi;
    public String tenThietBi;
    public double donGiaThue;
    public int soluongHienCon;
    public String dacDiem;
    public String hinhAnhString;
    private int soLuongNhap;
    public double giaNhap;

    public ALL_ChiTietTB() {
    }

    public ALL_ChiTietTB(String maNCC, String tennCC, String diachiNCC, String SDT, String Email, String nhanVienLienHe, String maPN, Date ngayNhapHang, String maThietBi, String tenThietBi, double donGiaThue, int soluongHienCon, String dacDiem, String hinhAnhString, int soLuongNhap, double giaNhap) {
        this.maNCC = maNCC;
        this.tennCC = tennCC;
        this.diachiNCC = diachiNCC;
        this.SDT = SDT;
        this.Email = Email;
        this.nhanVienLienHe = nhanVienLienHe;
        this.maPN = maPN;
        this.ngayNhapHang = ngayNhapHang;
        this.maThietBi = maThietBi;
        this.tenThietBi = tenThietBi;
        this.donGiaThue = donGiaThue;
        this.soluongHienCon = soluongHienCon;
        this.dacDiem = dacDiem;
        this.hinhAnhString = hinhAnhString;
        this.soLuongNhap = soLuongNhap;
        this.giaNhap = giaNhap;
    }

    public String getMaNCC() {
        return maNCC;
    }

    public void setMaNCC(String maNCC) {
        this.maNCC = maNCC;
    }

    public String getTennCC() {
        return tennCC;
    }

    public void setTennCC(String tennCC) {
        this.tennCC = tennCC;
    }

    public String getDiachiNCC() {
        return diachiNCC;
    }

    public void setDiachiNCC(String diachiNCC) {
        this.diachiNCC = diachiNCC;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getNhanVienLienHe() {
        return nhanVienLienHe;
    }

    public void setNhanVienLienHe(String nhanVienLienHe) {
        this.nhanVienLienHe = nhanVienLienHe;
    }

    public String getMaPN() {
        return maPN;
    }

    public void setMaPN(String maPN) {
        this.maPN = maPN;
    }

    public Date getNgayNhapHang() {
        return ngayNhapHang;
    }

    public void setNgayNhapHang(Date ngayNhapHang) {
        this.ngayNhapHang = ngayNhapHang;
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

    public double getDonGiaThue() {
        return donGiaThue;
    }

    public void setDonGiaThue(double donGiaThue) {
        this.donGiaThue = donGiaThue;
    }

    public int getSoluongHienCon() {
        return soluongHienCon;
    }

    public void setSoluongHienCon(int soluongHienCon) {
        this.soluongHienCon = soluongHienCon;
    }

    public String getDacDiem() {
        return dacDiem;
    }

    public void setDacDiem(String dacDiem) {
        this.dacDiem = dacDiem;
    }

    public String getHinhAnhString() {
        return hinhAnhString;
    }

    public void setHinhAnhString(String hinhAnhString) {
        this.hinhAnhString = hinhAnhString;
    }

    public int getSoLuongNhap() {
        return soLuongNhap;
    }

    public void setSoLuongNhap(int soLuongNhap) {
        this.soLuongNhap = soLuongNhap;
    }

    public double getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(double giaNhap) {
        this.giaNhap = giaNhap;
    }


    
    

}
