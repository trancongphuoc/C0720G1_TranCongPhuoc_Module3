package db.contract;

import model.Contract;
import model.Customer;
import repository.contract.ContractRepository;
import repository.contract.ContractRepositoryImpl;

import java.util.List;

public class ContractServiceImpl implements ContractService {
    ContractRepository contractRepository = new ContractRepositoryImpl();

    @Override
    public List<Contract> selectAllContract() {
        return contractRepository.selectAllContract();
    }

    @Override
    public Contract selectContractById() {
        return null;
    }

    @Override
    public void insertContract(Contract contract) {
        contractRepository.insertContract(contract);
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
