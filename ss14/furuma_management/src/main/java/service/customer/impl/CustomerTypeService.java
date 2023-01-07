package service.customer.impl;

import model.customer.CustomerType;
import repository.customer.impl.CustomerTypeRepository;
import service.customer.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
CustomerTypeRepository customerTypeRepository=new CustomerTypeRepository();
    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepository.findAll();
    }
}
