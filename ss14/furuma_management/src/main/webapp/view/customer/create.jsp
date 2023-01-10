<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/6/2023
  Time: 10:35 PM
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
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <form class="row g-3 btn-primary" method="post">
            <h1>Create Customer</h1>
            <h3>${mess}</h3>
            <div class="col-md-12">
                <label for="id" class="form-label">ID</label>
                <input type="number" class="form-control" name="id" required id="id">
            </div>
            <div class="col-md-12">
                <label for="name" class="form-label" >Name</label>
                <input type="text" oninput="checkName(this.value)" class="form-control" id="name" name="name" >
                <span id="errorName" style="color: red"></span>
            </div>
            <div class="col-md-12">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email">

            </div>
            <div class="col-md-12">
                <label for="birthday" class="form-label">Birthday</label>
                <input type="date" class="form-control" id="birthday" name="birthday" oninput="checkday(this.value)">
                <span id="errorDay"></span>
            </div>
            <div class="col-md-12">
                <label for="idCard" class="form-label">Id Card</label>
                <input type="text" class="form-control" id="idCard" name="idCard">
            </div>
            <div class="col-md-12">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" oninput="checkPhone(this.value)" class="form-control" id="phone" name="phone">
                <span id="errorPhone" style="color: red"></span>
            </div>

            <div class="col-md-12">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="1234 Main St">
            </div>
            <div class="col-md-6">
                <input name="gender" value="1" type="radio"> Nam <br>
                <input name="gender" value="0" type="radio"> Nữ
            </div>
            <div class="col-md-6">
                <p> Customer Type
                <p>
                    <select name="customerTypeId" class="w-100 h-50">
                        <c:forEach items="${list}" var="customerType">
                            <option value="${customerType.id}">${customerType.name}</option>
                        </c:forEach>
                    </select>
            </div>
            <div class="col-md-3">
                <button disabled id="btnSave" class="btn btn-primary" type="submit" value="create">Save</button>
            </div>
        </form>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script>
function checkName(name) {
let regName = /^[A-Z][a-z]*(\s[A-Z][a-z]*)+$/;
let checkedName = regName.exec(name);
if (!checkedName) {
document.getElementById("errorName").innerText = "Tên chưa đúng định dạng"
document.getElementById("btnSave").disabled = true;
} else {
document.getElementById("btnSave").disabled = false;
document.getElementById("errorName").innerText = ""
}
}
function checkPhone(phone){
    let regPhone=/^(090\d{7}|091\d{7}|\(84\)\+91\d{7}|\(84\)\+90\d{7})$/
    if(!regPhone.exec(phone)){
        document.getElementById("errorPhone").innerText="Phone chưa đúng định dạng"
        document.getElementById("btnSave").disabled= true;
    }else {
        document.getElementById("errorPhone").innerText=""
        document.getElementById("btnSave").disabled= false;
    }
}function checkday(day){
    let regPhone=/^(0[1-9]|1\d|2\d|3{[0-1])\/(0[1-9]|1[0-2])\/(\d{4})$/
    if(!regPhone.exec(day)){
        document.getElementById("errorDay").innerText="Ngày chưa đúng định dạng"
        document.getElementById("btnSave").disabled= true;
    }else {
        document.getElementById("errorDay").innerText=""
        document.getElementById("btnSave").disabled= false;
    }
}
</script>
</html>
