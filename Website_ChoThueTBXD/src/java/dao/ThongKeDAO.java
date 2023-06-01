/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.ThietBi_ThongKe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author dell
 */
public class ThongKeDAO {

    public ThongKeDAO() {

    }

    public Map<String, ThietBi_ThongKe> thongKeTheoTuan(String tuan, String text) {
        ArrayList<String> list = danhSachKhoangNgayTheoTuan(tuan, text);
        return thongKeTheoKhoanNgay(list.get(0), list.get(1));
    }

    public ArrayList<String> danhSachKhoangNgayTheoTuan(String tuan, String text) {
        int week = Integer.parseInt(tuan);
        String year = text.substring(0, text.indexOf("-"));
        String month = text.substring(text.indexOf("-") + 1, text.length());
        ArrayList<String> list = new ArrayList<>();
        switch (week) {
            case 1:
                list.add(year + "-" + month + "-" + 1);
                list.add(year + "-" + month + "-" + 7);
                break;
            case 2:
                list.add(year + "-" + month + "-" + 8);
                list.add(year + "-" + month + "-" + 14);
                break;
            case 3:
                list.add(year + "-" + month + "-" + 15);
                list.add(year + "-" + month + "-" + 21);
                break;
            case 4:
                list.add(year + "-" + month + "-" + 22);
                list.add(year + "-" + month + "-" + 31);
                break;
            default:
                break;
        }
        return list;
    }

