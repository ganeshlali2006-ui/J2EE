<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Session Check</title>
</head>
<body>

<h2>Session Status</h2>

<%
String name = (String) session.getAttribute("user");

if (name == null) {
%>
    <h3>Session Expired!</h3>
    <p>Please go back and start again.</p>
<%
} else {
%>
    <h3>Hello <%= name %>!</h3>
    <p>Session is still active.</p>
<%
}
%>

</body>
</html>