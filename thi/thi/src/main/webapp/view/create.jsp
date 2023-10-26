<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/12/2023
  Time: 8:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/css/bootstrap-grid.rtl.css">
</head>
<body>
<div >
    <div class="row bg-primary ">
        <p>Nguyễn Thể</p>
    </div>
    <div class="row headerlink">
        <nav class="navbar navbar-expand-lg bg-body-tertiary " >
            <div class="container-fluid">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/employee">Employee</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
<p> Mã Mượn Sách</p>
    <input name="ma" type="number" required placeholder="${sach.ma}">
<p> Tên Sách</p>
    <input name="teSach" type="text" required placeholder="${sach.tenSach}" >
<p> Tên Học sinh</p>

    <select name="position" class="w-100 h-50">
        <c:forEach items="${list}" var="hs">
            <option value="${hs.ma}">${hs.hoTen}</option>
        </c:forEach>
    </select>
<p> Ngày Mượn</p>
    <input name="ngayMuon" type="date" required >
<p> Ngày Trả</p>
    <input name="ngayTra" type="date" required >



</div>




</body>
<script src="bootstrap-5.3.0-alpha1-dist/js/bootstrap.js"></script>
</html>
