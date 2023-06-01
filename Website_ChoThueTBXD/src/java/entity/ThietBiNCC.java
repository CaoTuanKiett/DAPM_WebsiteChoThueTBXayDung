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
public class ThietBiNCC {

    public String maThietBi;
    public String tenThietBi;
    public double donGiaThue;
    public int soluongHienCon;
    public String dacDiem;
    public String hinhAnhString;
    public String tennCC;

    public ThietBiNCC() {
    }

    public ThietBiNCC(String maThietBi, String tenThietBi, double donGiaThue, int soluongHienCon, String dacDiem, String hinhAnhString, String tennCC) {
        this.maThietBi = maThietBi;
        this.tenThietBi = tenThietBi;
        this.donGiaThue = donGiaThue;
        this.soluongHienCon = soluongHienCon;
        this.dacDiem = dacDiem;
        this.hinhAnhString = hinhAnhString;
        this.tennCC = tennCC;
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

    public String getTennCC() {
        return tennCC;
    }

    public void setTennCC(String tennCC) {
        this.tennCC = tennCC;
    }
    
    
}
