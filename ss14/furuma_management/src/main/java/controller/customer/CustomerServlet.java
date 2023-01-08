package controller.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import service.customer.impl.CustomerService;
import service.customer.impl.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerService();
    CustomerTypeService customerTypeService = new CustomerTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                showUpEdit(request,response);
                break;

            default:
                showCustomer(request, response);
        }
    }

    private void showUpEdit(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<CustomerType> customerTypes = customerTypeService.findAll();
            request.setAttribute("list", customerTypes);
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFind(HttpServletRequest request, HttpServletResponse response) {
      String name=  request.getParameter("name");
        List <Customer> list=customerService.findByName(name);
              request.setAttribute("list", list);
              try {
                  request.getRequestDispatcher("view/customer/find.jsp").forward(request, response);
              } catch (ServletException e) {
                  throw new RuntimeException(e);
              } catch (IOException e) {
                  throw new RuntimeException(e);

          }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<CustomerType> customerTypes = customerTypeService.findAll();
            request.setAttribute("list", customerTypes);
            request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> list = customerService.findAll();
        request.setAttribute("list", list);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "edit":
                  editCustomer(request,response);
                break;
            case "find":
                showFind(request,response);
                break;
            case "delete":
                delete(request, response);
                break;
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idCustomerType = Integer.parseInt(request.getParameter("customerTypeId"));
        CustomerType customerType = new CustomerType(idCustomerType);
        Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerType);
        boolean check = customerService.update(customer);
        String mess = "update success";
        if (!check) {
            mess = "failed";
        }
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("/view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = customerService.delete(id);
        showCustomer(request, response);

    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idCustomerType = Integer.parseInt(request.getParameter("customerTypeId"));
        CustomerType customerType = new CustomerType(idCustomerType);
        Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerType);
        boolean check = customerService.create(customer);
        String mess = "Create success";
        if (!check) {
            mess = "failed";
        }
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("/view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
