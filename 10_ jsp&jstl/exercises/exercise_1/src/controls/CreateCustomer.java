package controls;

import models.Customer;

import java.util.ArrayList;
import java.util.List;

public class CreateCustomer {
    static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Abaji Cuzen","01/05/2000","Đà Nẵng","image/66b4dd63d1d57912dd5be52dd1dde4e8.jpg"));
        customerList.add(new Customer("Hruna","26/06/1994","Tokyo","image/images.jpg"));
        customerList.add(new Customer("Nguyễn Công","06/09/1996","Hà Tịnh","image/images.png"));
        customerList.add(new Customer("Hoàng Hà","03/07/1997","Nghệ An","image/images (1).jpg"));
        customerList.add(new Customer("Jonh Wick","22/02/2005","Quảng Bình","image/images (2).jpg"));
    }

    public static List<Customer> getCustomerList() {
        return customerList;
    }
}
