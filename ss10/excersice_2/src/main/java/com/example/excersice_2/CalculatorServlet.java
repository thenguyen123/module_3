package com.example.excersice_2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Calculator", value = "/calculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        double first_operand = Double.parseDouble(request.getParameter("first_operand"));
        double second_operand = Double.parseDouble(request.getParameter("second_operand"));
        char operator = request.getParameter("option").charAt(0);
        PrintWriter printWriter = response.getWriter();
        printWriter.println("<html>");
        try {

            double result = calculator(first_operand, operator, second_operand);
            printWriter.println(first_operand + " " + operator + " " + second_operand + " = " + result);

        } catch (Exception e) {
            printWriter.println(" " + e.getMessage());
        }
        printWriter.println("</html>");
    }

    public static double calculator(double first_operand, char operator, double second_operand) {
        switch (operator) {
            case '+':
                return first_operand + second_operand;
            case '-':
                return first_operand - second_operand;
            case '*':
                return first_operand * second_operand;
            case '/':
                if (second_operand != 0) {
                    return first_operand / second_operand;
                } else {
                    throw new RuntimeException("Not divisible by 0");
                }
            default:
                throw new RuntimeException("error");
        }
    }

}
