package db.service;

import model.Customer;
import repository.service.ServiceRepository;
import repository.service.ServiceRepositoryImpl;

import java.util.List;

public class ServiceDBImpl implements ServiceDB {
    ServiceRepository serviceRepository = new ServiceRepositoryImpl();

    @Override
    public List<model.Service> selectAllService() {
        return serviceRepository.selectAllService();
    }

    @Override
    public Customer selectServiceById() {
        return null;
    }

    @Override
    public void insertService(model.Service service) {
        serviceRepository.insertService(service);
    }

    @Override
    public void deleteService(String id) {

    }

    @Override
    public void updateService(model.Service service) {

    }

    @Override
    public List<Customer> selectServiceByName(String name) {
        return null;
    }
}
