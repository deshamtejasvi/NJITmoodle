<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<script>
function validateForm() {
    var x = document.forms["myForm"]["username"].value;
    if (x == "") {
        alert("Name must be filled out");
        return false;
    }
}
</script>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<img src="IMG_5351.jpg" height="100px" />
	<form action="test.do" method="post" onsubmit="return validateForm()">
		<div style="color: #FF0000;">${errorMessage}</div>
		</br> Username: <input type="text" name="username" id="username"></input> </br> </br>
		password: <input type="password" id="password1" name="password1" /> </br> <input
			type="submit" value="Login" />
	</form>
</body>
</html>