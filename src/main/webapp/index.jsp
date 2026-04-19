<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Cookie List Management</title>

<style>
.cookie-table {
    border-collapse: collapse;
    width: 60%;
    margin: 20px 0;
}
.cookie-table th, .cookie-table td {
    border: 1px solid #ddd;
    padding: 8px;
}
.cookie-table th {
    background-color: #f2f2f2;
}
</style>

</head>
<body>

<h2>Cookie List Management</h2>

<!-- FORM -->
<form action="setCookie.jsp" method="post">
<h3>Set New Cookie</h3>

<table>
<tr>
    <td>Cookie Name:</td>
    <td><input type="text" name="cookieName" required></td>
</tr>

<tr>
    <td>Domain:</td>
    <td><input type="text" name="domain" placeholder="optional"></td>
</tr>

<tr>
    <td>Max Age (seconds):</td>
    <td><input type="number" name="maxAge" value="10" required></td>
</tr>
</table>

<br>
<input type="submit" value="Add Cookie">
</form>

<br>

<!-- Manual Refresh Button -->
<button onclick="location.reload()">Refresh Cookie List</button>

<hr>

<h3>List of Active Cookies</h3>

<table class="cookie-table">
<tr>
    <th>Cookie Name</th>
    <th>Domain</th>
    <th>Max Age</th>
</tr>

<%
List<Map<String, String>> cookieList =
(List<Map<String, String>>) session.getAttribute("cookieList");

long currentTime = System.currentTimeMillis() / 1000;

if (cookieList != null) {

    Iterator<Map<String, String>> it = cookieList.iterator();

    while (it.hasNext()) {
        Map<String, String> c = it.next();

        try {
            long setTime = Long.parseLong(c.get("setTime"));
            int maxAge = Integer.parseInt(c.get("maxAge"));

            if (currentTime > setTime + maxAge) {
                it.remove(); // remove expired cookie
            }

        } catch (Exception e) {
            it.remove(); // remove invalid data
        }
    }

    session.setAttribute("cookieList", cookieList);
}

if (cookieList != null && !cookieList.isEmpty()) {
    for (Map<String, String> c : cookieList) {
%>
<tr>
    <td><%= c.get("name") %></td>
    <td><%= c.get("domain") %></td>
    <td><%= c.get("maxAge") %></td>
</tr>
<%
    }
} else {
%>
<tr>
    <td colspan="3" style="text-align:center;">No active cookies</td>
</tr>
<%
}
%>

</table>

</body>
</html>