package control;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ThongKeDAO;
import entity.ThietBi_ThongKe;

@WebServlet("/ThongKeDoanhThu")
public class ThongKeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThongKeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getParameter("action");
		if(action==null){
			
		}
		else if(action.equals("TheoThang")){
			String month = request.getParameter("thang");
			Map<String, ThietBi_ThongKe> map = new ThongKeDAO().thongKeTheoThang(month);
			String okthang ="none";
			if(map.size()!=0){
				okthang="ok";
			}
			HttpSession session = request.getSession();
			session.setAttribute("okthang", okthang);
			session.setAttribute("month", month);
			response.sendRedirect("theothang.jsp");
		}
		else if(action.equals("TheoNgay")){
			String ngay = request.getParameter("ngay");
			Map<String, ThietBi_ThongKe> map = new ThongKeDAO().thongKeTheoNgay(ngay);
			String okngay ="none";
			if(map.size()!=0){
				okngay="ok";
			}
			HttpSession session = request.getSession();
			session.setAttribute("okngay", okngay);
			session.setAttribute("ngay", ngay);
			response.sendRedirect("theongay.jsp");
		}
		else if(action.equals("TheoTuan")){
			String tuan = request.getParameter("tuan");
			String thang = request.getParameter("thangTheoTuan");
			Map<String, ThietBi_ThongKe> map = new ThongKeDAO().thongKeTheoTuan(tuan, thang);
			String oktuan ="none";
			if(map.size()!=0){
				oktuan="ok";
			}
			HttpSession session = request.getSession();
			session.setAttribute("oktuan", oktuan);
			session.setAttribute("tuan", tuan);
			session.setAttribute("thangTheoTuan", thang);
			response.sendRedirect("theotuan.jsp");
		}
		else if(action.equals("KhoangNgay")){
			String ngayBatDau = request.getParameter("ngayBatDau");
			String ngayKetThuc = request.getParameter("ngayKetThuc");
			Map<String, ThietBi_ThongKe> map = new ThongKeDAO().thongKeTheoKhoanNgay(ngayBatDau, ngayKetThuc);
			String okkn ="none";
			if(map.size()!=0){
				okkn="ok";
			}
			HttpSession session = request.getSession();
			session.setAttribute("okkn", okkn);
			session.setAttribute("ngayBatDau", ngayBatDau);
			session.setAttribute("ngayKetThuc", ngayKetThuc);
			response.sendRedirect("theokhoangngay.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
