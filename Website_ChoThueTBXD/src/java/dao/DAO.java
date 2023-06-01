/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.ALL_ChiTietTB;
import entity.Account;
import entity.Category;
import entity.ChiTietPN;
import entity.Contact;
import entity.Giohang;
import entity.KhachHang;
import entity.LoaiThietBi;
import entity.Product;
import entity.Thietbi;
import entity.NhaCungCap;
import entity.ThietBiNCC;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author trinh
 */
public class DAO  {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    //Hàm gọi tổng tiền theo đơn thuê
public String CALLTongTien(String maDonThue) {
        
//        String query2="{? = CALL FN_tongTienDonThue(maDonThue)}";
        String query = "SELECT maDonThue, FORMAT(dbo.FN_tongTienDonThue(maDonThue), '##,# \\ VNĐ', 'es-ES') as tongTien\n"
                + "FROM ChiTietDonThue where maDonThue=?";
         
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql

                String TongTien;
                ps = conn.prepareStatement(query);
                ps.setString(1, maDonThue);
                rs=ps.executeQuery();
                while (rs.next()) {
                    return TongTien=rs.getString(2);
                }
                

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ERROR"+e.getMessage());
        }
        return null;
    }


    
    public List<Thietbi> getAllThietBi() {
        List<Thietbi> list = new ArrayList<>();
        String query = "select * from ThietBi";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
               list.add(new Thietbi(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)
//                       rs.getString(7)
                        ));
               

            }
        } catch (Exception e) {
            
        }
        return list;
    }
    
    public List<ThietBiNCC> getAllThietBiNCC() {
        List<ThietBiNCC> list = new ArrayList<>();
        String query = "SELECT ThietBi.maThietBi, ThietBi.tenThietBi, ThietBi.donGiaThue, ThietBi.soluongHienCon, ThietBi.dacDiem, ThietBi.hinhAnh,NhaCungCap.tenNCC\n" +
"FROM NhaCungCap\n" +
"JOIN PhieuNhap ON NhaCungCap.maNCC = PhieuNhap.maNCC\n" +
"JOIN ChiTietPhieuNhap ON PhieuNhap.maPN = ChiTietPhieuNhap.maPN\n" +
"JOIN ThietBi ON ChiTietPhieuNhap.maThietBi = ThietBi.maThietBi";
        
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
               list.add(new ThietBiNCC(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                       rs.getString(7)
                        ));
               

            }
        } catch (Exception e) {
            
        }
        return list;
    }
    
    public List<NhaCungCap> getALLNhaCC() {
        List<NhaCungCap> list = new ArrayList<>();
        String query = "select * from NhaCungCap";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NhaCungCap(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)

                ));
            }
        } catch (Exception e) {
        }
        
        return list;
    }
    
    
    
    public List<ChiTietPN> getAllPhieuNhap() {
        List<ChiTietPN> list = new ArrayList<>();
        String query = "SELECT PhieuNhap.maPN, ChiTietPhieuNhap.maThietBi, ChiTietPhieuNhap.soLuongNhap, ChiTietPhieuNhap.giaNhap, PhieuNhap.ngayNhapHang, NhaCungCap.maNCC, NhaCungCap.tenNCC\n" +
"FROM ChiTietPhieuNhap\n" +
"JOIN PhieuNhap ON PhieuNhap.maPN = ChiTietPhieuNhap.maPN\n" +
"JOIN NhaCungCap ON NhaCungCap.maNCC = PhieuNhap.maNCC\n" ;
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
               list.add(new ChiTietPN(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7)

                        ));
               

            }
        } catch (Exception e) {
            
        }
        return list;
    }
    
    
    public List<ALL_ChiTietTB> getAllChiTietTB() {
        List<ALL_ChiTietTB> list = new ArrayList<>();
        String query = "SELECT NhaCungCap.maNCC, NhaCungCap.tenNCC, NhaCungCap.diaChiNCC, NhaCungCap.SDT, NhaCungCap.Email, NhaCungCap.nhanVienLienHe,\n" +
"       PhieuNhap.maPN, PhieuNhap.ngayNhapHang,\n" +
"       ThietBi.maThietBi, ThietBi.tenThietBi, ThietBi.donGiaThue, ThietBi.soluongHienCon, ThietBi.dacDiem, ThietBi.hinhAnh,\n" +
"       ChiTietPhieuNhap.soLuongNhap, ChiTietPhieuNhap.giaNhap\n" +
"FROM NhaCungCap\n" +
"JOIN PhieuNhap ON NhaCungCap.maNCC = PhieuNhap.maNCC\n" +
"JOIN ChiTietPhieuNhap ON PhieuNhap.maPN = ChiTietPhieuNhap.maPN\n" +
"JOIN ThietBi ON ChiTietPhieuNhap.maThietBi = ThietBi.maThietBi";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
               list.add(new ALL_ChiTietTB(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getDouble(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(15),
                        rs.getDouble(16)                      
                       

                        ));
               

            }
        } catch (Exception e) {
            
        }
        return list;
    }
    
    
    
    public void insertReceipt(String maPhieuNhap, String ngayNhap, String nhaCungCap) {
       String query = "INSERT INTO [dbo].[PhieuNhap] "
            + "([maPN], [ngayNhapHang], [maNCC])"
            + "VALUES (?, ?, ?)";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, maPhieuNhap);
            ps.setString(2, ngayNhap);
            ps.setString(3, nhaCungCap);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
    public void insertDetailReceipt(String maPhieuNhap, String maThietBi, String soLuongNhap, String giaNhap) {
       String query = "INSERT INTO [dbo].[ChiTietPhieuNhap] "
            + "([maPN], [maThietBi], [soLuongNhap], [giaNhap]) "
            + "VALUES (?, ?, ?, ?)";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, maPhieuNhap);
            ps.setString(2, maThietBi);
            ps.setString(3, soLuongNhap);
            ps.setString(4, giaNhap);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteReceipt(String pid) {
        String query = "delete from PhieuNhap\n"
                + "where maPN = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
             System.out.println("dao.DAO.deleteReceipt()====");
        } catch (Exception e) {
            System.out.println("dao.DAO.deleteReceipt()"+ e);
        }
    }
    
    public void deleteDetailReceipt(String pid) {
        String query = "delete from ChiTietPhieuNhap\n"
                + "where maPN = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    

    public ChiTietPN getReceiptByID(String id) {
    String query = "SELECT pn.maPN, ctpn.maThietBi, ctpn.soLuongNhap, ctpn.giaNhap, pn.ngayNhapHang, ncc.maNCC, ncc.tenNCC\n" +
                   "FROM ChiTietPhieuNhap ctpn\n" +
                   "JOIN PhieuNhap pn ON pn.maPN = ctpn.maPN\n" +
                   "JOIN NhaCungCap ncc ON ncc.maNCC = pn.maNCC\n" +
                   "WHERE pn.maPN = ?";
    
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setString(1, id);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return new ChiTietPN(rs.getString(1),
                                     rs.getString(2),
                                     rs.getInt(3),
                                     rs.getDouble(4),
                                     rs.getDate(5),
                                     rs.getString(6),
                                     rs.getString(7));
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return null;
}
    
    
    public void editReceipt(String maPhieuNhap, String ngayNhap, String nhaCungCap) {
    String query = "UPDATE [dbo].[PhieuNhap] "
            + "SET [ngayNhapHang] = ?, [maNCC] = ?"
            + "WHERE [maPN] = ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
            
            ps.setString(1, ngayNhap);
            ps.setString(2, nhaCungCap);
            ps.setString(3, maPhieuNhap);
            
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("+++++>"+e);
        }
    }
    
    public void editDetailReceipt(String maPhieuNhap, String maThietBi, String soLuongNhap, String giaNhap) {
    String query = "UPDATE [dbo].[ChiTietPhieuNhap] "
            + "SET [maThietBi] = ?, [soLuongNhap] = ?, [giaNhap] = ?"
            + "WHERE [maPN] = ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
            
            ps.setString(1, maThietBi);
            ps.setString(2, soLuongNhap);
            ps.setString(3, giaNhap);
            ps.setString(4, maPhieuNhap);
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("==========>>" +e);
        }
    }
    
    
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public List<LoaiThietBi> getAllCategory() {
        List<LoaiThietBi> list = new ArrayList<>();
        String query = "select * from DanhMucThietBi";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new LoaiThietBi(rs.getString(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    public List<Thietbi> getProductByCID(String cid) {
        List<Thietbi> list = new ArrayList<>();
        String query = "select * from ThietBi\n"
                + "where maLoai = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Thietbi(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)
//                        ,
//                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Thietbi getLast() {
        String query = "select top 1 * from ThietBi\n"
                + "order by maThietBi desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Thietbi(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)
//                        ,
//                        rs.getString(7)
                );
     
            
            }
        } catch (Exception e) {
        }
        return null;
    }
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop3() {
        List<Product> list = new ArrayList<>();
        String query = "select top 3 * from product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNext3Product(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "  FROM product\n"
                + " ORDER BY id\n"
                + "OFFSET ? ROWS\n"
                + " FETCH NEXT 3 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

//    public List<Product> getProductByCID(String cid) {
//        List<Product> list = new ArrayList<>();
//        String query = "select * from product\n"
//                + "where cateID = ?";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setString(1, cid);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Product(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getString(5),
//                        rs.getString(6)));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }

    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where sell_ID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Thietbi> searchAll(String txtSearch) {
        List<Thietbi> list = new ArrayList<>();
    String query = "SELECT * FROM ThietBi " +
                   "WHERE maThietBi LIKE ? OR " +
                   "tenThietBi LIKE ? OR " +
                   "donGiaThue LIKE ? OR " +
                   "soluongHienCon LIKE ? OR " +
                   "dacDiem LIKE ? OR " +
                   "hinhAnh LIKE ? OR " +
                   "maDanhMuc LIKE ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        String searchPattern = "%" + txtSearch + "%";
        for (int i = 1; i <= 7; i++) {
            ps.setString(i, searchPattern);
        }
        rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Thietbi(rs.getString(1),
                                 rs.getString(2),
                                 rs.getDouble(3),
                                 rs.getInt(4),
                                 rs.getString(5),
                                 rs.getString(6)));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Đảm bảo đóng ResultSet, PreparedStatement và Connection
        // trong phần finally để giải phóng tài nguyên
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return list;
    }
    
    public List<Thietbi> searchAndFilter(String keyword, String minPrice, String maxPrice, String categoryCode) {
    List<Thietbi> list = new ArrayList<>();
    String query = "SELECT * FROM ThietBi " +
                   "WHERE (maThietBi LIKE ? OR " +
                   "tenThietBi LIKE ? OR " +
                   "dacDiem LIKE ?) " +
                   "AND donGiaThue >= ? AND donGiaThue <= ? " +
                   "AND soluongHienCon >= ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        String searchPattern = "%" + keyword + "%";
        ps.setString(1, searchPattern);
        ps.setString(2, searchPattern);
        ps.setString(3, searchPattern);
        ps.setString(4, minPrice);
        ps.setString(5, maxPrice);
        ps.setString(6, categoryCode);
        rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Thietbi(rs.getString(1),
                                 rs.getString(2),
                                 rs.getDouble(3),
                                 rs.getInt(4),
                                 rs.getString(5),
                                 rs.getString(6)));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Đảm bảo đóng ResultSet, PreparedStatement và Connection
        // trong phần finally để giải phóng tài nguyên
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return list;
}

    

    public Thietbi getProductByID(String id) {
        String query = "select * from ThietBi\n"
                + "where maThietBi = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Thietbi(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)
//                        ,
//                        rs.getString(7)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    
//    public ArrayList getdetailProduct(int id){
//        ArrayList listC = new ArrayList();
//        String query = "select * from Cart1,product where AccountID= ? and Cart1.ProductID=product.id ";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            ResultSet rs= ps.executeQuery();
//            while (rs.next()) {
//                Giohang gh= new Giohang();
//                gh.setProductID(rs.getInt("AccountID"));
//                gh.setProductID(rs.getInt("ProductID"));
//                gh.setAmount(rs.getInt("Amount"));
//                gh.setNumber(rs.getInt("Number"));
//                Product pr=new Product();
//                pr.setName(rs.getString("name"));
//                pr.setImage(rs.getString("image"));
//                pr.setPrice(rs.getInt("price"));
//                pr.setTitle(rs.getString("title"));
//                listC.add(gh);
//                listC.add(pr);
//            }
//        } catch (Exception e) {
//        }
//        return listC;
//    }
    

//    public List<Category> getAllCategory() {
//        List<Category> list = new ArrayList<>();
//        String query = "select * from Category";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Category(rs.getInt(1),
//                        rs.getString(2)));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
//
//    public Product getLast() {
//        String query = "select top 1 * from product\n"
//                + "order by id desc";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                return new Product(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getString(5),
//                        rs.getString(6)
//                );
//            }
//        } catch (Exception e) {
//        }
//        return null;
//    }

    public KhachHang login(String Email, String pass) {
        String query = "select * from KhachHang\n"
                + "where Email = ?\n"
                + "and matKhau = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new KhachHang(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String query = "select * from account\n"
                + "where [user] = ?\n";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void singup(String user, String pass) {
        String query = "insert into account\n"
                + "values(?,?,0,0)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProduct(String pid) {
        String query = "delete from ThietBi\n"
                + "where maThietBi = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String maThietBi, String tenThietBi, String donGiaThue, String soluongHienCon, String dacDiem, String hinhAnhString) {
       String query = "INSERT INTO [dbo].[ThietBi] "
            + "([maThietBi], [tenThietBi], [donGiaThue], [soluongHienCon], [dacDiem], [hinhAnh]) "
            + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, maThietBi);
            ps.setString(2, tenThietBi);
            ps.setString(3, donGiaThue);
            ps.setString(4, soluongHienCon);
            ps.setString(5, dacDiem);
            ps.setString(6, hinhAnhString);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void InsertToCart(int AcID, int ProductID, int So_Luong, int Amount) {
        String query = "INSERT [dbo].[Cart1] \n"
                + "([AccountID], [ProductID], [Amount], [Number])\n"
                + "VALUES(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1,AcID );
            ps.setInt(2, ProductID);
            ps.setInt(3, So_Luong);
            ps.setInt(4, Amount);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editProduct(String maThietBi, String tenThietBi, String donGiaThue, String soluongHienCon, String dacDiem, String hinhAnhString) {
    String query = "UPDATE [dbo].[ThietBi] "
            + "SET [tenThietBi] = ?, [donGiaThue] = ?, [soluongHienCon] = ?, [dacDiem] = ?, [hinhAnh] = ? "
            + "WHERE [maThietBi] = ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, tenThietBi);
        ps.setString(2, donGiaThue);
        ps.setString(3, soluongHienCon);
        ps.setString(4, dacDiem);
        ps.setString(5, hinhAnhString);
        ps.setString(6, maThietBi);
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println(e);
        }
    }

    
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        List<Product> list = dao.getAllProduct();
//        //List<Category> listC = dao.getAllCategory();
//
//        for (Category o : listC) {
//            System.out.println(o);
//        }
//    }
    
    

    public void InsertToContact(String ngayTaoDon,String diaChi, String SDT,String TrangThai,String maKH,String ghiChu) {
        
        String query1="set dateformat dmy";
//        String query2="{? = CALL AUTO_IDTB111()}";
        String query = "insert into DonThue_HopDongChoThue(maDonThue,ngayTaoDon,diachiGiaoHang,SDTGiaoHang,trangthaiHoaDon,maKH,ghiChu)\n" +
                        "values (?,?,?,?,?,?,?)";
         
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            java.sql.Date sqlDate = java.sql.Date.valueOf(ngayTaoDon);
//            CallableStatement stmt= conn.prepareCall(query1);
//          stmt.registerOutParameter(1, Types.VARCHAR);
//            stmt.execute();
            ps = conn.prepareStatement(query);
            
            String maDonThue="";
            ps.setString(1, maDonThue);
            ps.setDate(2,sqlDate );
            ps.setString(3, diaChi);
            ps.setString(4, SDT);
            ps.setString(5,TrangThai);
            ps.setString(6,maKH);
            ps.setString(7, ghiChu);
            ps.executeQuery();
            int result = ps.executeUpdate();
            if(result >0){
                System.out.println("insert success");
            }
//            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ERROR"+e.getMessage());
        }
    }
    public String CallIDTuTang() {
        
        String query1="set dateformat dmy";
        String query2="{? = CALL FN_TuDongTangIDDonThue()}";
//        String query = "insert into DonThue_HopDongChoThue(maDonThue,ngayTaoDon,diachiGiaoHang,SDTGiaoHang,trangthaiHoaDon,maKH)\n" +
//                        "values (?,?,?,?,?,?)";
         
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
//            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
//            java.util.Date myDate = new java.util.Date("10/10/2009");
//            java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
            CallableStatement stmt= conn.prepareCall(query2);
            stmt.registerOutParameter(1, Types.VARCHAR);
            stmt.execute();
//            ps = conn.prepareStatement(query);
            
            String maDonThue=stmt.getString(1);
//            ps.setString(1, maDonThue);
//            ps.setDate(2,sqlDate );
//            ps.setString(3, diaChi);
//            ps.setString(4, SDT);
//            ps.setString(5,TrangThai);
//            ps.setString(6,maKH);
//            ps.executeQuery();
            return maDonThue;
//            stmt.close();
            //conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ERROR"+e.getMessage());
        }
        return null;
    }

    
    public List<Contact> getHopDongByCID(String Kid) {
        List<Contact> list = new ArrayList<>();
        String query = "SELECT DISTINCT maDonThue, ngayTaoDon, tenThonTo, tenPhuongXa, tenQuanHuyen, tenTinhThanh, SDTGiaoHang,trangthaiHoaDon,ghiChu\n"
                + "FROM KhachHang, DonThue_HopDongChoThue, PhuongXa, QuanHuyen, TinhThanh, ThonTo\n"
                + "WHERE KhachHang.maKH=DonThue_HopDongChoThue.maKH \n"
                + "	AND PhuongXa.idPhuongXa=ThonTo.xaPhuongNo \n"
                + "	AND PhuongXa.quanHuyenNo=QuanHuyen.idQuanHuyen\n"
                + "	AND QuanHuyen.tinhThanhNo=TinhThanh.idTinhThanh\n"
                + "	AND DonThue_HopDongChoThue.diachiGiaoHang = ThonTo.idThonTo\n"
                + "	AND DonThue_HopDongChoThue.maKH = ? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Kid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Contact(rs.getString(1),
                        rs.getDate(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Giohang> getProductCArtByCID(String Kid) {
        List<Giohang> list = new ArrayList<>();
        String query = "select maDonThue,CT.maThietBi,hinhAnh,tenThietBi,CT.donGiaDat,soLuongDat\n" +
                    "from ChiTietDonThue as CT,ThietBi as TB where CT.maThietBi=TB.maThietBi and maKH= ? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Kid);
            rs = ps.executeQuery();
            while (rs.next()) {
               list.add(new Giohang(rs.getString(1),
                        rs.getString(2),
                       rs.getString(3),
                       rs.getString(4),
                       rs.getString(5),
                        rs.getString(6)
                        ));
     
            }
        } catch (Exception e) {
        }
        return list;
    }
    public KhachHang getKhachHangByID(String id) {
        String query = "select * from KhachHang Where maKH= ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new KhachHang(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<Giohang> getCartbyIDandHD(String Kid,String maDonThue) {
        List<Giohang> list = new ArrayList<>();
        String query = "select hd.maDonThue,CT.maThietBi,hinhAnh,tenThietBi,CT.donGiaDat,soLuongDat\n"
                + "from ChiTietDonThue as CT,DonThue_HopDongChoThue as hd,ThietBi as TB where CT.maThietBi=TB.maThietBi and hd.maDonThue=CT.maDonThue and hd.maKH= ? and hd.maDonThue = ? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Kid);
            ps.setString(2, maDonThue);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Giohang(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                       rs.getString(6)
                        ));
     
            }
        } catch (Exception e) {
        }
        System.out.println("dao.DAO.getCartbyIDandHD()"+ list);
        return list;
    }
    
    


