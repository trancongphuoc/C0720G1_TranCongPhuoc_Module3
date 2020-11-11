package repository.contract;

import model.Contract;
import model.Customer;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepositoryImpl implements ContractRepository {
    private static final String SELECT_ALL_CONTRACT = "SELECT contract_id," +
            " contract_start_date," +
            " contract_end_date," +
            " contract_deposit," +
            " contract_total_money," +
            " customer_name," +
            " employee_name," +
            " service_name from contract " +
            "join customer on contract.customer_id = customer.customer_id " +
            "join employee on contract.employee_id = employee.employee_id " +
            "join service on contract.service_id = service.service_id;";

    private static final String INSERT_CONTRACT = "INSERT INTO contract VALUES ( ?,?,?,?,?,?,?,? );";

    @Override
    public List<Contract> selectAllContract() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Contract> contractList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("contract_id");
                String startDate = resultSet.getString("contract_start_date");
                String endDate = resultSet.getString("contract_end_date");
                double deposit = resultSet.getDouble("contract_deposit");
                double totalMoney = resultSet.getDouble("contract_total_money");
                String employee = resultSet.getString("employee_name");
                String customer = resultSet.getString("customer_name");
                String service = resultSet.getString("service_name");

                contractList.add(new Contract(id, startDate, endDate, deposit, totalMoney, employee, customer,service));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractList;
    }

    @Override
    public Contract selectContractById() {
        return null;
    }

    @Override
    public void insertContract(Contract contract) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = connection.prepareStatement(INSERT_CONTRACT);
            preparedStatement.setInt(1,contract.getId());
            preparedStatement.setString(2, contract.getStartDate());
            preparedStatement.setString(3, contract.getEndDate());
            preparedStatement.setDouble(4, contract.getDeposit());
            preparedStatement.setDouble(5, contract.getTotalMoney());
            preparedStatement.setInt(6, Integer.parseInt(contract.getCustomer()));
            preparedStatement.setInt(7, Integer.parseInt(contract.getEmployee()));
            preparedStatement.setInt(8, Integer.parseInt(contract.getService()));

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
    public void deleteContract(String id) {

    }

    @Override
    public void updateContract(Customer customer) {

    }

    @Override
    public List<Contract> selectContractByName(String name) {
        return null;
    }
}
