package db.contract_detail;

import model.Contract;
import model.ContractDetail;

import java.util.List;

public interface ContractDetailService {
    List<ContractDetail> selectAllContractDetail();

    Contract selectContractDetailById();

    void insertContractDetail(ContractDetail contractDetail);

    void deleteContractDetail(String id);

    void updateContractDetail(ContractDetail contractDetail);

    List<Contract> selectContractDetailByName(String name);
}
