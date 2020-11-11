package controller;

import db.contract_detail.ContractDetailService;
import db.contract_detail.ContractDetailServiceImpl;
import model.ContractDetail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractDetailServlet" , urlPatterns = "/contract-details")
public class ContractDetailServlet extends HttpServlet {
    ContractDetailService contractDetailService = new ContractDetailServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create" :
                break;
            default:
                getAllContractDetail(request, response);
                break;
        }
    }

    private void getAllContractDetail(HttpServletRequest request, HttpServletResponse response) {
        List<ContractDetail> contractDetailList = contractDetailService.selectAllContractDetail();

        request.setAttribute("contractDetailList", contractDetailList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("contract_detail/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
