package com.example.demo1;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/display")
public class exercise_1 extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String product = request.getParameter("Product");
            int price = Integer.parseInt(request.getParameter("Price"));
            int discount = Integer.parseInt(request.getParameter("Discount"));
            double discountAmount = price * discount * 0.01;
            double discountPrice = price - discountAmount;
            PrintWriter printWriter=response.getWriter();
            printWriter.println("<html>");
            printWriter.println("Product " + product);
            printWriter.println("Price " + price);
            printWriter.println("Discount " + discount);
            printWriter.println("discount Amount " + discountAmount);
            printWriter.println("discount Price " + discountPrice);
            printWriter.println("</html>");
    }

    public void destroy() {
    }
}