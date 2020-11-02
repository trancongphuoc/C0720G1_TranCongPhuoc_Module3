import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet", urlPatterns = "/index")
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String passWord = request.getParameter("password");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");

        if (userName.equals("admin") && passWord.equals("admin")) {
            writer.println("<h1> Welcome " + userName + " to website<h1>");
        } else {
            writer.println("<h1>Login Error");
        }

        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
//        requestDispatcher.forward(request,response);
//        String userName = request.getParameter("username");
//        String passWord = request.getParameter("password");
//
//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//
//        if (userName.equals("admin") && passWord.equals("admin")) {
//            writer.println("<h1> Welcome " + userName + " to website<h1>");
//        } else {
//            writer.println("<h1>Login Error");
//        }
//
//        writer.println("</html>");
    }
}
