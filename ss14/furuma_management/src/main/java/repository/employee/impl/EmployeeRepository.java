package repository.employee.impl;

import model.employee.Division;
import model.employee.Education;
import model.employee.Employee;
import model.employee.Position;
import repository.DataBase;
import repository.employee.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private  final String DELETE="delete from employee where employee_id=?";
    private final String SELECT = "select e.*,p.name_position,ed.name_education_degree,d.name_division from employee e join position p " +
            "on p.position_id=e.position_id join education_degree ed on ed.education_degree_id=e.education_degree_id join division d on d.division_id=e.division_id ";
    private final String SEARCH = "select e.*,p.name_position,ed.name_education_degree,d.name_division from employee e join position p " +
            "on p.position_id=e.position_id join education_degree ed on ed.education_degree_id=e.education_degree_id join division d on d.division_id=e.division_id where name_employee like ? and name_education_degree like ?";
    private final String UPDATE="insert into employee (\n" +
            "   name_employee, day_of_birth, id_card, \n" +
            "  salary, phone_number, email, address, \n" +
            "  position_id, education_degree_id, division_id\n" +
            ") \n" +
            "values (?,?,?,?,?,?,?,?,?,?)";
    @Override
    public List<Employee> findAll() {
        List<Employee> list = new ArrayList<>();
        Connection connection = DataBase.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("name_employee");
                String dayOfBirth = resultSet.getString("day_of_birth");
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int idPosition = resultSet.getInt("position_id");
                String namePosition = resultSet.getString("name_position");
                Position position = new Position(idPosition, namePosition);
                int idEducation = resultSet.getInt("education_degree_id");
                String nameEducation = resultSet.getString("name_education_degree");
                Education education = new Education(idEducation, nameEducation);
                int idDivision = resultSet.getInt("division_id");
                String nameDivision = resultSet.getString("name_division");
                Division division = new Division(idDivision, nameDivision);
                Employee employee = new Employee(id, name, dayOfBirth, idCard, salary, phone, email, address, position, education, division);
                list.add(employee);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean save(Employee employee) {
        return false;
    }

    @Override
    public boolean deleteEmployee(int id) {
        Connection connection=DataBase.getConnectDB();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            return preparedStatement.executeUpdate()>0;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        //      "   name_employee, day_of_birth, id_card, \n" +
        //            "  salary, phone_number, email, address, \n" +
        //            "  position_id, education_degree_id, division_id\n" +
        Connection connection=DataBase.getConnectDB();
        try{
            PreparedStatement preparedStatement =connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getDayOfBirth());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getPhone());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getAddress());
            preparedStatement.setInt(8,employee.getPosition().getId());
            preparedStatement.setInt(9,employee.getEducation().getId());
            preparedStatement.setInt(10,employee.getDivision().getId());
            return preparedStatement.executeUpdate()>0;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Employee> search(String name, String nameEducation) {
        Connection connection=DataBase.getConnectDB();
        List<Employee> list=new ArrayList<>();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%"+name);
            preparedStatement.setString(2,"%"+nameEducation+"%");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("employee_id");
                String namenew = resultSet.getString("name_employee");
                String dayOfBirth = resultSet.getString("day_of_birth");
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int idPosition = resultSet.getInt("position_id");
                String namePosition = resultSet.getString("name_position");
                Position position = new Position(idPosition, namePosition);
                int idEducation = resultSet.getInt("education_degree_id");
                String nameEducationnew = resultSet.getString("name_education_degree");
                Education education = new Education(idEducation, nameEducationnew);
                int idDivision = resultSet.getInt("division_id");
                String nameDivision = resultSet.getString("name_division");
                Division division = new Division(idDivision, nameDivision);
                Employee employee = new Employee(id, namenew, dayOfBirth, idCard, salary, phone, email, address, position, education, division);
                list.add(employee);
            }
            }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }
}
