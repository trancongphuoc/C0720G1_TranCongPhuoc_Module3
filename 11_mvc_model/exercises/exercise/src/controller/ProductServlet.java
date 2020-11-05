package controller;

import models.Product;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {

    private ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            action = " ";
        }

        switch (action) {
            case "create":
                createNewProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
            case "delete":
                deleteProduct(request,response);
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
            action = " ";
        }

        switch (action) {
            case "create":
                createJSP(request, response);
                break;
            case "update":
                updateJSP(request, response);
                break;
            case "delete":
                deleteJSP(request, response);
                break;
            case "see":
                seeProduct(request, response);
                break;
            case "Search":
                findProductByName(request, response);
                break;
            default:
                printListProduct(request, response);
                break;
        }
    }

    // Xoa Product.
    private  void deleteJSP(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.seeProduct(id);

        request.setAttribute("product", product);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/delete.jsp");

        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);

        printListProduct(request, response);
    }

    // Tạo mới product.
    private void createJSP(HttpServletRequest request, HttpServletResponse response) {

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        
        int id;
        List<Product> productList = productService.printList();
        id = productList.size() == 0 ? 1 : productList.size() + 1;

        Product product = new Product(id, name, price, description, producer);
        productService.create(product);

        printListProduct(request, response);


    }


    // In danh sách product.
    private void printListProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.printList();
        request.setAttribute("productList", productList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/list.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Update Product.
    private void updateJSP(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.seeProduct(id);

        request.setAttribute("product", product);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/update.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");

        Product product = new Product(id, name, price, description, producer);
        productService.update(id, product);

        printListProduct(request, response);
    }

    // See Product
    private void seeProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.seeProduct(id);
        List<Product> productList = new ArrayList<>();
        productList.add(product);
        request.setAttribute("productList", productList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/info_detail.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Find product by name
    private void findProductByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Product> productList = productService.findProductByName(name);
        if (productList == null) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("exception/exception.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("productList", productList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/info_detail.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
}
