package repository.customer.impl;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.DataBase;
import repository.customer.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_FIND_ALL = "select c.*, ct.name_customer_type from customer c join customer_type ct on c.customer_type_id=ct.customer_type_id ";
    private final String INSERT = "insert into customer (customer_id, name_customer, date_of_birth, gender_customer, id_card, phone_number,email, address, customer_type_id) value (?,?,?,?,?,?,?,?,?)";

    @Override
    public List<Customer> findAll() {
        List<Customer> list=new ArrayList<>();
        Connection connection = DataBase.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id=resultSet.getInt("customer_id");
                String name=resultSet.getString("name_customer");
                String birthday=resultSet.getString("date_of_birth");
                int gender=resultSet.getInt("gender_customer");
                String idCard =resultSet.getString("id_card");
                String phone=resultSet.getString("phone_number");
                String email=resultSet.getString("email");
                String address=resultSet.getString("address");
                int customerTypeId=resultSet.getInt("customer_type_id");
                String nameCustomerType=resultSet.getString("name_customer_type");
                CustomerType customerType=new CustomerType(customerTypeId,nameCustomerType);
                Customer customer=new Customer(id,name,birthday,gender,idCard,phone,email,address,customerType);
            list.add(customer);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(Customer customer) {
        return false;
    }

    @Override
    public boolean create(Customer customer) {
        Connection connection=DataBase.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT);
            preparedStatement.setInt(1,customer.getId());
            preparedStatement.setString(2,customer.getName());
            preparedStatement.setString(3, customer.getBirthday());
            preparedStatement.setInt(4,customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9,customer.getCustomerType().getId());
          return  preparedStatement.executeUpdate() >0;
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> findByName(String name) {
        return null;
    }
}
