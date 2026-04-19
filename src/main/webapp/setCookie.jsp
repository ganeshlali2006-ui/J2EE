<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<title>Set Cookie</title>
</head>
<body>

<%
String name = request.getParameter("cookieName");
String domain = request.getParameter("domain");
String maxAge = request.getParameter("maxAge");

if (name != null && maxAge != null) {

    List<Map<String, String>> cookieList =
    (List<Map<String, String>>) session.getAttribute("cookieList");

    if (cookieList == null) {
        cookieList = new ArrayList<>();
    }

    long currentTime = System.currentTimeMillis() / 1000;

    // Create Cookie
    Cookie cookie = new Cookie(name, name);
    cookie.setMaxAge(Integer.parseInt(maxAge));

    // Avoid domain issues
    // cookie.setDomain(domain);  <-- removed to prevent errors

    response.addCookie(cookie);

    // Store details in session
    Map<String, String> map = new HashMap<>();
    map.put("name", name);
    map.put("domain", (domain == null || domain.isEmpty()) ? "default" : domain);
    map.put("maxAge", maxAge);
    map.put("setTime", String.valueOf(currentTime));

    cookieList.add(map);
    session.setAttribute("cookieList", cookieList);

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<h3 style="color:green;">Cookie Set Successfully</h3>

<p><b>Cookie Name:</b> <%= name %></p>
<p><b>Domain:</b> <%= (domain == null || domain.isEmpty()) ? "default" : domain %></p>
<p><b>Max Age:</b> <%= maxAge %> seconds</p>
<p><b>Time:</b> <%= sdf.format(new Date()) %></p>

<%
}
%>

<br>
<a href="index.jsp">Go Back</a>

</body>
</html>