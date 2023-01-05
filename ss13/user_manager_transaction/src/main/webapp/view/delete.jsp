<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/4/2023
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>User</h2>
<p><a href="/user" style="text-decoration: none">Back to home</a></p>
<form method="post">
    <p>Id</p>
    <input name="id" type="number" placeholder="${user.id}">
    <p>Name</p>
    <input name="name" type="text" placeholder="${user.name}">
    <p>Email</p>
    <input name="email" type="text" placeholder="${user.email}">
    <p>Country</p>
    <input name="country" type="text"  placeholder="${user.country}">
    <button type="submit">Delete</button>
</form>
</body>
</html>
