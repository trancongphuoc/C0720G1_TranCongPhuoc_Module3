package repository.employee;

import model.Employee;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    private static final String SELECT_ALL_EMPLOYEE = "SELECT employee_id," +
            " employee_name," +
            " employee_birthday," +
            " employee_id_card," +
            " employee_phone," +
            " employee_salary," +
            " employee_email," +
            " employee_address," +
            " position_name," +
            " education_degree_name," +
            " division_name," +
            " user.username FROM employee " +
            " LEFT JOIN positions on employee.position_id = positions.position_id " +
            " LEFT JOIN education_degree on employee.education_degree_id = education_degree.education_degree_id " +
            " LEFT JOIN division on employee.division_id = division.division_id " +
            " LEFT JOIN user on employee.username = user.username;";

    @Override
    public List<Employee> selectAllEmployee() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Employee> employeeList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = "EP-" + resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                double salary = resultSet.getDouble("employee_salary");
                String position = resultSet.getString("position_name");
                String educationDegree = resultSet.getString("education_degree_name");
                String division = resultSet.getString("division_name");
                String username = resultSet.getString("username");

                employeeList.add(new Employee(id, name, birthday, idCard, phone, email, address, salary, position, educationDegree, division, username));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return employeeList;
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
