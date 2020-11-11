package db.contract_detail;

import model.Contract;
import model.ContractDetail;
import repository.contract_detail.ContractDetailRepository;
import repository.contract_detail.ContractDetailRepositoryImpl;

import java.util.List;

public class ContractDetailServiceImpl implements ContractDetailService {
    ContractDetailRepository contractDetailRepository = new ContractDetailRepositoryImpl();
    @Override
    public List<ContractDetail> selectAllContractDetail() {
        return contractDetailRepository.selectAllContractDetail();
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
