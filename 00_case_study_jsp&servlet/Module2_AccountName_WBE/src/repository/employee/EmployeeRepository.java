package repository.employee;

import model.Customer;
import model.Employee;

import java.util.List;

public interface EmployeeRepository {
    List<Employee> selectAllEmployee();

    Employee selectEmployeeById();

    void insertEmployee(Employee employee);

    void deleteEmployee(String id);

    void updateEmployee(Employee employee);

    List<Employee> selectEmployeeByName(String name);

}
