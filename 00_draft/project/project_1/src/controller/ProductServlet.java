package controller;

import model.Product;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createNewProduct(request, response);
                getAllProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                getAllProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                getAllProduct(request, response);
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "find":
                findProductByName(request, response);
                break;
            case "see":
                findProductById(request, response);
                break;
            default:
                getAllProduct(request, response);
                break;
        }
    }

    // Xóa sản phẩm.
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProductById(id);
    }

    // Cập nhật dữ liệu sản phẩm.
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");

        Product product = new Product(id, name, price, description, producer);

        productService.updateProduct(product);
    }

    // Tìm kiếm sản phẩm theo ID.
    private void findProductById(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        Product product = productService.findProductById(id);
        request.setAttribute("product", product);


        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/see.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    // Tìm kiếm sản phẩm theo tên.
    private void findProductByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Product> productList = productService.findProductByName(name);

        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/find.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    // Tạo mới sản phẩm.
    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");

        Product product = new Product(name, price, description, producer);

        productService.saveProduct(product);

    }

    // Hiển thị danh sách sản phẩm.
    private void getAllProduct(HttpServletRequest request, HttpServletResponse response) {
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        List<Product> productList = productService.getProductLimit(page, 5);


        double noOfRecord = productService.getCount();
        double noOfPage = Math.ceil(noOfRecord /5);

        request.setAttribute("noOfPage", noOfPage);
        request.setAttribute("productList", productList);
        request.setAttribute("currentPage", page);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }


//        List<Product> productList = productService.getAllProduct();
//        request.setAttribute("productList", productList);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/list.jsp");
//        try {
//            requestDispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }
    }
}