    public Map<String, ThietBi_ThongKe> thongKeTheoKhoanNgay(String dateStart, String dateEnd) {
        String a = "1";
        Map<String, ThietBi_ThongKe> map = new HashMap<>();
        try {
            ResultSet rs = new DBContext().chonDuLieu("select tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, SUM(donGiaDat*soLuongDat) as tongTien, ngayThanhToan\n"
                    + "from ChiTietDonThue as ctdt\n"
                    + "join DonThue_HopDongChoThue as dt on  dt.maDonThue = ctdt.maDonThue\n"
                    + "join ThietBi as tb on  ctdt.maThietBi = tb.maThietBi\n"
                    + "where ngayThanhToan>='" + dateStart + "' and ngayThanhToan<='" + dateEnd + "'\n"
                    + "group by tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, ngayThanhToan");
            while (rs.next()) {
                int so = Integer.parseInt(a);
                so++;
                a = Integer.toString(so);
                String ma = rs.getString(1);
                String ten = rs.getString(2);
                Double gia = rs.getDouble(3);
                int soLuong = rs.getInt(4);
                Double doanhThu = rs.getDouble(5);
                String ngay = rs.getString(6);
                map.put(a, new ThietBi_ThongKe(ma, ten, gia, soLuong, doanhThu, ngay));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo thang");
        }
        return map;

    }

    public Map<String, ThietBi_ThongKe> thongKeTheoThang(String text) {
        String year = text.substring(0, text.indexOf("-"));
        String month = text.substring(text.indexOf("-") + 1, text.length());
        String a = "1";
        Map<String, ThietBi_ThongKe> map = new HashMap<>();
        try {
            ResultSet rs = new DBContext().chonDuLieu("select tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, SUM(donGiaDat*soLuongDat) as tongTien, ngayThanhToan\n"
                    + "from ChiTietDonThue as ctdt\n"
                    + "join DonThue_HopDongChoThue as dt on  dt.maDonThue = ctdt.maDonThue\n"
                    + "join ThietBi as tb on  ctdt.maThietBi = tb.maThietBi\n"
                    + "where year(ngayThanhToan)='" + year + "' and month(ngayThanhToan)='" + month + "'\n"
                    + "group by tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, ngayThanhToan");
            while (rs.next()) {
                int so = Integer.parseInt(a);
                so++;
                a = Integer.toString(so);
                String ma = rs.getString(1);
                String ten = rs.getString(2);
                Double gia = rs.getDouble(3);
                int soLuong = rs.getInt(4);
                Double doanhThu = rs.getDouble(5);
                String ngay = rs.getString(6);
                map.put(a, new ThietBi_ThongKe(ma, ten, gia, soLuong, doanhThu, ngay));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo thang");
        }
        return map;
    }

    public Map<String, ThietBi_ThongKe> thongKeTheoThangHeThong() {
        Date toDate = new Date(System.currentTimeMillis());
        SimpleDateFormat fomatTime = new SimpleDateFormat("MM-dd-yyyy");
        String date = fomatTime.format(toDate.getTime());
        String a = "1";
        String year = date.substring(0, date.indexOf("-"));
        String month = date.substring(date.indexOf("-") + 1, date.lastIndexOf("-"));

        Map<String, ThietBi_ThongKe> map = new HashMap<>();
        try {
            ResultSet rs = new DBContext().chonDuLieu("select tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, SUM(donGiaDat*soLuongDat) as tongTien, ngayThanhToan\n"
                    + "from ChiTietDonThue as ctdt\n"
                    + "join DonThue_HopDongChoThue as dt on  dt.maDonThue = ctdt.maDonThue\n"
                    + "join ThietBi as tb on  ctdt.maThietBi = tb.maThietBi\n"
                    + "where year(ngayThanhToan)='" + year + "' and month(ngayThanhToan)='" + month + "'\n"
                    + "group by tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, ngayThanhToan");
            while (rs.next()) {
                int so = Integer.parseInt(a);
                so++;
                a = Integer.toString(so);
                String ma = rs.getString(1);
                String ten = rs.getString(2);
                Double gia = rs.getDouble(3);
                int soLuong = rs.getInt(4);
                Double doanhThu = rs.getDouble(5);
                String ngay = rs.getString(6);
                map.put(a, new ThietBi_ThongKe(ma, ten, gia, soLuong, doanhThu, ngay));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo thang");
        }
        return map;
    }

    public Map<String, ThietBi_ThongKe> thongKeTheoNgay(String date) {
        String a = "1";
        Map<String, ThietBi_ThongKe> map = new HashMap<>();
        try {

            ResultSet rs = new DBContext().chonDuLieu("select tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, SUM(donGiaDat*soLuongDat) as tongTien, ngayThanhToan\n"
                    + "from ChiTietDonThue as ctdt\n"
                    + "join DonThue_HopDongChoThue as dt on  dt.maDonThue = ctdt.maDonThue\n"
                    + "join ThietBi as tb on  ctdt.maThietBi = tb.maThietBi\n"
                    + "where ngayThanhToan='" + date + "'\n"
                    + "group by tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, ngayThanhToan");
            while (rs.next()) {
                int so = Integer.parseInt(a);
                so++;
                a = Integer.toString(so);
                String ma = rs.getString(1);
                String ten = rs.getString(2);
                Double gia = rs.getDouble(3);
                int soLuong = rs.getInt(4);
                Double doanhThu = rs.getDouble(5);
                String ngay = rs.getString(6);
                map.put(a, new ThietBi_ThongKe(ma, ten, gia, soLuong, doanhThu, ngay));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo ngay");
        }
        return map;
    }

    public Map<String, ThietBi_ThongKe> thongKeTheoNgayHeThong() {
        Date toDate = new Date(System.currentTimeMillis());
        SimpleDateFormat fomatTime = new SimpleDateFormat("MM-dd-yyyy");
        String date = fomatTime.format(toDate.getTime());
        String a = "1";
        Map<String, ThietBi_ThongKe> map = new HashMap<>();
        try {
            ResultSet rs = new DBContext().chonDuLieu("select tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, SUM(donGiaDat*soLuongDat) as tongTien, ngayThanhToan\n"
                    + "from ChiTietDonThue as ctdt\n"
                    + "join DonThue_HopDongChoThue as dt on  dt.maDonThue = ctdt.maDonThue\n"
                    + "join ThietBi as tb on  ctdt.maThietBi = tb.maThietBi\n"
                    + "where ngayThanhToan='" + date + "'\n"
                    + "group by tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, ngayThanhToan");
            while (rs.next()) {
                int so = Integer.parseInt(a);
                so++;
                a = Integer.toString(so);
                String ma = rs.getString(1);
                String ten = rs.getString(2);
                Double gia = rs.getDouble(3);
                int soLuong = rs.getInt(4);
                Double doanhThu = rs.getDouble(5);
                String ngay = rs.getString(6);
                map.put(a, new ThietBi_ThongKe(ma, ten, gia, soLuong, doanhThu, ngay));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi thong ke theo ngay");
        }
        return map;
    }

    public static void main(String[] args) {
        String ngay = "2017-05-03";
        String tuan = "2";
        String thang = "2017-05";
        String ngay2 = "2017-06-12";

//		System.out.println(new ThongKeDAO().thongKeTheoNgay(ngay));
//		System.out.println(new ThongKeDAO().thongKeTheoNgayHeThong());
        Map<String, ThietBi_ThongKe> map = new ThongKeDAO().thongKeTheoKhoanNgay(ngay, ngay2);
        for (ThietBi_ThongKe ts : map.values()) {
            System.out.println(ts);
        }
//		System.out.println(new ThongKeDAO().thongKeTheoThang(thang));
//		System.out.println(new ThongKeDAO().thongKeTheoThangHeThong());
//		System.out.println(new ThongKeDAO().thongKeTheoTuan(tuan, thang));
//		System.out.println(new ThongKeDAO().thongKeTheoKhoanNgay(ngay, ngay2));

    }
}
