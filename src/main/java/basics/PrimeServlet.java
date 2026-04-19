package basics;


import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/prime")
public class PrimeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            int num = Integer.parseInt(request.getParameter("number"));

            if (num <= 1) {
                throw new IllegalArgumentException("Enter number > 1");
            }

            boolean isPrime = true;

            for (int i = 2; i <= num / 2; i++) {
                if (num % i == 0) {
                    isPrime = false;
                    break;
                }
            }

            out.println("<html><body>");
            if (isPrime)
                out.println("<h2>" + num + " is a Prime Number</h2>");
            else
                out.println("<h2>" + num + " is NOT a Prime Number</h2>");

            out.println("<a href='index.html'>Try Again</a>");
            out.println("</body></html>");

        } catch (NumberFormatException e) {
            out.println("<h3 style='color:red;'>Invalid input! Enter a number.</h3>");
        } catch (IllegalArgumentException e) {
            out.println("<h3 style='color:red;'>" + e.getMessage() + "</h3>");
        }
    }
}