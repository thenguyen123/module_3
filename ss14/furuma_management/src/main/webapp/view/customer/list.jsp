<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/6/2023
  Time: 10:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">

    <div class="row bg-primary ">
        <p>Weather</p>
    </div>

    <div class="row header h-20 bg-white">
        <div class="col 12 col-md-3 col-sm-6"><img src="../img/logo@2x.png" alt="" height="100"></div>
        <div class="col-md-2 col-sm-6  "><img src="../img/widget-tripadvisor-rating.png" width="50%" height="30%">
            <p>Review </p>
        </div>
        <div class="col-md-3 col-sm-6 fst-italic "><p> Address: 103 – 105 Võ Nguyên Giáp Street, Khuê Mỹ wards, Ngũ hành
            Sơn
            District,
            Đà Nẵng city, Việt Nam
            7.0 km from International Airport Đà Nẵng</p></div>
        <div class="col-md-3 col-sm-5">
            <p>
                Phone: 84-236-3847 333/888 reservation@furamavietnam.com</p>
        </div>
        <div class="col-md-1 col-sm-1 ">
            <p>Nguyen The </p>

        </div>

    </div>
</div>
<div class="row headerlink ">
    <nav class="navbar navbar-expand-lg bg-body-tertiary ">
        <div class="container-fluid ">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-0 mb-lg-2">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/customer">Customer</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link disabled" href="facility.html">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Contract</a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="/facility">Facility</a>
                    </li>

                </ul>
                <form class="d-flex" role="search" method="post" action="/customer?action=find">
                    <input  class="form-control me-2" type="text" placeholder="Search" aria-label="Search" name="name">
                    <button class="btn btn-outline-success" type="submit" value="find">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<h1>Customer List</h1>
<h3><a href="/customer?action=create" style="text-decoration: none"><button class="btn btn-outline-success">Create Customer</button></a> </h3>
<table class="table table-row-cell">
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Gender</th>
        <th> IdCard</th>
        <th>Customer Type</th>
        <th>Edit</th>
        <th>Delete</th>

    </tr>
    <c:forEach varStatus="stt" var="customer" items="${list}">
        <tr>
            <td>${stt.count}</td>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.birthday}</td>
            <td>${customer.phone}</td>
            <td>${customer.email}</td>

            <td>${customer.address}</td>
            <c:if test="${customer.gender ==1}">
            <td>Nam</td>
            </c:if>
            <c:if test="${customer.gender ==0}">
            <td>Nữ</td>
            </c:if>
            <td>${customer.idCard}</td>
            <td>${customer.customerType.name}</td>

            <td>
               <a href="/customer?action=edit&id=${customer.id}"> <button class="btn btn-outline-success" >Edit</button></a> </td>

            <td>
                <button class="btn btn-outline-success"  onclick="infoDelete('${customer.id}','${customer.name}')" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- Modal delete-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="deleteId">
                    <span>Bạn có muốn xoá khách hàng  </span>
                    <span  style="color: red" id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-sm btn-primary">Delete</button>
                </div>
            </form>

        </div>
    </div>
</div>
<div class="row footer bg-success">
    <div class="col-12 col-md-1 col-sm-1"></div>
    <div class="col 12 col-sm-5 col-md-3 text-bg-light p-3 ">
        <h2 class="d-flex align-self-center fw-light text-warning pt-2">Hướng Dẫn Di Chuyển</h2>
        <p>Khu nghỉ dưỡng Furama là cơ sở hàng đầu để khám phá một trong những điểm đến hấp dẫn nhất Châu Á.
            Chỉ cách Đà Nẵng một quãng lái xe ngắn là bốn Di sản Văn hóa Thế giới được UNESCO công nhận</p>
        <h3 class="text-decoration-none fw-light"><a
                href="https://www.google.com/maps/place/Furama+Resort+Danang/@16.0399456,108.2510681,17z/data=!3m1!4b1!4m8!3m7!1s0x31420fdbc8cc38ef:0x9a6a3e31121225d2!5m2!4m1!1i2!8m2!3d16.0399456!4d108.2510681?hl=vi-VNl">Xem
            trên bản đồ</a></h3>
        <h4>Địa Điểm</h4>
        <table class="table tab-content">
            <tr>
                <td>1.Cố đô Huế</td>
                <td>2 tiếng</td>
            </tr>
            <tr>
                <td>2.Phố cổ Hội An</td>
                <td>30 phút</td>
            </tr>
            <tr>
                <td>3.
                    Thánh địa Mỹ Sơn
                </td>
                <td>90 phút</td>
            </tr>
            <tr>
                <td>4.
                    Động Phong Nha
                </td>
                <td>3 tiếng</td>
            </tr>

        </table>

    </div>
    <div class="col-12 col-md-6 col-sm-8 row">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-12 text-white p-3">
                <p>Giá công bố</p>
                <p>Tuyển dụng</p>
            </div>
            <div class="col-sm-12 col-md-6 col-12 text-white p-3 ">
                <p>Liên hệ</p>
                <p class="fs-9 fst-italic">
                    103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam
                    Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666
                    Email: reservation@furamavietnam.com * www.furamavietnam.com GDS Codes: Amadeus-GD DADFUR,
                    Galileo/Apollo-GD 16236, Sabre-GD 032771, Worldspan- GD DADFU
                </p>
            </div>

        </div>
        <div class="col-12 col-md-6 col-sm-12 row text-white p-3  ">
            <p> © 2018 Furama Resort Danang</p>
        </div>
    </div>
</div>
</body>
<script>
    function infoDelete(id,name) {
        document.getElementById("deleteId").value=id;
        document.getElementById("deleteName").innerText=name;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</html>