//    public List<Product> getProductByCID(String cid) {
//        List<Product> list = new ArrayList<>();
//        String query = "select * from product\n"
//                + "where cateID = ?";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setString(1, cid);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Product(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getString(5),
//                        rs.getString(6)));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }

    public List<Giohang> getProductBySellID(String id) {
        List<Giohang> list = new ArrayList<>();
        String query = "select * from ThietBi\n"
                + "where maKH = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Giohang(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }



    
//    public ArrayList getdetailProduct(int id){
//        ArrayList listC = new ArrayList();
//        String query = "select * from Cart1,product where AccountID= ? and Cart1.ProductID=product.id ";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            ResultSet rs= ps.executeQuery();
//            while (rs.next()) {
//                Giohang gh= new Giohang();
//                gh.setProductID(rs.getInt("AccountID"));
//                gh.setProductID(rs.getInt("ProductID"));
//                gh.setAmount(rs.getInt("Amount"));
//                gh.setNumber(rs.getInt("Number"));
//                Product pr=new Product();
//                pr.setName(rs.getString("name"));
//                pr.setImage(rs.getString("image"));
//                pr.setPrice(rs.getInt("price"));
//                pr.setTitle(rs.getString("title"));
//                listC.add(gh);
//                listC.add(pr);
//            }
//        } catch (Exception e) {
//        }
//        return listC;
//    }
    

//    public List<Category> getAllCategory() {
//        List<Category> list = new ArrayList<>();
//        String query = "select * from Category";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Category(rs.getInt(1),
//                        rs.getString(2)));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
//
//    public Product getLast() {
//        String query = "select top 1 * from product\n"
//                + "order by id desc";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                return new Product(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getString(5),
//                        rs.getString(6)
//                );
//            }
//        } catch (Exception e) {
//        }
//        return null;
//    }


    public KhachHang login1(String Email, String pass) {
        String query = "select * from NhanVienChoThue\n"
                + "where Email = ?\n"
                + "and matKhau = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new KhachHang(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    


    public void insertProduct(String name, String image, String price,
            String title, String description, String category, String sid) {
        String query = "INSERT [dbo].[product] \n"
                + "([name], [image], [price], [title], [description], [cateID], [sell_ID])\n"
                + "VALUES(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public static Date convertUtilDateToSqlDate(java.util.Date date){
        if(date != null) {
            Date sqlDate = new Date(date.getTime());
            return sqlDate;
        }
        return null;
    }
    public void InsertToCart(String AcID, String ProductID, int So_Luong, double Amount) {
        String query = "INSERT [dbo].[ChiTietDonThue] \n"
                + "([maDonThue], [maThietBi], [soLuongDat], [donGiaDat])\n"
                + "VALUES(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,AcID );
            ps.setString(2, ProductID);
            ps.setInt(3, So_Luong);
            ps.setDouble(4, Amount);
            ps.executeQuery();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

    public void editProduct(String name, String image, String price,
            String title, String description, String category, String pid) {
        String query = "update product\n"
                + "set [name] = ?,\n"
                + "[image] = ?,\n"
                + "price = ?,\n"
                + "title = ?,\n"
                + "[description] = ?,\n"
                + "cateID = ?\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        List<Product> list = dao.getAllProduct();
//        //List<Category> listC = dao.getAllCategory();
//
//        for (Category o : listC) {
//            System.out.println(o);
//        }
//    }


}