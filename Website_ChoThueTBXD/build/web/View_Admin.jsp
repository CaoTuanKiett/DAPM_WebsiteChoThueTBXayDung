

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./style.css">
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
  <link href="css/viewAdmin.css" rel="stylesheet" type="text/css"/>
  <!-- font chữ -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
  
  <title>Admin</title>
  
</head>
<body >

    <jsp:include page="Admin/Header_Admin.jsp"></jsp:include>
    
    
  <div class="container">
    
    <jsp:include page="Admin/SideBar_Admin.jsp"></jsp:include>

    <div class="container__content">
      
      <div class="container_left">
        <h3>Thông Tin Tài Khoản</h3>

        <div class="container__infor">
          <p>Họ và tên</p>
          <input type="text" value="Cao Tuấn Kiệt">
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Giới tính</p>
          <input type="text" value="Nam">
          <!--<i class="fa-solid fa-chevron-down"></i>-->
          <i class="fa-regular fa-pen-to-square"></i>

        </div>

        <div class="container__infor">
          <p>Năm sinh</p>
          <input type="text" value="06/03/2002">
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Số điện thoại</p>
          <input type="text" value="038484721">
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Email</p>
          <input type="text" value="tuankiet06032002@gmail.com">
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Mật khẩu</p>
          <input type="text" value="*********">
          <i class="fa-regular fa-pen-to-square"></i>
        </div>

        <div class="container__infor">
          <p>Địa chỉ</p>
          <div class="infor_location">
            <div class="location__item">

              <div class="location__item--content">
                <p>Phường/Xã</p>
                <span>Chính Gián</span>
              </div>
              
              <i class="fa-solid fa-chevron-down"></i>
            </div>

            <div class="location__item">
              <div class="location__item--content">
                <p>Quận/Huyện</p>
                <span>Hải Châu</span>
              </div>
              
              <i class="fa-solid fa-chevron-down"></i>
              
            </div>

            <div class="location__item">
              <div class="location__item--content">
                <p>Tỉnh/Thành Phố</p>
                <span>Đà Nẵng</span>
              </div>
              
              <i class="fa-solid fa-chevron-down"></i>
              
            </div>
          </div>
        </div>

        <div class="container__btn">
          <button class="btn">Cập Nhật Thông Tin</button>
        </div>

        
      </div>

      

      <div class="container__right">
        <img src="img/dog.jpg" alt="">
      </div>
      

    </div>

  </div>




  <jsp:include page="Admin/Footer_Admin.jsp"></jsp:include>
</body>
</html>