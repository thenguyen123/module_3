<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/4/2023
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User</h1>
<p><a href="/user?action=create">Create user</a></p>
<p><a href="/user?action=sort">Sort</a></p>
<form method="get" action="/user?action=find">
<div>
  <p>Find User</p>
  <input type="text" name="country">
  <button type="submit" value="find" name="action">Find</button>
</div>
</form>
<table class="table table-row-cell">
  <tr>
    <th>Id</th>
    <th>Name</th>
    <th>Email</th>
    <th>Country</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
  <c:forEach items="${list}" var="user">
    <tr>
      <td>${user.id}</td>
      <td>${user.name}</td>
      <td>${user.email}</td>
      <td>${user.country}</td>
      <td><a href="/user?action=edit&id=${user.id}">edit</a></td>
      <td><a href="/user?action=delete&id=${user.id}">delete</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
