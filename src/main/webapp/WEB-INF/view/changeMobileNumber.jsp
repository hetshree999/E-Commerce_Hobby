<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="changeDetailHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Mobile Number</title>
<style>
.input-style {
	width: 40%;
	padding: 12px 20px;
	margin-left: 30%;
	box-sizing: border-box;
	border: none;
	background-color: white;
	color: black;
	font-size: 16px;
}

input[type=text]:focus, textarea:focus, button:focus {
	outline: 4px solid orange;
	background-color: rgb(224, 255, 219); /* oranges! yey */
}

.button {
	background-color: white; /* Green */
	border: none;
	color: black;
	padding: 12px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	margin-left: 30%;
	font-size: 16px;
}

.button:hover {
	background-color: #555555;
	color: white;
}

hr {
	width: 40%
}

h3 {
	text-align: center;
	color: white;
}

.alert {
	color: yellow;
}

.profile-style {
	border-style: dotted;
}
</style>
</head>
<body>
<c:if test = "${msg =='valid' }">
	<h3 class="alert">Your Mobile Number successfully changed!</h3>
</c:if>
<c:if test = "${msg == 'Invalid' }">
	<h3 class="alert">Your Password is wrong!</h3>
</c:if>
<form action="changeMobileNumberAction" method="post">
	<h3>Enter Your New Mobile Number</h3>
	<input class="input-style" type="number" name="mobileNumber"
		placeholder="Enter Your New Mobile Number" required>
	<hr>
	<h3>Enter Password (For Security)</h3>
	<input class="input-style" type="password" name="password"
		placeholder="Enter Password (For Security)" required>
	<hr>
	<button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br>
<br>
<br>
</html>