<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="changeDetailHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add or Change Address</title>
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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add Change Address</title>
</head>
<body>
<c:if test="${msg == 'yes' }">
	<h3 class="alert">Address Successfully Added !</h3>
</c:if>
<c:if test="${msg == 'notAdded' }">
	<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
</c:if>
<form action="addChangeAddressAction" method="post">
	<h3>Enter House Number </h3>
	<input class="input-style" type="text" name="hNo" 
	value=""
		placeholder="Enter House Number" required>
	<hr>

	<h3>Enter Address Line1</h3>
	<input class="input-style" type="text" name="addressLine1" 
	value=""
		placeholder="Enter Address" required>
	<hr>

	<h3>Enter Address Line2</h3>
	<input class="input-style" type="text" name="addressLine2" 
	value=""
		placeholder="Enter Address" required>
	<hr>

	<h3>Enter city</h3>
	<input class="input-style" type="text" name="city" 
	value=""
		placeholder="Enter City" required>
	<hr>
	<h3>Enter State</h3>
	<input class="input-style" type="text" name="state" 
	value=""
		placeholder="Enter State" required>
	<hr>
	<h3>Enter Country</h3>
	<input class="input-style" type="text" name="country" 
	value=""
		placeholder="Enter Country" required>
	<hr>
	<h3>Enter Pincode</h3>
	<input class="input-style" type="text" name="pincode" 
	value=""
		placeholder="Enter Pincode" required>
	<hr>
	<button class="button" type="submit">
		Save <i class='far fa-arrow-alt-circle-right'></i>
	</button>
</form>
</body>
</html>