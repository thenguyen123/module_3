package service.employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();
    boolean save(Employee employee);
    boolean deleteEmployee(int id);
    boolean updateEmployee(Employee employee);
    List<Employee> search(String name, String nameEducation);
}
