<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Result</title>
</head>
<body>

<h2>Student Result</h2>

<%
String msg = (String) request.getAttribute("message");
%>

<p><b><%= msg %></b></p>

<% if(request.getAttribute("roll") != null) { %>

<p>Roll No: <%= request.getAttribute("roll") %></p>
<p>Name: <%= request.getAttribute("name") %></p>

<p>Sub1: <%= request.getAttribute("s1") %></p>
<p>Sub2: <%= request.getAttribute("s2") %></p>
<p>Sub3: <%= request.getAttribute("s3") %></p>
<p>Sub4: <%= request.getAttribute("s4") %></p>
<p>Sub5: <%= request.getAttribute("s5") %></p>

<p><b>Average: <%= request.getAttribute("avg") %></b></p>
<p><b>Result: <%= request.getAttribute("result") %></b></p>

<% } %>

<br>
<a href="index.jsp">Back</a>

</body>
</html>