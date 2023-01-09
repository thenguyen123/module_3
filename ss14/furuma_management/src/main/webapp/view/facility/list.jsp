<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/8/2023
  Time: 7:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
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
                        <a class="nav-link active" aria-current="page" href="/home.jsp">Home</a>
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
                <form class="d-flex" role="search" action="/facility?action=find" method="post">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="name">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<h1>Facility List</h1>

    <button class="btn btn-outline-success" type="button" data-bs-toggle="modal" data-bs-target="#create">Create Villa</button>


    <button class="btn btn-outline-success" type="button" data-bs-toggle="modal" data-bs-target="#createHouse">Create House </button>


    <button class="btn btn-outline-success" type="button" data-bs-toggle="modal" data-bs-target="#createRoom">Create Room</button>


<p>${mess}</p>

<table class="table table-striped table-bordered " id="tableFacility" style="width: 100%;">
    <thead>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>Max People</th>
        <th>Standard Room</th>
        <th>Description Other Convenience</th>
        <th>Pool Area</th>
        <th>Number Of Floors</th>
        <th>Facility Free</th>
        <th>Rent Type</th>
        <th> Facility Type</th>
        <th> Edit</th>
        <th> Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="facility" items="${list}" varStatus="Stt">
        <tr>
            <td>${Stt.count}</td>
            <td>${facility.id}</td>
            <td>${facility.name}</td>
            <td>${facility.area}</td>
            <td>${facility.cost}</td>
            <td>${facility.maxPeople}</td>
            <td>${facility.standardRoom}</td>
            <td>${facility.descriptionOtherConvenience}</td>
            <td>${facility.poolArea}</td>
            <td>${facility.numberOfFloors}</td>
            <c:if test="${facility.facilityFree==null}">
                <td>Chưa dùng dịch vụ</td>
            </c:if>
            <c:if test="${facility.facilityFree!=null}">
                <td>${facility.facilityFree}</td>
            </c:if>

            <td>${facility.rentType.name}</td>
            <td>${facility.facilityType.name}</td>
            <td><a href="/facility?action=edit&id=${facility.id}">
                <button class="btn btn-outline-success">Edit</button>
            </a></td>

            <td>
                <button class="btn btn-outline-success" onclick="infoDelete('${facility.id}','${facility.name}')"
                        type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete
                </button>
            </td>

        </tr>

    </c:forEach>
    </tbody>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/facility?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="deleteId">
                    <span>Bạn có muốn xoá   </span>
                    <span style="color: red" id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-sm btn-primary">Delete</button>
                </div>
            </form>

        </div>
    </div>
</div>

<div class="modal fade" id="create" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="create">Create Facility Villa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>${mess}</p>
                <form method="post" action="/facility?action=create" >
                    <p>Name</p>
                    <input name="name" type="text">
                    <p>Area</p>
                    <input name="area" type="number">
                    <p>Cost</p>
                    <input name="cost" type="number">
                    <p>Max People</p>
                    <input name="people" type="number">
                    <p>Standard Room</p>
                    <input name="standard" type="text">
                    <p>Description Other Convenience</p>
                    <input name="description" type="text">
                    <p>Pool Area</p>
                    <input name="pool" type="number" value="0">
                    <p>Number Of Floors</p>
                    <input name="floors" type="number" value="0">

                    <input name="facilityFree" type="text" value=" ">
                    <p>Rent Type</p>
                    <select name="rent">
                        <c:forEach var="rentlist" items="${rentTypeList}">
                            <option value="${rentlist.id}">${rentlist.name}</option>
                        </c:forEach>
                    </select>
                    <p> Facility Type</p>
                    <select name="facilityType">
                        <c:forEach var="list" items="${listFacility}">
                            <option value="${list.id}">${list.name}</option>
                        </c:forEach>
                    </select>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-outline-success">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="createRoom" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createRoom">Create Facility Villa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>${mess}</p>
                <form method="post" action="/facility?action=create">
                    <p>Name</p>
                    <input name="name" type="text">
                    <p>Area</p>
                    <input name="area" type="number">
                    <p>Cost</p>
                    <input name="cost" type="number">
                    <p>Max People</p>
                    <input name="people" type="number">
                    <input name="standard" type="text" value=" " hidden>
                    <input name="description" type="text" value="null" hidden>
                    <input name="pool" type="number" value="0" hidden>
                    <input name="floors" type="number" value="0" hidden>
                    <input name="facilityFree" type="text" value=" " hidden>
                    <p>Rent Type</p>
                    <select name="rent">
                        <c:forEach var="rentlist" items="${rentTypeList}">
                            <option value="${rentlist.id}">${rentlist.name}</option>
                        </c:forEach>
                    </select>
                    <p> Facility Type</p>
                    <select name="facilityType">
                        <c:forEach var="list" items="${listFacility}">
                            <option value="${list.id}">${list.name}</option>
                        </c:forEach>
                    </select>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-outline-success">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="createHouse" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createHouse">Create Facility Villa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>${mess}</p>
                <form method="post"  action="/facility?action=create">
                    <p>Name</p>
                    <input name="name" type="text">
                    <p>Area</p>
                    <input name="area" type="number">
                    <p>Cost</p>
                    <input name="cost" type="number">
                    <p>Max People</p>
                    <input name="people" type="number">
                    <p>Standard Room</p>
                    <input name="standard" type="text">
                    <p>Description Other Convenience</p>
                    <input name="description" type="text">

                    <input name="pool" type="number" value="0" hidden>
                    <p>Number Of Floors</p>
                    <input name="floors" type="number" value="0">

                    <input name="facilityFree" type="text" value=" " hidden>
                    <p>Rent Type</p>
                    <select name="rent">
                        <c:forEach var="rentlist" items="${rentTypeList}">
                            <option value="${rentlist.id}">${rentlist.name}</option>
                        </c:forEach>
                    </select>
                    <p> Facility Type</p>
                    <select name="facilityType">
                        <c:forEach var="list" items="${listFacility}">
                            <option value="${list.id}">${list.name}</option>
                        </c:forEach>
                    </select>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-outline-success">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

    <script src="../../jquery/jquery-3.5.1.min.js"></script>
    <script src="../../datatables/js/jquery.dataTables.min.js"></script>
    <script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
    <script>
        function infoDelete(id, name) {
            document.getElementById("deleteId").value = id;
            document.getElementById("deleteName").innerText = name;
        }
    </script>
    <script>

        $(document).ready(function () {
            $('#tableFacility').dataTable({
                "dom": 'lrtip',
                "lengthChange": false,
                "pageLength": 5
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
</body>
</html>
