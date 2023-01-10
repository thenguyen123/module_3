package controller.employee;

import model.employee.Division;
import model.employee.Education;
import model.employee.Employee;
import model.employee.Position;
import service.employee.impl.DivisionService;
import service.employee.impl.EducationService;
import service.employee.impl.EmployeeService;
import service.employee.impl.PositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService=new EmployeeService();
    EducationService educationService=new EducationService();
    DivisionService divisionService=new DivisionService();
    PositionService positionService=new PositionService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html:charset=UTF-8");
String action=request.getParameter("action");
if(action==null){
    action="";
}switch (action){
            case "create":
                break;
            default:
                showList(request,response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> list=employeeService.findAll();
        List<Education> educations=educationService.findAll();
        List<Position> positions=positionService.findAll();
        List<Division> divisions=divisionService.findAll();
        request.setAttribute("list",list);
        request.setAttribute("educations",educations);
        request.setAttribute("positions",positions);
        request.setAttribute("divisions",divisions);
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action=request.getParameter("action");
        if(action==null){
            action="";
        }switch (action){
            case "create":
                break;
            case "delete":
                deleteEmployee(request,response);
                break;
            case "search":
                searchEmployee(request,response);
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name=request.getParameter("name");
        String education=request.getParameter("education");
        List<Employee> list=employeeService.search(name,education);
        request.setAttribute("list",list);
        request.setAttribute("name",name);
        request.setAttribute("education",education);
        try {
            request.getRequestDispatcher("view/employee/search.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter ("deleteId"));
       boolean check= employeeService.deleteEmployee(id);
       String mess="success";
        if(!check){
            mess="fail";

        }showList(request,response);

    }
}
