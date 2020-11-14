package repository.customer_type;

import model.CustomerType;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepositoryImpl implements CustomerTypeRepository {
    private static final String SELECT_ALL_CUSTOMER_TYPE = "SELECT * FROM customer_type";

    @Override
    public List<CustomerType> selectAllCustomerType() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<CustomerType> customerTypeList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_type_name");

                customerTypeList.add(new CustomerType(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}
