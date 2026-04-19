package com.cookie;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("username");

        Cookie cookies[] = request.getCookies();

        int visitCount = 0;
        boolean userFound = false;

        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("username")) {
                    name = c.getValue();
                    userFound = true;
                }
                if (c.getName().equals("visit")) {
                    visitCount = Integer.parseInt(c.getValue());
                }
            }
        }

        visitCount++;

        // Create / update cookies
        Cookie userCookie = new Cookie("username", name);
        Cookie visitCookie = new Cookie("visit", String.valueOf(visitCount));

        // 🔹 Set expiry time (1 minute)
        userCookie.setMaxAge(60);
        visitCookie.setMaxAge(60);

        response.addCookie(userCookie);
        response.addCookie(visitCookie);

        // Output
        out.println("<html><body>");
        
        if (userFound) {
            out.println("<h2>Welcome back " + name + "!</h2>");
        } else {
            out.println("<h2>Welcome " + name + "!</h2>");
        }

        out.println("<h3>You have visited this page " + visitCount + " times.</h3>");

        out.println("<h3>Cookie Details:</h3>");

        if (cookies != null) {
            for (Cookie c : cookies) {
                out.println("Name: " + c.getName() + " Value: " + c.getValue() + "<br>");
            }
        }

        out.println("<br><b>Note:</b> Cookies will expire in 1 minute.");

        out.println("</body></html>");
    }
}