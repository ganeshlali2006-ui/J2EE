package com.cookie;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CookieServlet")   // Annotation replaces web.xml
public class CookieServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("username");

        int visitCount = 0;
        String userName = "";

        Cookie[] cookies = request.getCookies();

        // Read cookies
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("username")) {
                    userName = c.getValue();
                }
                if (c.getName().equals("visitCount")) {
                    visitCount = Integer.parseInt(c.getValue());
                }
            }
        }

        // First visit
        if (userName.equals("")) {
            userName = name;
        }

        visitCount++;

        // Create cookies
        Cookie nameCookie = new Cookie("username", userName);
        Cookie countCookie = new Cookie("visitCount", String.valueOf(visitCount));

        // Expiry (60 seconds)
        nameCookie.setMaxAge(60);
        countCookie.setMaxAge(60);

        response.addCookie(nameCookie);
        response.addCookie(countCookie);

        // Output
        out.println("<html><body>");

        out.println("<h2>Welcome back " + userName + "!</h2>");
        out.println("<h3>You have visited this page " + visitCount + " times</h3>");

        // Display cookies
        out.println("<h3>List of Cookies:</h3>");
        if (cookies != null) {
            for (Cookie c : cookies) {
                out.println("Name: " + c.getName() + " Value: " + c.getValue() + "<br>");
            }
        }

        out.println("<p><b>Note:</b> Cookie expires in 60 seconds.</p>");

        out.println("</body></html>");
    }
}