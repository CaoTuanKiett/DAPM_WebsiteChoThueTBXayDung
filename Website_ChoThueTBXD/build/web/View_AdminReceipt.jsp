

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

  <link href="css/viewAdminReceipt.css" rel="stylesheet" type="text/css"/>
  <!-- font chữ -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
  
  <title>Admin Receipt</title>
  
</head>
<body onload="Loading()" >

    <jsp:include page="Admin/Header_Admin.jsp"></jsp:include>
    
    
  <div class="container">
    
    <jsp:include page="Admin/SideBar_Admin.jsp"></jsp:include>

    <div class="container__content">
      
        <div class="container__content--header">

            <div class="content__header--btn">
                <i class="fa-solid fa-filter content__header--filter"></i>
                <p class="">Bộ lọc</p>
            </div>

            <div class="content__header--btn">
                <p>Loại thiết bị</p>
                <i class="fa-solid fa-chevron-down"></i>
            </div>

            <div class="content__header--btn">
                <p>Giá</p>
                <i class="fa-solid fa-chevron-down"></i>
            </div>

            <div class="content__header--search">
                <input type="text" placeholder="Search">
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>

            <div class="content__header--btn content__header--btnADD">
                <i class="fa-solid fa-plus content__header--add"></i>
                <p>Thêm Phiếu Nhập</p>
            </div>


        </div>

        <div class="container__content--body">
            <div class="content__body--header">
                <div class="content__body--header--item header__item--iconCheck">
                    <input type="checkbox" name="" id="">
                </div>
                <div class="content__body--header--item header__item--Name">
                    <p>Mã Phiếu Nhập</p>
                </div>
                <div class="content__body--header--item header__item--ID">
                    <p>Mã Thiết Bị</p>
                </div>
                <div class="content__body--header--item header__item--quantity">
                    <p>Số Lượng</p>
                </div>
                <div class="content__body--header--item header__item--price">
                    <p>Giá Nhập</p>
                </div>
                <div class="content__body--header--item header__item--date">
                    <p>Ngày Nhập</p>
                </div>
<!--                <div class="content__body--header--item header__item--manu">
                    <p>Nhà Sản Xuất</p>
                </div>-->
                <div class="content__body--header--item header__item--decr">
                    <p>Nhà Cung Cấp </p>
                </div>
                <div class="content__body--header--item header__item--option">
                    <p>Tùy Chọn</p>
                </div>
            </div>

            <div class="content__body--list">
                
                
                <c:forEach items="${listCTPN}" var="o">
                    <div class="content__body--item">
                        <input class="body__item--check" type="checkbox" name="" id="">
                        <p class="body__item--stt">${o.maPN}</p>
                        <p class="body__item--img">${o.maThietBi}</p>
                        <p class="body__item--title" >${o.soLuongNhap}</p>
                        <p class="body__item--price">${o.giaNhap}  VND</p>
                        <p class="body__item--quantity">${o.ngayNhapHang}</p>
                        
                        <p class="body__item--decr">${o.tenNCC}</p>
                        <div class="body__item--option">
                            <a href="loadReceipt?pid=${o.maPN}" ><i class="icon__option--pen fa-solid fa-pen"></i></a>
                            <a href="deleteReceipt?pid=${o.maPN}"><i class="icon__option--trash fa-solid fa-trash"></i></a>
                        </div>
                    </div>      
                </c:forEach>


            </div>
        </div>
      
    </div>

  </div>




  <footer class="footer">
    <div class="footer__container">
        <div class="grid__row">
            <div class="grid__column-2-4">
                <h3 class="footer__heading">CHĂM SÓC KHÁCH HÀNG</h3>
                <ul class="foooter-list">
                    <li class="footer-item">
                        <a href="#" class="footer-item__link">Trung Tâm Trợ Giúp</a>
                    </li>
                    <li class="footer-item">
                        <a href="#" class="footer-item__link">Shop Mall</a>
                    </li>
                    <li class="footer-item">
                        <a href="#" class="footer-item__link">Hướng dẫn mua hàng</a>
                    </li>
                </ul>
            </div>

            <div class="grid__column-2-4">
                <h3 class="footer__heading">GIỚI THIỆU</h3>
                <ul class="foooter-list">
                    <li class="footer-item">
                        <a href="#" class="footer-item__link"> Giới thiệu</a>
                    </li>
                    <li class="footer-item">
                        <a href="#" class="footer-item__link">Tuyển dụng</a>
                    </li>
                    <li class="footer-item">
                        <a href="#" class="footer-item__link">Điều khoản</a>
                    </li>
                </ul>
            </div>

            <div class="grid__column-2-4">
                <h3 class="footer__heading">DANH MỤC</h3>
                <ul class="foooter-list">
                    <li class="footer-item">
                        <a href="#" class="footer-item__link">Trang điểm mặt</a>
                    </li>
                    <li class="footer-item">
                        <a href="#" class="footer-item__link">Trang điểm môi</a>
                    </li>
                    <li class="footer-item">
                        <a href="#" class="footer-item__link">Trang điểm mắt</a>
                    </li>
                </ul>
            </div>

            <div class="grid__column-2-4">
                <h3 class="footer__heading">THEO DÕI</h3>
                <ul class="foooter-list">
                    <li class="footer-item">
                        <a href="" class="footer-item__link">
                            <i class="footer-item__icon fab fa-facebook"></i>
                            Facebook
                        </a>
                    </li>
                    <li class="footer-item">
                        <a href="" class="footer-item__link">
                            <i class="footer-item__icon fab fa-instagram"></i>
                            Instagram
                        </a>
                    </li>
                    <li class="footer-item">
                        <a href="" class="footer-item__link">
                            <i class="footer-item__icon fab fa-linkedin"></i>
                            Linkedin
                        </a>
                    </li>
                </ul>
            </div>

            <div class="grid__column-2-4">
                <h3 class="footer__heading">Vào cửa hàng trên ứng dụng</h3>
                    <div class="footer__download">
                        <img src="img/qr_code.png" alt="Download QR" class="footer__download-qr">
                        <div class="footer__download-apps">
                            <a href="" class="footer__download-app-link">
                                <img src="img/gg_play.png" alt="Google play" class="footer__download-app-img">
                            </a>
                            <a href="" class="footer__download-app-link">
                                <img src="img/app_store.png" alt="App store" class="footer__download-app-img">
                            </a>
                        </div>
                    </div>
            </div>
        </div>
    </div>

    <div class="footer__bottom">
        <div class="grid wide">
            <p class="footer__text">© 2023 - Đồ Án Phần Mềm Nhóm 16 </p>
        </div>
    </div>
