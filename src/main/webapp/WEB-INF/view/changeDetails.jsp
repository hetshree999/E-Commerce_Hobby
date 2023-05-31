<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="changeDetailHeader.jsp"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

hr {
	width: 70%;
}
</style>
<title>Change Details</title>
</head>
<body>

	<h3>Name: ${user.name }</h3>
	<hr>
	<h3>Email: ${user.email }</h3>
	<hr>
	<h3>Mobile Number: ${user.mobileNumber}</h3>
	<hr>
	<h3>Security Question: ${user.securityQuestion }</h3>
	<hr>
	<br>
	<br>
	<br>
</body>
</html>