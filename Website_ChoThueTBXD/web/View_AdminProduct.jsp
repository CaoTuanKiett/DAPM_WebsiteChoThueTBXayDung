

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
  <link href="css/viewAdminProduct.css" rel="stylesheet" type="text/css"/>
  <!-- font chữ -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
  
  <title>Admin Product</title>
  
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
                <p>Thêm thiết bị</p>
            </div>


        </div>

        <div class="container__content--body">
            <div class="content__body--header">
                <div class="content__body--header--item header__item--iconCheck">
                    <input type="checkbox" name="" id="">
                </div>
                <div class="content__body--header--item">
                    <p>Mã TB</p>
                </div>
                <div class="content__body--header--item">
                    <p>Hình Ảnh</p>
                </div>
                <div class="content__body--header--item header__item--name">
                    <p>Tên Thiết Bị</p>
                </div>
                <div class="content__body--header--item header__item--price">
                    <p>Giá Bán</p>
                </div>
                <div class="content__body--header--item header__item--quantity">
                    <p>Số Lượng</p>
                </div>
<!--                <div class="content__body--header--item header__item--manu">
                    <p>Nhà Sản Xuất</p>
                </div>-->
                <div class="content__body--header--item header__item--decr">
                    <p>Mô Tả</p>
                </div>
                <div class="content__body--header--item header__item--option">
                    <p>Tùy Chọn</p>
                </div>
            </div>

            <div class="content__body--list">
                
                
                <c:forEach items="${ListP}" var="o">
                    <div class="content__body--item">
                        <input class="body__item--check" type="checkbox" name="" id="">
                        <p class="body__item--stt">${o.maThietBi}</p>
                        <img class="body__item--img" src="${o.hinhAnhString}" alt="">
                        <h3 class="body__item--title" >${o.tenThietBi}</h3>
                        <p class="body__item--price">${o.donGiaThue}  VND</p>
                        <p class="body__item--quantity">${o.soluongHienCon}</p>
                        <p class="body__item--decr">${o.dacDiem}</p>
                        
                        <div class="body__item--option">
                            <a href="loadProduct?pid=${o.maThietBi}" ><i  class="icon__option--pen fa-solid fa-pen"></i></a>
                            <a href="delete?pid=${o.maThietBi}"><i  class="icon__option--trash fa-solid fa-trash"></i></a>
                        </div>
                    </div>      
                </c:forEach>


            </div>
        </div>
      
    </div>

  </div>




  <jsp:include page="Admin/Footer_Admin.jsp"></jsp:include>
    
<!--    add-->
    
    <form  action="add" method="post">
        
    <div class="add_new">

    <div class="add_overlay"></div>

    <div class="add_container">
        <div class="add_header">
            <h2>Thêm Thiết Bị Mới</h2>
            <!-- <i class="fa-solid fa-xmark"></i> -->
        </div>

        <div class="add__body">
            
            <div class="input_item">
                <label for="">Mã TB</label>
                <input class="inputAdd" type="text" name="maThietBi" id="MaTB" placeholder="Nhập mã thiết bị ...">
                <span class="value__null" ></span>
            </div>
            
            <div class="input_item">
                <label for="">Tên Thiết Bị</label>
                <input class="inputAdd" type="text" name="tenThietBi" id="TenTB" placeholder="Nhập tên thiết bị ...">
                <span class="value__null" ></span>
            </div>

            <div class="input_item">
                <label for="">Hình Ảnh</label>
                <input class="inputAdd" type="text" name="hinhAnhString" id="HinhAnh" placeholder="Nhập link hình ảnh ...">
                <span class="value__null" ></span>
            </div>

            <div class="input_item">
                <label for="">Giá Thiết Bị</label>
                <input class="inputAdd" type="text" name="donGiaThue" id="GiaTB" placeholder="Nhập giá thiết bị ...">
                <span class="value__null" ></span>
            </div>

            <div class="input_item">
                <label for="">Số Lượng</label>
                <input class="inputAdd" type="text" name="soluongHienCon" id="SoLuong" placeholder="Nhập số lượng ...">
                <span class="value__null" ></span>
            </div>

            <div class="input_item">
                <label for="">Mô Tả</label>
                <textarea class="inputAdd" name="dacDiem" id="MoTa" cols="30" rows="10" placeholder="Nhập mô tả ..."></textarea>
                <span class="value__null" ></span>
            </div>

            

        </div>

        <div class="add_footer">
            <button type="submit" class="btn btn--add">Thêm</button>
            <button type="text"  class="btn btn--cancel">Hủy</button>
        </div>

    </div>

    



 </div>
        
    </form>
    
    
<!--   edit -->

<!--<form action="edit" method="post">
    <div class="edit">

    <div class="edit_overlay"></div>

    <div class="edit_container">
        <div class="edit_header">
            <h2>Cập Nhật Thiết Bị</h2>
             <i class="fa-solid fa-xmark"></i> 
        </div>

        <div class="edit__body">
            
            <div class="input_item">
                <label for="">Mã Thiết Bị</label>
                <input type="text" value="${detail.maThietBi}" name="maThietBi" id="MaTB" placeholder="Nhập hãng sản xuất ...">
            </div>
            
            <div class="input_item">
                <label for="">Tên Thiết Bị</label>
                <input type="text" value="${detail.tenThietBi}" name="tenThietBi" id="TenTB" placeholder="Nhập tên thiết bị ...">
            </div>

            <div class="input_item">
                <label for="">Hình Ảnh</label>
                <input type="text" value="${detail.hinhAnhString}" name="hinhAnhString" id="HinhAnh" placeholder="Nhập link hình ảnh ...">
            </div>

            <div class="input_item">
                <label for="">Giá Thiết Bị</label>
                <input type="text" value="${detail.donGiaThue}" name="donGiaThue" id="GiaTB" placeholder="Nhập giá thiết bị ...">
            </div>

            <div class="input_item">
                <label for="">Số Lượng</label>
                <input type="text" value="${detail.soluongHienCon}" name="soluongHienCon" id="SoLuong" placeholder="Nhập số lượng ...">
            </div>

            <div class="input_item">
                <label for="">Mô Tả</label>
                <textarea name="dacDiem" id="MoTa" cols="30" rows="10" placeholder="Nhập mô tả ...">${detail.dacDiem}</textarea>
            </div>

            

        </div>

        <div class="edit_footer">
            <button class="btn btn--edit">Cập Nhật</button>
            <button type="submit" class="btn edit_btn--cancel">Hủy</button>
        </div>

    </div>

    



  </div>
</form>-->
    
      
    

            
    <script src="js/script.js" type="text/javascript"></script>
</body>
</html>