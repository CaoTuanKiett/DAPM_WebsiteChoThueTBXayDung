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
                <form action="edit" method="post">
                    <div class="container__content--back">
          <i class="fa-solid fa-chevron-left"></i>
          <p><a href="view_AdminProduct">Quay lại</a> </p>
        </div>
        
        <h3>Thông Tin Thiết Bị</h3>

        <div class="container__infor">
          <p>Mã thiết bị</p>
          <input id="input_primary" type="text" value="${detail.maThietBi}" name="maThietBi" readonly required>
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Tên thiết bị</p>
          <input type="text" value="${detail.tenThietBi}" name="tenThietBi" required>
          <!--<i class="fa-solid fa-chevron-down"></i>-->
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Giá</p>
          <input type="text" value="${detail.donGiaThue}" name="donGiaThue"required>
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Số lượng</p>
          <input type="text" value="${detail.soluongHienCon}" name="soluongHienCon" required>
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Đặc điểm</p>
          <!--<input type="text">-->
          <textarea name="dacDiem" id="MoTa" s placeholder="Nhập mô tả ..." required>${detail.dacDiem}</textarea>
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Hình ảnh</p>
          <input type="text" value="${detail.hinhAnhString}" name="hinhAnhString" required>
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

      

        <div class="container__btn">
          <button class="btn container__btn--submid">Cập Nhật</button>

          <button class="btn"><a href="view_AdminProduct">Hủy</a></button>
        </div>
                </form>

        

        
      </div>
        
      
      

      

      <div class="container__right">
        <img src="${detail.hinhAnhString}" alt="">
      </div>
      

    </div>

  </div>



<jsp:include page="Admin/Footer_Admin.jsp"></jsp:include>
  
</body>
</html>