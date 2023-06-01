

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container__sidebar">

      <div class="container__sidebar--logo">
        <img src="img/logo.png" alt="logo">
      </div>

      <div class="container__sidebar--menu">

        <div class="container__sidebar--avt">
          <img src="img/dog.jpg" alt="avt">
          <div class="avt_text">
            <p>${sessionScope.acc.tenKH}</p>
            <span>${sessionScope.acc.maQuyenTruyCap}</span>
          </div>
        </div>

        <ul class="menu">

          <div class="menu_list">
            <li class="menu_item">
                <a class="navbar-brand" href="home">
                    <i class="fa-solid fa-home"></i>
                    <p>TRANG CHỦ</p>
                </a>
            </li>
            <li class="menu_item">
                <a class="navbar-brand" href="view_Admin">
                    <i class="fa-solid fa-user"></i>
                    <p>THÔNG TIN CÁ NHÂN</p>
                </a>
            </li>
            <li class="menu_item">
              <i class="fa-solid fa-clipboard-list"></i>
              <p><a class="navbar-brand" href="Bill">QUẢN LÝ ĐƠN THUÊ</a></p>
            </li>
            <c:if test="${sessionScope.acc.maQuyenTruyCap=='QTC02' || sessionScope.acc.maQuyenTruyCap=='QTC03'}">
                <li class="menu_item">
                    <a class="navbar-brand" href="view_AdminProduct">
                        <i class="fa-solid fa-shopping-cart"></i>
                        <p>QUẢN LÝ THIẾT BỊ</p>
                    </a>
                </li>
                
                <li class="menu_item">
                    <i class="fa-solid fa-users"></i>
                    <p>QUẢN LÝ NHÂN VIÊN</p>
                  </li>
                  <li class="menu_item">
                      <a class="navbar-brand" href="view_AdminReceipt">
                          <i class="fa-solid fa-box"></i>
                          <p>QUẢN LÝ KHO</p>
                    </a>
                  </li>
                  <li class="menu_item">
                      
                      <a class="navbar-brand" href="thongke">
                            <i class="fa-solid fa-chart-line"></i>
                            <p>THỐNG KÊ</p>
                    </a>                 
                    
                    
                  </li>
            </c:if>
            
            
          </div>

          <div class="menu_list">
            <li class="menu_item">
              <i class="fa-solid fa-cog"></i>
              <p>CÀI ĐẶT</p>
            </li>
            <li class="menu_item">
              <i class="fa-solid fa-sign-out"></i>
              <p><a class="nav-link" href="logout">ĐĂNG XUẤT</a></p>
            </li>
          </div>
        </ul>

      </div>

    </div>