

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <header>

    <div class="header_container">
      <div class="header_search">
        <input type="text" placeholder="Search">
        <i class="fa-solid fa-magnifying-glass"></i> 
      </div>
  
      <div class="header_infor">
        <li class="infor_item">
          <i class="fa-regular fa-phone"></i>
          <p>1800 1515</p>
        </li>
        <li class="infor_item">
          <i class="fa-regular fa-bell"></i>
          <p>Thông báo</p>
        </li>
        <li class="infor_item">
          <i class="fa-brands fa-facebook-messenger"></i>
          <p>Tin Nhắn</p>
        </li>
        <li class="infor_item">
          <img src="img/dog.jpg" alt="avt">
          <p><a class="navbar-brand" href="view_Admin">Hi! ${sessionScope.acc.tenKH}</a></p>
        </li>
        
        <img src="img/lacovn.jpg" alt="">
      </div>
    </div>
    


  </header>