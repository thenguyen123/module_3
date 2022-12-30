<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Calculator</h1>
<div>
    <p>Calculator</p>
    <form action="/calculatorServlet" method="post">
        <div>
            <p>First operand</p>
            <input name="first_operand" type="number">
        </div>
        <div>
            <p>Operator</p>
            <select name="option">
                <option value="+">Addition</option>
                <option value="-">Subtraction</option>
                <option value="*">Multiplication</option>
                <option value="/">Division</option>
            </select>
        </div>
        <div>
            <p>Second operand</p>
            <input name="second_operand" type="number">
        </div>

        <button type="submit">Calculate</button>
    </form>

</div>

</body>
</html>