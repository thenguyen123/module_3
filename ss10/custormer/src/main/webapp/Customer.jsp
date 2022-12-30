<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 12/30/2022
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>List Customer</h1>
<table class="table">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>BirthDay</th>
        <th>Address</th>
        <th>Img</th>
    </tr>

<c:forEach var="Customer" items="${list}" varStatus="status">
<tr>
    <td>${status.count}</td>
    <td>${Customer.name}</td>
    <td>${Customer.dayOfBirth}</td>
    <td>${Customer.address}</td>
    <td><img src="${Customer.img}" alt="" width="20px" height="30px"> </td>
</tr>
</c:forEach>
</table>


</body>
</html>
