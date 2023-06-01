

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <!<!-- test category -->
        <!<!-- endt -->
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${ListCC}" var="o">
                <li class="list-group-item text-white ${tag == o.maLoai ? "active":""}"><a href="category?cid=${o.maLoai}">${o.tenLoai}</a></li>
                </c:forEach>

        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Last product</div>
        <div class="card-body">
            <img class="img-fluid" src="${last.hinhAnhString}" />
            <h5 class="card-title">${last.tenThietBi}</h5>
            <p class="card-text">${last.dacDiem}</p>
            <p class="bloc_left_price">${last.donGiaThue} tr</p>
        </div>
    </div>
</div>