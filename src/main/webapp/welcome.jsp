<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>

<%
String name = request.getParameter("uname");

// Store name in session
session.setAttribute("user", name);

// Set session expiry time (example: 60 seconds)
int time = 60;
session.setMaxInactiveInterval(time);
%>

<h2>Hello <%= name %>!</h2>

<p>Session has been created successfully.</p>
<p>Session expiry time is set to <b><%= time %> seconds</b></p>

<p>
Click the link below within the session time to check:
</p>

<a href="check.jsp">Check Session</a>

</body>
</html>