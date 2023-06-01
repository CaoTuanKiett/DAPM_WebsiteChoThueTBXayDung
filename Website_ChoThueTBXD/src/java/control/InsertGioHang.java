/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.CreateGioHang;
import entity.Giohang;
import entity.Items;
import entity.KhachHang;
import entity.Thietbi;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "InsertGioHang", urlPatterns = {"/InsertGioHang"})
public class InsertGioHang extends HttpServlet {
    DAO dao=new DAO();
    double total=0;
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
//        response.setContentType("text/html;charset=UTF-8");
//        HttpSession session = request.getSession();
//        DAO dao = new DAO();
//        Giohang gh = new Giohang();
//        String id = request.getParameter("bid");
//        Thietbi p = dao.getProductByID(id);
//        List<Giohang> cart= null;
//        
//        KhachHang a = (KhachHang) session.getAttribute("acc");
//        String sid =a.getMaKH();
//        
//        
//        dao.InsertToCart("DT005", p.getMaThietBi(),1, p.getDonGiaThue(),sid);
//           
//        //List<Category> listC = dao.getAllCategory();
//
//        //request.setAttribute("ListCC", listC);
//        response.sendRedirect("GioHang");

           

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
                int quantity=1;
                String id;
                if (request.getParameter("bid")!=null) {
                    String pId = request.getParameter("bid");
                    Thietbi thietbi = dao.getProductByID(pId);
                    
                    if (thietbi!=null) {
                        if (request.getParameter("quantity")!=null) {
                            quantity=Integer.parseInt(request.getParameter("quantity"));
                        }
                        
                        HttpSession session = request.getSession();
                        if (session.getAttribute("order")==null) {
                            CreateGioHang gioHang = new CreateGioHang();
                            List<Items> listitem = new ArrayList<Items>();
                            Items items = new Items();
                            items.setThietbi(thietbi);
                            items.setQuality(1);
                            items.setPrice(thietbi.getDonGiaThue());
                            listitem.add(items);
                            gioHang.setItems(listitem);
                            total=items.getPrice()*items.getQuality();
                            session.setAttribute("order", gioHang);
                            session.setAttribute("total", total);
                        }else{
                            CreateGioHang gioHang = (CreateGioHang) session.getAttribute("order");
                            List<Items> listitem= gioHang.getItems();
                            boolean check =false;
                            double total = (double) session.getAttribute("total");
                            for (Items items : listitem) {
                                Thietbi thietbis = dao.getProductByID(pId);
                                if (thietbis.getMaThietBi().equals(items.getThietbi().getMaThietBi())) {
                                    items.setQuality(items.getQuality()+quantity);
                                    total=total+items.getPrice()*1;
                                    check=true;
                                }
                            }
                            if (check==false) {
                                Items items = new Items();
                                items.setQuality(quantity);
                                items.setThietbi(thietbi);
                                items.setPrice(thietbi.getDonGiaThue());
                                listitem.add(items);
                                total=items.getPrice()*items.getQuality()+total;
                            }
                            
                            session.setAttribute("order", gioHang);
                            session.setAttribute("total", total);
                        }
                    }
                    response.sendRedirect("home");
                }else{
                    response.sendRedirect("home");
                }
                    
        }

        
        
        
//                String pId = request.getParameter("bid");
//		Thietbi product = dao.getProductByID(pId);
//
//		HttpSession session = request.getSession();
//		Object obj = session.getAttribute("cart");// luu tam vao session
//		if (obj == null) {// tao moi
//			// Tao mat hang
//			Items billProduct = new Items();
//			billProduct.setThietbi(product);
//			billProduct.setQuality(1);
//			billProduct.setPrice(product.getDonGiaThue());
//			// gio hang co nhieu mat hang
//			Map<String, Items> map = new HashMap<>();
//			map.put(pId, billProduct);// them mat hang vao ds
//
//			session.setAttribute("cart", map);// luu tam vao session
//		} else {
//			Map<String, Items> map = (Map<String, Items>) obj;
//
//			Items billProduct = map.get(pId);
//
//			if (billProduct == null) {
//				billProduct = new BillProduct();
//				billProduct.setProduct(product);
//				billProduct.setQuantity(1);
//				billProduct.setUnitPrice(product.getPrice());
//
//				map.put(pId, billProduct);
//			} else {
//
//				billProduct.setQuantity(billProduct.getQuantity() + 1);
//			}
//
//			session.setAttribute("cart", map);// luu tam vao session
//		}
//
//		resp.sendRedirect(req.getContextPath() + "/cart");
    

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
