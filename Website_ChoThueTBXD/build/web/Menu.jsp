<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark " style="background: black">
    <div class="container">
        <a class="navbar-brand" href="home">HOME</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test="${sessionScope.acc.maQuyenTruyCap=='QTC01'}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Manager Account</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.maQuyenTruyCap=='QTC03'}">
                    <li class="nav-item">
                        <a class="nav-link" href="view_Admin">MANAGER</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc !=null}">
                    <li class="nav-item">
                        <a class="nav-link" href="user">Hello ${sessionScope.acc.tenKH}</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc ==null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp">Login</a>
                    </li>
                </c:if>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
               
                <a class="btn btn-success btn-sm ml-3" href="GioHang">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">3</span>
                </a>
            </form>
        </div>
    </div>
</nav>
<!--<section class="jumbotron text-center">
    <div class="container" id="phone">
        <h1 class="jumbotron-heading">QUẢN LÝ CHO THUÊ THIẾT BỊ TẠI CÔNG TY TNHH MTV HẢI MINH QUÂN</h1>
        <p class="lead text-muted mb-0">------------------------------------------------------</p>
    </div>
</section>-->

<section>
    <form action="search" method="post">
    <div class="container__content--header">
        
            <div class="content__header--btn">
                <i class="fa-solid fa-filter content__header--filter"></i>
                <p class="">Bộ lọc</p>
            </div>

            <div class="content__header--btn">
                
                <p>Giá từ</p>
                <!--<i class="fa-solid fa-chevron-down"></i>-->
                
                <select name="giaTu" class="value_option" aria-label="Default select example">
                    <option value=""> </option>
                    <option value="">0</option>

                    <option value="">2000</option>

                    <option value="">3000</option>
                    <option value="">4000</option>
                    <option value="">5000</option>

                </select>
                
                
            </div>

            <div class="content__header--btn">
                <p>Đến giá</p>
                <!--<i class="fa-solid fa-chevron-down"></i>-->
                
                <select name="denGia"  class="value_option" aria-label="Default select example">
                    <option value=""> </option>
                    <option value="">1000</option>

                    <option value="">2000</option>

                    <option value="">3000</option>
                    <option value="">4000</option>
                    <option value="">5000</option>

                </select>
                
            </div>
        
            <div class="content__header--btn">
                <p>Số lượng</p>
                <!--<i class="fa-solid fa-chevron-down"></i>-->
                
                <select name="soLuong"   class="value_option" aria-label="Default select example">
                    <option value=""> </option>
                    <option value="">10</option>

                    <option value="">20</option>

                    <option value="">30</option>
                    <option value="">40</option>
                    <option value="">50</option>

                </select>
            </div>

            <div class="content__header--search">
                <input value="${txtS}" name="txt" type="text" placeholder="Search">
                <button type="submit"  class="btn_sreach">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>

           


        </div>
    </form>
</section>
<!--end of menu-->
