<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/3/2023
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<p > <a href="/product">Back home</a></p>
<p>${message}</p>
<div>
    <form method="post">
    <h4>Product</h4>
    <p>Id</p>
    <input type="number" name="id">
    <p>Name</p>
    <input type="text" name="name">
    <p>Prices</p>
    <input type="number" name="prices">
    <p>Description</p>
    <input type="text" name="description"><button type="submit" > Create</button>
    </form>
</div>
</body>
</html>
