package com.cookie;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CookieServlet")
public class CookieServlets extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String userName = null;
        int count = 0;

        // 🔹 Read cookies
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("user")) {
                    userName = c.getValue();
                }
                if (c.getName().equals("count")) {
                    count = Integer.parseInt(c.getValue());
                }
            }
        }

        out.println("<html><body>");

        if (userName != null) {
            count++; // increment visit

            // 🔹 Update cookies
            Cookie userCookie = new Cookie("user", userName);
            Cookie countCookie = new Cookie("count", String.valueOf(count));

            userCookie.setMaxAge(30);   // expires in 30 sec
            countCookie.setMaxAge(30);

            response.addCookie(userCookie);
            response.addCookie(countCookie);

            out.println("<h2 style='color:blue;'>Welcome back " + userName + "!</h2>");
            out.println("<h3 style='color:magenta;'>You have visited " + count + " times</h3>");
        }
        else {
            // 🔹 First time login form
            out.println("<h2 style='color:red;'>Enter your name:</h2>");
            out.println("<form action='CookieServlet' method='post'>");
            out.println("<input type='text' name='userName'>");
            out.println("<input type='submit' value='Submit'>");
            out.println("</form>");
        }

        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");

        // 🔹 Create cookies
        Cookie userCookie = new Cookie("user", userName);
        Cookie countCookie = new Cookie("count", "0");

        userCookie.setMaxAge(30);
        countCookie.setMaxAge(30);

        response.addCookie(userCookie);
        response.addCookie(countCookie);

        response.sendRedirect("CookieServlet");
    }
}