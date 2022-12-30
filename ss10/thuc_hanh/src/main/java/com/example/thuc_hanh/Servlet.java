package com.example.thuc_hanh;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "Servlet", value = "/Servlet")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String search=request.getParameter("search");
 Map<String,String> dic=new HashMap<>();
        dic.put("hello","Xin chào");
        dic.put("how","thế nào");

        String result=dic.get(search);
        if (result != null) {
            PrintWriter printWriter = response.getWriter();
            printWriter.println("<html>");
            printWriter.println("lo");
            printWriter.println("</html>");
        }

    }
}
