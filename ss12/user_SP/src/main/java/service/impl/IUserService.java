package service.impl;

import model.User;

import java.util.List;

public interface IUserService {
    boolean save(User user);
    List<User> findAll();
    boolean update(User user);
    boolean delete(int id);
    User findById(int id);
}
