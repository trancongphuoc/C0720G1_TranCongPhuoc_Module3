package model;

public class Customer extends Human {
    private String gender;
    private String customerType;

    public Customer(String id, String name, String birthday, String idCard, String phone, String email, String address, String gender, String customerType) {
        super(id, name, birthday, idCard, phone, email, address);
        this.gender = gender;
        this.customerType = customerType;
    }

    public Customer(String name, String birthday, String idCard, String phone, String email, String address, String gender, String customerType) {
        super(name, birthday, idCard, phone, email, address);
        this.gender = gender;
        this.customerType = customerType;
    }

    public Customer() {
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }
}
