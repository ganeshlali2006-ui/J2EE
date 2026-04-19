<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>User Form</title>

<script>
function validateForm() {
    let username = document.forms["form"]["username"].value;
    let email = document.forms["form"]["email"].value;
    let designation = document.forms["form"]["designation"].value;

    if (username == "" || email == "" || designation == "") {
        alert("All fields are required!");
        return false;
    }

    if (!email.includes("@")) {
        alert("Enter a valid email!");
        return false;
    }

    return true;
}
</script>

<style>
.form-container {
    width: 300px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
}
</style>

</head>
<body>

<div class="form-container">
<h2>User Data Form</h2>

<form name="form" action="processUser" method="post" onsubmit="return validateForm()">

Username:
<input type="text" name="username"><br><br>

Email:
<input type="text" name="email"><br><br>

Designation:
<input type="text" name="designation"><br><br>

<input type="submit" value="Submit">

</form>
</div>

</body>
</html>