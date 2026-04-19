<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Session Check</title>
</head>
<body>

<h2>Display Session Value</h2>

<%
String name = (String) session.getAttribute("user");

if (name == null) {
%>
    <h3>Sorry, the session has ended!</h3>
<%
} else {
%>
    <h3>Hello <%= name %>!</h3>
<%
}
%>

</body>
</html>