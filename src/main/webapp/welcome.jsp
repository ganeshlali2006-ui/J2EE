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

// Store in session
session.setAttribute("user", name);

// Set session expiry = 1 minute
session.setMaxInactiveInterval(60);
%>

<h2>Hello <%= name %>!</h2>

<p>Session has started...</p>
<p>Your name has been stored in session object</p>
<p>Session expiry time is set to <b>1 minute</b></p>

<p>
Click below within 1 minute to check session:
</p>

<a href="second.jsp">Display the value</a>

</body>
</html>