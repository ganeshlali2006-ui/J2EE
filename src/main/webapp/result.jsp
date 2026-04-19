<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Result</title>

<style>
.container {
    width: 300px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
}
.success { color: green; }
.error { color: red; }
</style>

</head>
<body>

<div class="container">

<h2>Processing Result</h2>

<%
String msg = (String) request.getAttribute("message");

if (msg != null && msg.startsWith("Error")) {
%>
    <p class="error"><%= msg %></p>
<%
} else {
%>
    <p class="success"><%= msg %></p>
<%
}
%>

<% if (request.getAttribute("username") != null) { %>
    <h3>Submitted Data:</h3>
    <p>Username: <%= request.getAttribute("username") %></p>
    <p>Email: <%= request.getAttribute("email") %></p>
    <p>Designation: <%= request.getAttribute("designation") %></p>
<% } %>

<br>
<a href="index.jsp">Back to Form</a>

</div>

</body>
</html>