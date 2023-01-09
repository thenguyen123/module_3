<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/6/2023
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<meta charset="UTF-8">
<title>Furuma</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    a {
        text-decoration: none;
    }
</style>

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
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
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
                            <a class="nav-link " href="/facility">Facility</a>
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

    <div class="row">
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../img/124037_21032019_furama-villas-da-nang-2.jpg" class="d-block w-100" alt="...">
                </div>

                <div class="carousel-item">
                    <img src="../img/kien-truc-furama-resort-da-nang-1024x680.jpg"
                         class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <br>

    <div class="row mx-">
        <div class="col-12 col-sm-6 col-md-4 t">
            <h3 class="fw-ligh">KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI, FURAMA ĐÀ NẴNG, NỔI TIẾNG LÀ KHU NGHỈ DƯỠNG ẨM THỰC
                TẠI VIỆT NAM.</h3>
        </div>
        <div class="col-12 col-sm-6 col-md-4">
            <img src="../img/images.jpg">
        </div>
        <div class="col-12 col-sm-6 col-md-4 d-flex justify-content-center">
            <p>
                Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến với 3 di sản văn hoá
                thế giới:
                Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng. 196 phòng hạng sang cùng với 70 căn biệt thự từ hai
                đến bốn phòng ngủ có hồ bơi riêng đều được trang trí trang nhã, theo phong cách thiết kế truyền thống
                của Việt Nam
                và kiến trúc thuộc địa của Pháp, biến Furama thành khu nghỉ dưỡng danh giá nhất tại Việt Nam – vinh
                dự được đón tiếp nhiều người nổi tiếng, giới hoàng gia, chính khách, ngôi sao điện ảnh và các nhà lãnh
                đạo
                kinh doanh quốc tế.
            </p>
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
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
</body>
</html>
