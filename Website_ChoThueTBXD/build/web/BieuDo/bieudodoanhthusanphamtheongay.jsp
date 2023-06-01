<%@page import="dao.ThietBiDAO"%>
<%@page import="dao.ThongKeDAO"%>
<%@page import="entity.ThietBi_ThongKe"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
    <head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <%  Map<String, ThietBi_ThongKe> mapTS = new ThongKeDAO().thongKeTheoNgayHeThong();
            String ok = (String) session.getAttribute("okngay");
            String ngay = (String) session.getAttribute("ngay");
            if (ok != null) {
                if (ok.equals("ok")) {
                    mapTS = new ThongKeDAO().thongKeTheoNgay(ngay);
                } else {
                    mapTS = new ThongKeDAO().thongKeTheoNgayHeThong();
                }
            } %>
        <script type="text/javascript">
            google.charts.load("current", {packages: ["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
            <% if (mapTS.size() != 0) {
                            for (ThietBi_ThongKe ts : mapTS.values()) {
            %>
                    ['<%=ts.getTenThietBi()%>', <%out.print(new ThietBiDAO().layTongDoanhThuTheoNgay(ts.getNgayThanhToan()));%>],

            <%}
                  }%>

                ]);

                var options = {
                    title: 'Biểu đồ thống kê doanh thu theo ngày',
                    is3D: true,
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
    </body>
</html>