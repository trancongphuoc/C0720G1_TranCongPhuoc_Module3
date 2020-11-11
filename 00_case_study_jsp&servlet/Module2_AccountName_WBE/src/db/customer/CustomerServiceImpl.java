package db.customer;

import model.Customer;
import repository.customer.CustomerRepository;
import repository.customer.CustomerRepositoryImpl;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepository customerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> selectAllCustomer(int page, int record) {
        return customerRepository.selectAllCustomer(page, record);
    }

    @Override
    public Customer selectCustomerById() {
        return null;
    }

    @Override
    public void insertCustomer(Customer customer) {
        customerRepository.insertCustomer(customer);
    }

    @Override
    public void deleteCustomer(String id) {
        customerRepository.deleteCustomer(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerRepository.updateCustomer(customer);
    }

    @Override
    public List<Customer> selectCustomerByName(String name) {
        return customerRepository.selectCustomerByName(name);
    }

    @Override
    public int countCustomer() {
        return customerRepository.countCustomer();
    }
}
