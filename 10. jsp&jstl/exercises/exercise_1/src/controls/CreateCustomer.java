package controls;

import models.Customer;

import java.util.ArrayList;
import java.util.List;

public class CreateCustomer {
    static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Abaji Cuzen","01/05/2000","Đà Nẵng","Avatar"));
        customerList.add(new Customer("Hruna","26/06/1994","Tokyo","Avatar"));
        customerList.add(new Customer("Nguyễn Công","06/09/1996","Hà Tịnh","Avatar"));
        customerList.add(new Customer("Hoàng Hà","03/07/1997","Nghệ An","Avatar"));
        customerList.add(new Customer("Jonh Wick","22/02/2005","Quảng Bình","Avatar"));
        customerList.add(new Customer("Androck","16/05/1998","Quãng Trị","Avatar"));
    }

    public static List<Customer> getCustomerList() {
        return customerList;
    }
}
