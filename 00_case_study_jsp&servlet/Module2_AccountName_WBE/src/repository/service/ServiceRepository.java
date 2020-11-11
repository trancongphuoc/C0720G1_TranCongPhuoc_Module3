package repository.service;

import model.Customer;
import model.Service;

import java.util.List;

public interface ServiceRepository {
    List<Service> selectAllService();

    Customer selectServiceById();

    void insertService(Service service);

    void deleteService(String id);

    void updateService(Service service);

    List<Customer> selectServiceByName(String name);

}
