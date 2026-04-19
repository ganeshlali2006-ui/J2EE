<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Student Result</title>

<script>
function validateForm() {
    let f = document.forms["form"];

    if (f.roll.value=="" || f.name.value=="") {
        alert("Roll No and Name required");
        return false;
    }

    for (let i=1;i<=5;i++) {
        let mark = f["sub"+i].value;
        if (mark=="" || mark<0 || mark>100) {
            alert("Enter valid marks (0-100)");
            return false;
        }
    }
    return true;
}
</script>

</head>
<body>

<h2>Student Marks Entry</h2>

<form name="form" action="processResult" method="post" onsubmit="return validateForm()">

Roll No: <input type="text" name="roll"><br><br>
Name: <input type="text" name="name"><br><br>

Sub1: <input type="text" name="sub1"><br><br>
Sub2: <input type="text" name="sub2"><br><br>
Sub3: <input type="text" name="sub3"><br><br>
Sub4: <input type="text" name="sub4"><br><br>
Sub5: <input type="text" name="sub5"><br><br>

<input type="submit" value="Calculate Result">

</form>

</body>
</html>