</footer>
    
    
    
<!--    add-->
    
    <form  action="addReceipt" method="post">
        
    <div class="add_new">

    <div class="add_overlay"></div>

    <div class="add_container">
        <div class="add_header">
            <h2>Thêm Phiếu Nhập Mới</h2>
            <!-- <i class="fa-solid fa-xmark"></i> -->
        </div>

        <div class="add__body">
            
            <div class="input_item">
                <label for="">Mã Phiếu Nhập</label>
                <input type="text" name="maPhieuNhap" id="MaTB" placeholder="Nhập mã phiếu nhập ...">
            </div>
            
            <div class="input_item">
                <label for="">Mã Thiết Bị</label>
                <input type="text" name="maThietBi" id="TenTB" placeholder="Nhập mã thiết bị ...">
            </div>

            <div class="input_item">
                <label for="">Số Lượng</label>
                <input type="text" name="soLuong" id="HinhAnh" placeholder="Nhập số lượng ...">
            </div>

            <div class="input_item" >
                <label for="">Giá Nhập</label>
                <input type="text" name="giaNhap" id="GiaTB" placeholder="Nhập giá thiết bị ...">
            </div>

<!--            <div class="input_item" >
                <label for="">Ngày Nhập</label>
                <input type="text" name="ngayNhap" id="SoLuong" placeholder="Nhập số lượng ..." readonly>
            </div>-->
             <div class="form-group input_item">
                <label>Ngày Nhập</label>
                <input value="" name="ngayNhap" id="SoLuong" type="date" class="form-control" required>
            </div>

            <div class="input_item">
                <label for="">Nhà Cung Cấp</label>
                <!--<input name="nhaCungCap" id="nhaCungCap"  placeholder="Nhập nhà cung cấp ..."></input>-->
                <select name="nhaCungCap" id="nhaCungCap"  class="form-select" aria-label="Default select example">
                <c:forEach items="${ListNCC}" var="o">
                    <option value="${o.maNCC}">${o.tennCC}</option>
                </c:forEach>
            </select>
            </div>

            

        </div>

        <div class="add_footer">
            <button type="submit" class="btn btn--add">Thêm</button>
            <button type="text" class="btn btn--cancel">Hủy</button>
        </div>

    </div>

    


</div>
        
    </form>



    
    
    
    

    <script>
        
//        function date(){
//            
//
////            const newDays = document.querySelectorAll('.date')
//
//            let today = new Date();
//            const options = {
//            year: "numeric",
//            day: "numeric",
//            month: "long",
//            // hour: "numeric",
//            // minute: "numeric",
//            };
//            let dateToday = today.toLocaleDateString("en-US", options);
//
//            return dateToday;
//
//          }
        // Lấy ngày giờ hiện tại
//        var currentDate = new Date();
//
//        // Định dạng ngày tháng
//        var year = currentDate.getFullYear();
//        var month = String(currentDate.getMonth() + 1).padStart(2, '0');
//        var day = String(currentDate.getDate()).padStart(2, '0');
//        var formattedDate = year + '-' + month + '-' + day;

        // Gán giá trị cho trường input
        
        long millis=System.currentTimeMillis();   
        java.util.Date date =new java.util.Date(millis);
        
        document.getElementById("ngayNhap").value = date;
    </script>
    
    <script src="js/script.js" type="text/javascript"></script>
</body>
</html>