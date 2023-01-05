package repository.impl;

import model.User;

import java.util.List;

public interface IUserRepository {
    boolean save(User user);
    List<User> findAll();
    boolean update(User user);
    boolean delete(int id);
    User findById(int id);
    List<User>findByCountry(String country);
    List<User>  sortName();
    String addUserTransaction(User user);
}
