package repository.customer;

import model.Customer;

import java.util.List;

public interface CustomerRepository {
    List<Customer> selectAllCustomer(int page, int record);

    Customer selectCustomerById();

    void insertCustomer(Customer customer);

    void deleteCustomer(String id);

    void updateCustomer(Customer customer);

    List<Customer> selectCustomerByName(String name);

    int countCustomer();
}
