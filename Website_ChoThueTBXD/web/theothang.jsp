<%@page import="dao.ThongKeDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="entity.ThietBi_ThongKe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê theo tháng</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- datatable -->
        <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <jsp:include page="header.jsp"></jsp:include>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <h1>Mời chọn tháng:</h1>
                        <form action="ThongKeDoanhThu?action=TheoThang" method="post">
                            <input type="month" name="thang">
                            <button class="btn btn-sm btn-defaut" type="submit">Thống kê</button>
                        </form>

                    </div>
                </div>
                <div class="row" style="float:right">
                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#bieudotheothang">Xem biểu đồ</button>
                    <div class="modal fade" id="bieudotheothang" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title" style="text-align:center">Biểu đồ doanh thu sản phẩm theo tháng</h4>
                                </div>
                                <div class="modal-body">
                                <jsp:include page="BieuDo/bieudodoanhthusanphamtheothang.jsp"></jsp:include>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="row">
                <%Map<String, ThietBi_ThongKe> mapTS = new ThongKeDAO().thongKeTheoThangHeThong();
                    String ok = (String) session.getAttribute("okthang");
                    String thang = (String) session.getAttribute("month");
                    if (ok != null) {
                        if (ok.equals("ok")) {
                            mapTS = new ThongKeDAO().thongKeTheoThang(thang);
                        } else {
                            mapTS = new ThongKeDAO().thongKeTheoThangHeThong();
                        }
                    }
                %>
                <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên thiết bị</th>
                            <th>Giá thiết bị</th>
                            <th>Số lượng bán ra</th>
                            <th>Doanh thu</th>
                            <th>Ngày</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%int count = 0;
                          for (ThietBi_ThongKe ts : mapTS.values()) {
                              count++;%>
                        <TR>
                            <TD> <%= count%></td>
                            <TD> <%= ts.getTenThietBi()%></TD>
                            <TD> <%= ts.getDonGiaDat()%></TD>
                            <TD> <%= ts.getSoLuongDat()%></TD>
                            <TD> <%=ts.getTongTien()%></TD>
                            <TD> <%=ts.getNgayThanhToan()%></TD>
                        </TR>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- datatable -->
    <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="vendors/jszip/dist/jszip.min.js"></script>
    <script src="vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="vendors/pdfmake/build/vfs_fonts.js"></script>


    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
</html>