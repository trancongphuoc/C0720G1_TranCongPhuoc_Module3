package repository.customer;

import model.Customer;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "SELECT customer.customer_id," +
            "customer_name," +
            "customer_birthday," +
            "customer_gender," +
            "customer_id_card," +
            "customer_phone," +
            "customer_email," +
            "customer_address," +
            "customer_type_name FROM customer " +
            "JOIN customer_type on customer.customer_type_id = customer_type.customer_type_id LIMIT ?,?;";

    private static final String COUNT_CUSTOMER = "SELECT count(customer_id) as count FROM customer;";

    private static final String INSERT_CUSTOMER = "INSERT INTO customer (customer_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address, customer_type_id) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";

    private  static final String UPDATE_CUSTOMER = "UPDATE customer SET customer_name = ?," +
            "customer_birthday = ?," +
            "customer_gender = ?," +
            "customer_id_card = ?," +
            "customer_phone = ?," +
            "customer_email = ?," +
            "customer_address = ?," +
            "customer_type_id = ?" +
            " where customer_id = ?;";

    private  static final String DELETE_CUSTOMER = "DELETE FROM customer WHERE customer_id = ?";

    private static final String SELECT_CUSTOMER_BY_NAME = "SELECT customer.customer_id," +
            "customer_name," +
            "customer_birthday," +
            "customer_gender," +
            "customer_id_card," +
            "customer_phone," +
            "customer_email," +
            "customer_address," +
            "customer_type_name FROM customer " +
            "JOIN customer_type on customer.customer_type_id = customer_type.customer_type_id WHERE customer_name LIKE ? ;";

    @Override
    public List<Customer> selectAllCustomer(int page, int record) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();

        try {
            int start = (page - 1) * record;
            preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, record);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = "KH-" + resultSet.getString("customer_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender;
                if (resultSet.getInt("customer_gender") == 0) {
                    gender = "Nam";
                } else {
                    gender = "Nữ";
                }
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                String customerType = resultSet.getString("customer_type_name");
                customerList.add(new Customer(id, name, birthday, idCard, phone, email, address, gender, customerType));
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
        return customerList;
    }

    @Override
    public Customer selectCustomerById() {
        return null;
    }

    @Override
    public void insertCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setInt(1, Integer.parseInt(customer.getId().substring(3)));
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthday());
            preparedStatement.setInt(4, Integer.parseInt(customer.getGender()));
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, Integer.parseInt(customer.getCustomerType()));

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
    }

    @Override
    public void deleteCustomer(String id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);

            preparedStatement.setInt(1, Integer.parseInt(id.substring(3)));

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
    }

    @Override
    public void updateCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);

            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthday());
            preparedStatement.setInt(3, Integer.parseInt(customer.getGender()));
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, Integer.parseInt(customer.getCustomerType()));
            preparedStatement.setInt(9, Integer.parseInt(customer.getId().substring(3)));

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
    }

    @Override
    public List<Customer> selectCustomerByName(String name) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_NAME);
            preparedStatement.setString(1, "%" +name + "%");
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = "KH-" + resultSet.getInt("customer_id");
                name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                String gender;
                if (resultSet.getInt("customer_gender") == 0) {
                    gender = "Nam";
                } else {
                    gender = "Nữ";
                }
                String customerType = resultSet.getString("customer_type_name");
                customerList.add(new Customer(id, name, birthday, idCard, phone, email, address, gender, customerType));
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
        return customerList;
    }

    @Override
    public int countCustomer() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int count = 0;

        try {
            preparedStatement = connection.prepareStatement(COUNT_CUSTOMER);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                count = resultSet.getInt("count");
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
        return count;
    }
}
