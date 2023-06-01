/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import context.DBContext;
import dao.DAO;
import entity.Contact;
import entity.CreateGioHang;
import entity.Giohang;
import entity.Items;
import entity.KhachHang;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import static java.util.Map.entry;
import java.util.Random;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.lang.model.util.Types;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "BuyControl", urlPatterns = {"/BuyControl"})
public class BuyControl extends HttpServlet {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DAO dao = new DAO();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                HttpSession session = request.getSession();
		

		if (session.getAttribute("order")!=null) {//KIEM TRA XEM CO SP TRONG GIO HANG 

			//TAO HOA DON TRUOC, DE LAY DUOC ID BILL
			Contact bill = new Contact();

			// lay dang nhap
			KhachHang buyer = (KhachHang) session.getAttribute("acc");
                        
                        String ngayTaoDon=request.getParameter("date1");
                        String GhiChu = request.getParameter("title");
                        String SDT1 = request.getParameter("SDT");
                        String maKH= buyer.getMaKH();
                        String diaChi = buyer.getDiachiKH();
                        String SDT= buyer.getSDT();
                        String TrangThai = "BT";
                        String maDonThue=dao.CallIDTuTang();
                        
                        
                        dao.InsertToContact(ngayTaoDon, diaChi, SDT1, TrangThai, maKH,GhiChu);
			//XEM THEM O LOP BILLDAO, CACH TRA VE ID TU GEN O SQL
			// save bill trc de lay id
			// Tim mat hang
			double total = (double) session.getAttribute("total");//tinh tong gia
			CreateGioHang gioHang = (CreateGioHang) session.getAttribute("order");
                        List<Items> listitem= gioHang.getItems();
			//lap cac phan tu trong map
			for (Items items : listitem) {
                                String maThietBi = items.getThietbi().getMaThietBi();
                                int soluong = items.getQuality();
                                double dongia=items.getThietbi().getDonGiaThue()*soluong;
                                dao.InsertToCart(maDonThue, maThietBi, soluong, dongia);
				
			}
			
			///cap nhat lai bill de co tong gia tien
			

			// chuyen ve trang thanh cong
			// xoa session gio hang vi da tao don hang thanh cong, giai phong bo nho
			session.removeAttribute("order");
                        response.sendRedirect("home");
		} else {
			// tra ve trang chu neu gio hang rong
			
			response.sendRedirect("Cart.jsp");
		}

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
