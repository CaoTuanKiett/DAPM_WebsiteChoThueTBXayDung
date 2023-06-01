<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>XUẤT HÓA ĐƠN</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
        
    <body id="body">
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2> <b>Manage BILLS</b></h2>
                            <h2> <a style="color: white" href="home">Home</a></h2>
                        </div>
                        <!--                        <div class="col-sm-6">
                                                    <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>					
                                                    <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>
                                                </div>-->
                    </div>
                </div>
                <div class="modal-header">						
                    <h4 class="modal-title">Thông tin chi tiết hợp đồng</h4>
                    <button onclick="printPage()">Xuất hóa đơn</button>
                </div>
                <div id="data">
                    <div >
                        <div>
                            <div >


                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>Tên Khách hàng</label>
                                        <input name="name" type="text" class="form-control" value="${KhachHang.tenKH}" required>
                                    </div>
                                    <div class="form-group">
                                        <label>SDT</label>
                                        <input name="image" type="text" class="form-control" value="${KhachHang.SDT}" required>
                                    </div>
                                    
                                   
                                    <div class="form-group">
                                        <label>Tổng tiền</label>
                                        <input name="Email" type="text" class="form-control" value="${Total}" required>
                                    </div>




                                </div>

                            </div>
                        </div>
                    </div>
                    <br>
                    <hr>
                    <div class="table-responsive">
                        <table class="table" border="2" >
                            <thead>
                                <tr>
                                    <th scope="col" class="border-0 bg-light">
                                        <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                    </th>
                                    <th scope="col" class="border-0 bg-light">
                                        <div class="py-2 text-uppercase">Đơn Giá</div>
                                    </th>
                                    <th scope="col" class="border-0 bg-light">
                                        <div class="py-2 text-uppercase">Số Lượng</div>
                                    </th>
                                    <th scope="col" class="border-0 bg-light">
                                        <div class="py-2 text-uppercase">Thành tiền</div>
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                
                                <c:forEach items="${ListP}" var="o">
                                    <tr>
                                        <th scope="row">
                                            <div class="p-2">
                                                <div class="m0l-3 d-inline-block align-middle">
                                                    <img src="${o.hinhAnh}" alt="" width="200" height="200">
                                                    <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${o.tenThietBi}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                </div>
                                            </div>
                                        </th>
                                        <td class="align-middle"><strong>${o.giaDonThue}</strong></td>
                                        <td class="align-middle">
                                            <input class="input-qty" max="Số tối đa" min="0" type="text" name="Quantity" value="${o.so_luong}" >
                                        </td>
                                        <td class="align-middle">${o.giaDonThue*o.so_luong}</td>



                                    </tr> 
                                </c:forEach>
                            </tbody>
                        </table>
                        </tbody>

                        <!--                <div class="clearfix">
                                            <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                            <ul class="pagination">
                                                <li class="page-item disabled"><a href="#">Previous</a></li>
                                                <li class="page-item active"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                            </ul>
                                        </div>-->
                    </div>
                </div>
                
            </div>
        </div>
            <!-- Edit Modal HTML -->

            <script src="js/manager.js" type="text/javascript"></script>
            <script>

            </script>
    </body>
    <script type="text/javascript">
        function printPage(){
            var body= document.getElementById('body').innerHTML;
            var data= document.getElementById('data').innerHTML;
            
            document.getElementById('body').innerHTML=data;
            window.print();
            document.getElementById('body').innerHTML=body;
        }
    </script>
</html>