package controller;

import common.DateException;
import common.Validate;
import db.contract.ContractService;
import db.contract.ContractServiceImpl;
import db.customer.CustomerService;
import db.customer.CustomerServiceImpl;
import db.employee.EmployeeService;
import db.employee.EmployeeServiceImpl;
import db.service.ServiceDB;
import db.service.ServiceDBImpl;
import model.Contract;
import model.Customer;
import model.Employee;
import model.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns = "/contracts")
public class ContractServlet extends HttpServlet {
    ContractService contractService = new ContractServiceImpl();
    CustomerService customerService = new CustomerServiceImpl();
    EmployeeService employeeService = new EmployeeServiceImpl();
    ServiceDB serviceDB = new ServiceDBImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createContract(request, response);
                getAllContract(request, response);
                break;
            default:
                break;
        }
    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) {
//        String attachService = request.getParameter("box");
//        System.out.println(attachService);
        boolean flag = true;
        String message = "";
        int id = 0;
        String startDate = null;
        String endDate = null;
        try {
            startDate = request.getParameter("startDate");
            endDate = request.getParameter("endDate");
            Validate.regexDate(startDate);
            Validate.regexDate(endDate);
        } catch (DateException e) {
            message = e.getMessage() + " <br> ";
            flag = false;
        }
        double deposit = 0;
        double totalMoney = 0;
        try {
            id = Integer.parseInt(request.getParameter("id"));
            deposit = Double.parseDouble(request.getParameter("deposit"));
            totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
        } catch (NumberFormatException e) {
            message += "Number > 0";
            flag = false;
        }
        String customer = request.getParameter("customer");
        String employee = request.getParameter("employee");
        String service = request.getParameter("service");

        if (!flag) {
            request.setAttribute("id", id);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            request.setAttribute("message", message);
            request.setAttribute("deposit", deposit);
            request.setAttribute("totalMoney", totalMoney);
            createJSP(request, response);
        }
        Contract contract = new Contract(id, startDate, endDate, deposit, totalMoney, employee, customer, service);
        contractService.insertContract(contract);

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
            default:
                getAllContract(request, response);
                break;
        }
    }

    private void createJSP(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomer(1, 100);
        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Service> serviceList = serviceDB.selectAllService();
        request.setAttribute("customerList", customerList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("contract/create.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllContract(HttpServletRequest request, HttpServletResponse response) {
        List<Contract> contractList = contractService.selectAllContract();

        request.setAttribute("contractList", contractList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("contract/list.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
