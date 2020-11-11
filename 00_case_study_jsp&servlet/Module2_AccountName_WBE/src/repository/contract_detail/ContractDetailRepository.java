package repository.contract_detail;

import model.Contract;
import model.ContractDetail;
import model.Customer;

import java.util.List;

public interface ContractDetailRepository {
    List<ContractDetail> selectAllContractDetail();

    Contract selectContractDetailById();

    void insertContractDetail(ContractDetail contractDetail);

    void deleteContractDetail(String id);

    void updateContractDetail(ContractDetail contractDetail);

    List<Contract> selectContractDetailByName(String name);
}
