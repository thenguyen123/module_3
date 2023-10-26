<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/12/2023
  Time: 8:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/css/bootstrap.css">

    <link rel="stylesheet" href="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/css/bootstrap-grid.rtl.css">
</head>
<body>
<div class="row bg-primary ">
    <p>Nguyễn Thể</p>
</div>
<div class="row headerlink">
    <nav class="navbar navbar-expand-lg bg-body-tertiary ">
        <div class="container-fluid">

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/employee">Sach</a>
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

<h3><a href="/employee?add=create">
    <button>Create</button>
</a></h3>
<table class="table table-striped table-bordered " id="tableEmployee" style="width: 100%;">
    <thead>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Tên Sách</th>
        <th>Tác Giả</th>
        <th>Số Lương</th>
        <th>Mô Tả</th>

        <th> Mượn</th>

    </tr>
    </thead>
    <tbody>
    <%--foreach--%>
    <c:forEach var="sach" items="${list}" varStatus="Stt">
        <tr>
            <td>${Stt.count}</td>
            <td>${sach.ma}</td>
            <td>${sach.tenSach}</td>
            <td>${sach.tacGia}</td>
            <td>${sach.moTa}</td>
            <td>${sach.soLuong}</td>
            <td><a href="/sach?action=muon&id=${sach.ma}">
                <button class="btn btn-outline-success">Mượn</button>
            </a></td>

        </tr>

    </c:forEach>
    </tbody>
</table>


</body>
<script src="../jquery/jquery-3.5.1.min.js"></script>
<script src="../datatables/js/jquery.dataTables.min.js"></script>
<script src="../datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="../bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
<script>

    $(document).ready(function () {
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</html>
