package repository.customer;

import model.customer.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    boolean delete(int id);
    boolean update(Customer customer);
    boolean create(Customer customer);
    List<Customer> findByName(String name);
}
