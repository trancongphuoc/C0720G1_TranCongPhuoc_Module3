package controller;

import db.user.UserService;
import db.user.UserServiceImpl;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");


        if (action == null) {
            action = "";
        }

        switch (action) {
            case "login":
                loginUser(request, response);
                break;
            default:
                break;
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> userList = userService.selectAllUser();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        session.setAttribute("username", username);

        String remember = null;
        try {
            remember = request.getParameter("remember");
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        if (userList.get(username).equals(password)) {

            if (remember == null) {
                request.setAttribute("username", username);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }

            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(120);
            response.addCookie(cookie);
            try {
                response.sendRedirect("/home");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String message = "The account or password is incorrect";
            request.setAttribute("message", message);
            try {
                request.getRequestDispatcher("login/login.jsp").forward(request, response);
            } catch (IOException | ServletException e) {
                e.printStackTrace();
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "login":
                break;
            default:
                loginJSP(request, response);
        }
    }

    private void loginJSP(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("login/login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
