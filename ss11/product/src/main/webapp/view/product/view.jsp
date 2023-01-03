<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 1/3/2023
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/product">Back home</a></p>
<div>

    <form method="post">
        <h4>Product</h4>
        <p>Id : ${product.id}</p>

        <p>Name: ${product.name}</p>

        <p>Prices: ${product.prices}</p>
        <p>Description ${product.description}</p>
        <button type="submit"> Delete</button>
    </form>
</div>

</body>
</html>
