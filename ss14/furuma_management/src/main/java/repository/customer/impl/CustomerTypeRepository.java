package repository.customer.impl;

import model.customer.CustomerType;
import repository.DataBase;
import repository.customer.ICustomerType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerType {
    private final String SELECT_ALL="select*from customer_type";
    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> list=new ArrayList<>();
        Connection connection= DataBase.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("customer_type_id");
                String name=resultSet.getString("name_customer_type");
                CustomerType customerType=new CustomerType(id,name);
                list.add(customerType);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }
}
