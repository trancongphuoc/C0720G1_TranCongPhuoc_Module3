package controller;

import common.*;
import model.Customer;
import db.customer.CustomerService;
import db.customer.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createCustomer(request, response);
                getAllCustomer(request, response);
                break;
            case "update":
                updateCustomer(request, response);
                getAllCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                getAllCustomer(request, response);
                break;
            default:
                break;
        }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        customerService.deleteCustomer(id);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String customerType = request.getParameter("customerType");
        Customer customer = new Customer(id, name, birthday, idCard, phoneNumber, email, address, gender, customerType);

        customerService.updateCustomer(customer);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        boolean flag = true;
        String message = "";
        String id = null;
        try {
            id = request.getParameter("id");
            Validate.regexCustomerId(id);
        } catch (IdException e) {
            message = e.getMessage() + " <br> ";
            flag = false;
        }
        String name = request.getParameter("name");
        String birthday = null;
        try {
            birthday = request.getParameter("birthday");
            Validate.regexDate(birthday);
        } catch (DateException e) {
            message += e.getMessage() + " <br> ";
            flag = false;
        }
        String gender = request.getParameter("gender");
        String idCard = null;
        try {
            idCard = request.getParameter("idCard");
            Validate.regexIdCard(idCard);
        } catch (IdCardException e) {
            message += e.getMessage() + " <br> ";
            flag = false;
        }
        String phoneNumber = null;
        try {
            phoneNumber = request.getParameter("phone");
            Validate.regexPhone(phoneNumber);
        } catch (NumberPhoneException e) {
            message += e.getMessage() + " <br> ";
            flag = false;
        }
        String email = null;
        try {
            email = request.getParameter("email");
            Validate.regexEmail(email);
        } catch (EmailException e) {
            message += e.getMessage() + " <br> ";
        }
        String address = request.getParameter("address");
        String customerType = request.getParameter("customerType");

        if (!flag) {
            request.setAttribute("message", message);
            createJSP(request, response);
        }

        Customer customer = new Customer(id, name, birthday, idCard, phoneNumber, email, address, gender, customerType);
        customerService.insertCustomer(customer);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createJSP(request, response);
                break;
            case "find":
                findJSP(request, response);
                break;
            default:
                getAllCustomer(request, response);
        }
    }

    private void findJSP(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Customer> customerList = customerService.selectCustomerByName(name);
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list_find.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createJSP(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllCustomer(HttpServletRequest request, HttpServletResponse response) {
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        List<Customer> customerList = customerService.selectAllCustomer(page, 5);
        double countCustomer = customerService.countCustomer();
        double totalPage = Math.ceil(countCustomer / 5);

        request.setAttribute("customerList", customerList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPage", totalPage);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
