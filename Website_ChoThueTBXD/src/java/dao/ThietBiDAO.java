package dao;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import context.DBContext;
import entity.ThietBi_ThongKe;

public class ThietBiDAO implements Object {

    public static Map<String, ThietBi_ThongKe> mapTraSua = loadDTB();
    public static Map<String, ThietBi_ThongKe> mapTraSua1 = loadDTB1();

    public int layTongDoanhThuTheoNgay(String date) {
        int sum = 0;
        for (ThietBi_ThongKe ts : mapTraSua1.values()) {
            if (ts.getNgayThanhToan().equals(date)) {
                sum += ts.getTongTien();
            }
        }
        return sum;
    }

    public int layTongDoanhThuTheoThang(String text) {
        int sum = 0;
        Map<String, ThietBi_ThongKe> mapTS = new ThongKeDAO().thongKeTheoThang(text);
        for (ThietBi_ThongKe ts : mapTS.values()) {
            if (ts.getMaThietBi().equals(mapTraSua.get(ts.getMaThietBi()).getMaThietBi())) {
                sum += ts.getTongTien();
            }
        }
        return sum;
    }

    public int layTongDoanhThuTheoTuan(String tuan, String text) {
        Map<String, ThietBi_ThongKe> mapTS = new ThongKeDAO().thongKeTheoTuan(tuan, text);
        int sum = 0;
        for (ThietBi_ThongKe ts : mapTS.values()) {
            if (ts.getMaThietBi().equals(mapTraSua.get(ts.getMaThietBi()).getMaThietBi())) {
                sum += ts.getTongTien();
            }
        }
        return sum;
    }

    public int layTongDoanhThuTheoKhoangNgay(String dateStart, String dateEnd) {
        Map<String, ThietBi_ThongKe> mapTS = new ThongKeDAO().thongKeTheoKhoanNgay(dateStart, dateEnd);
        int sum = 0;
        for (ThietBi_ThongKe ts : mapTS.values()) {
            if (ts.getMaThietBi().equals(mapTraSua.get(ts.getMaThietBi()).getMaThietBi())) {
                sum += ts.getTongTien();
            }
        }
        return sum;
    }

    public static void main(String[] args) {
//		System.out.println(new ThietBiDAO().layTongDoanhThuTheoNgay("2017-05-10"));
//		System.out.println(mapTraSua.get("TS008"));
    }

    private static Map<String, ThietBi_ThongKe> loadDTB() {
        String a = "1";
        Map<String, ThietBi_ThongKe> map = new HashMap<>();
        try {
            ResultSet rs = new DBContext().chonDuLieu("select tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, SUM(donGiaDat*soLuongDat) as tongTien, ngayThanhToan\n"
                    + "from ChiTietDonThue as ctdt\n"
                    + "join DonThue_HopDongChoThue as dt on  dt.maDonThue = ctdt.maDonThue\n"
                    + "join ThietBi as tb on  ctdt.maThietBi = tb.maThietBi\n"
                    + "group by tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, ngayThanhToan");
            while (rs.next()) {

                String ma = rs.getString(1);
                String ten = rs.getString(2);
                Double gia = rs.getDouble(3);
                int soLuong = rs.getInt(4);
                Double doanhThu = rs.getDouble(5);
                String ngay = rs.getString(6);
                map.put(ma, new ThietBi_ThongKe(ma, ten, gia, soLuong, doanhThu, ngay));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;
    }

    private static Map<String, ThietBi_ThongKe> loadDTB1() {
        String a = "1";
        Map<String, ThietBi_ThongKe> map = new HashMap<>();
        try {
            ResultSet rs = new DBContext().chonDuLieu("select tb.maThietBi, tenThietBi, donGiaDat, soLuongDat, SUM(donGiaDat*soLuongDat) as tongTien, ngayThanhToan\n"
                    + "from ChiTietDonThue as ctdt\n"
                    + "join DonThue_HopDongChoThue as dt on  dt.maDonThue = ctdt.maDonThue\n"
                    + "join ThietBi as tb on  ctdt.maThietBi = tb.maThietBi\n"
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
        }

        return map;
    }

    @Override
    public boolean add(Object obj) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean edit(Object obj) {
        return false;
    }

    @Override
    public boolean del(String id) {
        return false;
    }

}
