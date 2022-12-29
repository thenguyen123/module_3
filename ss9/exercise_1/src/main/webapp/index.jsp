<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<div>
    <h1>Product</h1>
    <form action="/display" method="post">
        <div>
            <p>Product Description</p>
            <input name="Product" type="text" placeholder="Product Description">
        </div>
        <div>
            <p>List Price</p>
            <input name="Price" type="number" placeholder="List Price">
        </div>
        <div>
            <p>Discount Percent</p>
            <input name="Discount" type="number" placeholder="Discount Percent">
        </div>
        <div>
            <button type="submit">Calculate Discount</button>
        </div>
    </form>
</div>
</body>
</html>