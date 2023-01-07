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
</head>
<body>
<h1>Create Customer</h1>
<h3>${mess}</h3>
<form method="post">
<p>ID</p>
<input type="number" name="id" required>
<p>Name</p>
<input name="=name" type="text" required>
<p>Birthday</p>
<input name="birthday" type="text" required>
<input name="gender" value="1" type="radio">Nam
<input name="gender" value="0" type="radio">Nữ
<p>ID card</p>
<input name="idCard" type="text" required>
<p>Phone</p>
<input type="text" name="phone" required>
<p>Address</p>
<input type="text" name="address" required>
<p> Customer Type</p>
<select name="customerTypeId">
<c:forEach items="${list}" var="customerType" >
    <option value="${customerType.id}">${customerType.name}</option>
</c:forEach>
</select>
<button type="submit" value="create">Save</button>

</form>
</body>
</html>
