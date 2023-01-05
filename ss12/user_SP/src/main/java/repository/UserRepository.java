package repository;

import jdk.nashorn.internal.codegen.CompilerConstants;
import model.User;
import repository.impl.BaseUserRepository;
import repository.impl.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users(name,email,country) VALUE (?,?,?);";
    private static final String SELECT_USER_BY_ID = "select * from users where id=?";

    private static final String SELECT_ALL_USERS = "call get_user;";
    private static final String DELETE_USERS_SQL = "call delete_user(?);";
    private static final String UPDATE_USERS_SQL = "call up_user(?,?,?,?);";


    @Override
    public boolean save(User user) {
        Connection connection = BaseUserRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> findAll() {
        List<User> list = new ArrayList<>();
        Connection connection = BaseUserRepository.getConnectDB();

        try {
            CallableStatement callableStatement=connection.prepareCall(SELECT_ALL_USERS);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean update(User user) {
        Connection connection = BaseUserRepository.getConnectDB();
        try {
            CallableStatement callableStatement=connection.prepareCall(UPDATE_USERS_SQL);
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
         e.printStackTrace();

        }
        return false;

    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseUserRepository.getConnectDB();
        try {
            CallableStatement callableStatement=connection.prepareCall(DELETE_USERS_SQL);
            callableStatement.setInt(1, id);
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User findById(int id) {
        User user = null;
        Connection connection = BaseUserRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }


}
