import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CaculateServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        float firstOperand = Float.parseFloat(request.getParameter("number1"));
        float secondOperand = Float.parseFloat(request.getParameter("number2"));
        String operand = request.getParameter("operator");
        writer.println("<html>");
        try {
            writer.println(firstOperand + " " + operand + " " + secondOperand + " = " + Calculator.calculate(firstOperand,secondOperand,operand));
        } catch (Exception e) {
            writer.println(e.getMessage());
        }

        writer.println("</html>");
    }
}
