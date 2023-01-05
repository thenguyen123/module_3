<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/5/2023
  Time: 10:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<h2>User</h2>
<p><a href="/user" style="text-decoration: none">Back to home</a></p>
<form method="post">
  <p>Name</p>
  <input name="name" type="text">
  <p>Email</p>
  <input name="email" type="text" >
  <p>Country</p>
  <input name="country" type="text">
  <button type="submit">Create</button>
</form>
</body>
</html>
