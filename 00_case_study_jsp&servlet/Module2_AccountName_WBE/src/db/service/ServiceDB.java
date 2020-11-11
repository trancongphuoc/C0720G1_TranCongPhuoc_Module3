package db.service;

import model.Customer;
import model.Service;

import java.util.List;

public interface ServiceDB {
    List<Service> selectAllService();

    Customer selectServiceById();

    void insertService(model.Service service);

    void deleteService(String id);

    void updateService(model.Service service);

    List<Customer> selectServiceByName(String name);
}
