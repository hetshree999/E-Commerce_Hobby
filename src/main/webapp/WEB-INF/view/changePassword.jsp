<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="changeDetailHeader.jsp"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ChangePassword</title>
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

 <c:if test = "${msg == 'same' }">
	<h3 class="alert">Your old Password is wrong!</h3>
</c:if>

<c:if test = "${msg == 'notMatch' }">
	<h3 class="alert">New password and Confirm password does not match!</h3>
</c:if> 

<c:if test = "${msg == 'valid' }">
	<h3 class="alert">Password change successfully!</h3>
</c:if>

<c:if test = "${msg == 'Invalid' }">
	<h3 class="alert">Some thing went wrong! Try again!</h3>
</c:if>
	<form action="changePasswordAction" method="post">
		<h3>Enter Old Password</h3>
		<input class="input-style" type="password" name="oldPassword"
			placeholder="Enter Old Password" required>
		<hr>
		<h3>Enter New Password</h3>
		<input class="input-style" type="password" name="newPassword"
			placeholder="Enter New Password" required>
		<hr>
		<h3>Enter Confirm Password</h3>
		<input class="input-style" type="password" name="confirmPassword"
			placeholder="Enter Confirm Password" required>
		<hr>
		<button class="button" type="submit">
			Save <i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
</body>
<br>
<br>
<br>
</html>