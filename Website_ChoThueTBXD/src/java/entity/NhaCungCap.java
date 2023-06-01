/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ADMIN
 */
public class NhaCungCap {
    public String maNCC;
    public String tennCC;
    public String diachiNCC;
    public String SDT;
    public String Email;
    public String nhanVienLienHe;

    public NhaCungCap() {
    }

    public NhaCungCap(String maNCC, String tennCC, String diachiNCC, String SDT, String Email, String nhanVienLienHe) {
        this.maNCC = maNCC;
        this.tennCC = tennCC;
        this.diachiNCC = diachiNCC;
        this.SDT = SDT;
        this.Email = Email;
        this.nhanVienLienHe = nhanVienLienHe;
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
    
    

   
    
}
