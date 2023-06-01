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
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!--<link rel="stylesheet" href="./main.js" >-->
  
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
  
  <!-- font chữ -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
  
  <link href="css/viewAdminEditProduct.css" rel="stylesheet" type="text/css"/>
  <title>Admin Edit Product</title>
  
</head>
<body >

    <jsp:include page="Admin/Header_Admin.jsp"></jsp:include>
    
    
  <div class="container">
    
    <jsp:include page="Admin/SideBar_Admin.jsp"></jsp:include>

    <div class="container__content">

        
            <div class="container_left">
                <form action="editReceipt" method="post">
                    <div class="container__content--back">
          <i class="fa-solid fa-chevron-left"></i>
          <p><a href="view_AdminReceipt">Quay lại</a> </p>
        </div>
        
        <h3>Thông Tin Thiết Bị</h3>

        <div class="container__infor">
          <p>Mã Phiếu Nhập</p>
          <input id="input_primary" type="text" value="${CTPN_ID.maPN}" name="maPhieuNhap" readonly required>
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Mã thiết bị</p>
          <input id="input_primary" type="text" value="${CTPN_ID.maThietBi}" name="maThietBi" readonly required>
          <!--<i class="fa-solid fa-chevron-down"></i>-->
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Số Lượng Nhập</p>
          <input type="text" value="${CTPN_ID.soLuongNhap}" name="soLuongNhap"required>
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Giá Nhập</p>
          <input type="text" value="${CTPN_ID.giaNhap}" name="giaNhap" required>
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor" >
          <p>Ngày Nhập Hàng</p>
          <input type="text" value="${CTPN_ID.ngayNhapHang}" name="ngayNhapHang">
          <!--<textarea name="dacDiem" id="MoTa" s placeholder="Nhập mô tả ..." required></textarea>-->
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Nhà Cung Cấp</p>
<!--          <input type="text" value="${CTPN_ID.maNCC}" name="maNCC" required>
          <i class="fa-regular fa-pen-to-square"></i>-->
          
          <select name="maNCC" class="form-select" value="${CTPN_ID.maNCC}" aria-label="Default select example">
                <c:forEach items="${ListNCC}" var="o">
                    <option value="${o.maNCC}" ${o.maNCC == CTPN_ID.maNCC ? 'selected' : 'o.tennCC'} >${o.tennCC}</option>
                </c:forEach>
            </select>
        </div>

      

        <div class="container__btn">
          <button class="btn container__btn--submid">Cập Nhật</button>

          <button class="btn"><a href="view_AdminReceipt">Hủy</a></button>
        </div>
                </form>

        

        
      </div>
        
      
      

      

      <div class="container__right">
          
          <c:forEach items="${ListTB}" var="o">
                <c:if test="${CTPN_ID.maThietBi == o.maThietBi}">
                    <img src="${o.hinhAnhString}" alt="">
                </c:if>
           </c:forEach>
          
         
        <!--<img src="https://i.pinimg.com/564x/e1/22/90/e12290094e126bc571b8850f77932ee0.jpg" alt="">-->
      </div>
      

    </div>

  </div>



<jsp:include page="Admin/Footer_Admin.jsp"></jsp:include>
  
</body>
</html>