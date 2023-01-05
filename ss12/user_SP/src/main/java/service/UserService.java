package service;

import model.User;
import repository.UserRepository;
import repository.impl.IUserRepository;
import service.impl.IUserService;

import java.util.List;

public class UserService implements IUserService {
    IUserRepository userRepository=new UserRepository();
    @Override
    public boolean save(User user) {
        return userRepository.save(user);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public boolean update(User user) {
        return userRepository.update(user);
    }

    @Override
    public boolean delete(int id) {
        return userRepository.delete(id);
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }


}
