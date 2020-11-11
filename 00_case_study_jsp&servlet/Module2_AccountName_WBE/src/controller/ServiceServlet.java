package controller;

import db.service.ServiceDB;
import db.service.ServiceDBImpl;
import model.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = "/services")
public class ServiceServlet extends HttpServlet {
    ServiceDB serviceDB = new ServiceDBImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createService(request, response);
                getAllService(request, response);
                break;
            default:
                break;
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        boolean flag = true;
        String message = "";
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double area = 0;
        double cost = 0;
        int maxPeople = 0;
        double poolArea = 0;
        int numberOfFloor = 0;
        try {
            area = Double.parseDouble(request.getParameter("area"));
            cost = Double.parseDouble(request.getParameter("cost"));
            maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
            poolArea = Double.parseDouble(request.getParameter("poolArea"));
            numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        } catch (NumberFormatException e) {
            message = "Number > 0";
            flag = false;
        }
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        String serviceType = request.getParameter("serviceType");
        String rentType = request.getParameter("rentType");

        if (area <= 0 | cost <= 0 | maxPeople <= 0 | poolArea <= 0 | numberOfFloor <=0 ) {
            message = "Number > 0";
            flag = false;
        }

        if (!flag) {
            request.setAttribute("message", message);
            createJSP(request, response);
        }

        Service service = new Service(id, name, area, cost, maxPeople, standardRoom, description, poolArea, numberOfFloor, serviceType, rentType);
        serviceDB.insertService(service);
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
                getAllService(request, response);
                break;
        }
    }

    private void createJSP(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("service/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> serviceList = serviceDB.selectAllService();
        request.setAttribute("serviceList", serviceList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("service/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
