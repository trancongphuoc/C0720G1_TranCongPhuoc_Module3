package db.employee;

import model.Employee;
import repository.employee.EmployeeRepository;
import repository.employee.EmployeeRepositoryImpl;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepository.selectAllEmployee();
    }

    @Override
    public Employee selectEmployeeById() {
        return null;
    }

    @Override
    public void insertEmployee(Employee employee) {

    }

    @Override
    public void deleteEmployee(String id) {

    }

    @Override
    public void updateEmployee(Employee employee) {

    }

    @Override
    public List<Employee> selectEmployeeByName(String name) {
        return null;
    }
}
