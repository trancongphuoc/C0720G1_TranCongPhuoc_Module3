package repository.contract_detail;

import model.Contract;
import model.ContractDetail;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailRepositoryImpl implements ContractDetailRepository {
    private static final String SELECT_ALL_CONTRACT_DETAIL = "SELECT contract_detail_id," +
            " quantity," +
            " contract_id," +
            " attach_service_name from contract_detail " +
            " join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id";

    @Override
    public List<ContractDetail> selectAllContractDetail() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<ContractDetail> contractDetailList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT_DETAIL);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("contract_detail_id");
                int quantity = resultSet.getInt("quantity");
                String attachService = resultSet.getString("attach_service_name");
                int contractId = resultSet.getInt("contract_id");

                contractDetailList.add(new ContractDetail(id, quantity, attachService, contractId));
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
        return contractDetailList;
    }

    @Override
    public Contract selectContractDetailById() {
        return null;
    }

    @Override
    public void insertContractDetail(ContractDetail contractDetail) {

    }

    @Override
    public void deleteContractDetail(String id) {

    }

    @Override
    public void updateContractDetail(ContractDetail contractDetail) {

    }

    @Override
    public List<Contract> selectContractDetailByName(String name) {
        return null;
    }
}
