package service.customer.impl;

import model.customer.Customer;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    CustomerRepository customerRepository=new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
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
        return customerRepository.create(customer);
    }

    @Override
    public List<Customer> findByName(String name) {
        return null;
    }
}
