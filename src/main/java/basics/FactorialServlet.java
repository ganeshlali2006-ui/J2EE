package basics;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/factorial")
public class FactorialServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            int number = Integer.parseInt(request.getParameter("number"));

            if (number < 0)
                throw new IllegalArgumentException("Number cannot be negative");

            long fact = 1;
            for (int i = 1; i <= number; i++) {
                fact *= i;
            }

            out.println("<html><body>");
            out.println("<h2>Factorial Result</h2>");
            out.println("Number: " + number + "<br>");
            out.println("Factorial: " + fact);
            out.println("<br><a href='index.html'>Back</a>");
            out.println("</body></html>");

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
