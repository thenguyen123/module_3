package com.example.custormer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private static List<Customer>list=new ArrayList<>();
    static {
        list.add(new Customer( "Nguyen Van A","22/12/2001","Đà Nẵng","img/anh1.jpg"));
        list.add(new Customer( "Nguyen Van A","22/12/2001","Đà Nẵng","/img/anh1.jpg"));
        list.add(new Customer( "Nguyen Van C","2/2/2001","Sài Gòn","/img/anh1.jpg"));
        list.add(new Customer( "Nguyen Van D","24/14/2001","Huế","/img/anh1.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setAttribute("list",list);
request.getRequestDispatcher("Customer.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
