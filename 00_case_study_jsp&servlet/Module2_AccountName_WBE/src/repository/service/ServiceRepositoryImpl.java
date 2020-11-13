package repository.service;

import model.Customer;
import model.Service;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository {
    private static final String SELECT_ALL_SERVICE = "SELECT service_id," +
            " service_name," +
            " service_area," +
            " service_cost," +
            " service_max_people," +
            " standard_room, description," +
            " pool_area, number_of_floor," +
            " service_type_name," +
            " rent_type_name FROM service " +
            " JOIN service_type on service.service_type_id = service_type.service_type_id " +
            " JOIN rent_type on service.rent_type_id = rent_type.rent_type_id;";

    private static final String INSERT_SERVICE = "INSERT INTO service VALUES(?,?,?,?,?,?,?,?,?,?,?);";

    @Override
    public List<Service> selectAllService() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Service> serviceList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = "SV-" + resultSet.getInt("service_id");
                String name = resultSet.getString("service_name");
                double area = resultSet.getDouble("service_area");
                double cost = resultSet.getDouble("service_cost");
                int maxPeople = resultSet.getInt("service_max_people");
                String standardRoom = resultSet.getString("standard_room");
                String description = resultSet.getString("description");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloor = resultSet.getInt("number_of_floor");
                String serviceType = resultSet.getString("service_type_name");
                String rentType = resultSet.getString("rent_type_name");

                serviceList.add(new Service(id, name, area, cost, maxPeople, standardRoom, description, poolArea, numberOfFloor, serviceType, rentType));
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
        return serviceList;
    }

    @Override
    public Customer selectServiceById() {
        return null;
    }

    @Override
    public void insertService(Service service) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = connection.prepareStatement(INSERT_SERVICE);
            preparedStatement.setInt(1, Integer.parseInt(service.getId().substring(3)));
            preparedStatement.setString(2, service.getName());
            preparedStatement.setDouble(3, service.getArea());
            preparedStatement.setDouble(4, service.getCost());
            preparedStatement.setInt(5, service.getServiceMaxPeople());
            preparedStatement.setString(6, service.getStandardRoom());
            preparedStatement.setString(7, service.getDescription());
            preparedStatement.setDouble(8, service.getPoolArea());
            preparedStatement.setInt(9, service.getNumberOfFloor());
            preparedStatement.setInt(10, Integer.parseInt(service.getServiceType()));
            preparedStatement.setInt(11, Integer.parseInt(service.getRentType()));

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
    public void deleteService(String id) {

    }

    @Override
    public void updateService(Service service) {

    }

    @Override
    public List<Customer> selectServiceByName(String name) {
        return null;
    }
}
