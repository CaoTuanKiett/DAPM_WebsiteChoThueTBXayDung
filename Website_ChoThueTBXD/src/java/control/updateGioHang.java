/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.CreateGioHang;
import entity.Items;
import entity.Thietbi;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "updateGioHang", urlPatterns = {"/updateGioHang"})
public class updateGioHang extends HttpServlet {
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
        response.setContentType("text/html;charset=UTF-8");
        String pId = request.getParameter("did");
        String Command = request.getParameter("command");
        
        HttpSession session = request.getSession();
        double total = (double) session.getAttribute("total");
        try {
            CreateGioHang gioHang = (CreateGioHang) session.getAttribute("order");
            List<Items> listitem = gioHang.getItems();
            List<Items> Toremove = new ArrayList<Items>();
            if (request.getParameter("order") != null) {
                
            }
            boolean check = false;
                Thietbi thietbis = dao.getProductByID(pId);
                switch (Command) {
                    case "plus":
                        for (Items items : listitem) {
                            if (thietbis.getMaThietBi().equals(items.getThietbi().getMaThietBi())) {
                                items.setQuality(items.getQuality() + 1);
                                total=total+items.getPrice()*1;
                                session.setAttribute("total", total);
                                check = true;
                            }
                        }
                        response.sendRedirect("Cart.jsp");
                        break;
                    case "sub":
                        for (Items items : listitem) {
                            if (thietbis.getMaThietBi().equals(items.getThietbi().getMaThietBi())) {
                                items.setQuality(items.getQuality()-1);
                                total=total-items.getPrice()*1;
                                session.setAttribute("total", total);
                                if (items.getQuality()<=0) {
                                    Toremove.add(items);
                                }
                                check = true;
                            }
                        }
                        listitem.removeAll(Toremove);
                        response.sendRedirect("Cart.jsp");
                        break;
                    case "refresh":
                        int quantity=Integer.parseInt(request.getParameter("Quantity"));
                        for (Items items : listitem) {
                            if (thietbis.getMaThietBi().equals(items.getThietbi().getMaThietBi())) {
                                items.setQuality(quantity);
                                if (items.getQuality() <= 0) {
                                    Toremove.add(items);
                                }
                                check = true;
                            }
                        }
                        listitem.removeAll(Toremove);
                        response.sendRedirect("Cart.jsp");
                        break;
                    case "delete1":
                        for (Items items : listitem) {
                            if (thietbis.getMaThietBi().equals(items.getThietbi().getMaThietBi())) {
                                items.setQuality(0);
                                if (items.getQuality()<=0) {
                                    Toremove.add(items);
                                }
                                check = true;
                            }
                        }
                        listitem.removeAll(Toremove);
                        response.sendRedirect("Cart.jsp");
                        break;
                    default:
                        throw new AssertionError();
                }
 
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        
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
        processRequest(request, response);
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
