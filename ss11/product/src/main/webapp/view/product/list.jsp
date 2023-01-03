<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/3/2023
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

<h1>Product</h1>
<p> <a href="/product?action=create">Create Product</a></p>
<table class="table table-row-cell">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Prices</th>
        <th>Description</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>
    <c:forEach var="product" items="${list}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.prices}</td>
            <td>${product.description}</td>
            <td><a href="/product?action=edit&id=${product.id}">Edit</a> </td>
            <td><a href="/product?action=delete&id=${product.id}">Delete</a> </td>
            <td></td>
        </tr>

    </c:forEach>
</table>
<form method="get" action="/product?action=edit">
    <form>
</body>
</html>
