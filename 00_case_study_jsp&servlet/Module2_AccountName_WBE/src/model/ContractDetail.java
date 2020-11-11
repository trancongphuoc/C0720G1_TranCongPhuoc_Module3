package model;

public class ContractDetail {
    private int id;
    private int contractId;
    private String attachService;
    private int quantity;

    public ContractDetail(int id, int contractId, String attachService, int quantity) {
        this.id = id;
        this.contractId = contractId;
        this.attachService = attachService;
        this.quantity = quantity;
    }

    public ContractDetail(int contractId, String attachService, int quantity) {
        this.contractId = contractId;
        this.attachService = attachService;
        this.quantity = quantity;
    }

    public ContractDetail() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public String getAttachService() {
        return attachService;
    }

    public void setAttachService(String attachService) {
        this.attachService = attachService;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
