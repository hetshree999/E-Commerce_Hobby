<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page isELIgnored="false"%>
<%@include file="changeDetailHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Address</title>
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
<!-- <link rel="stylesheet" href="css/changeDetails.css"> -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add Change Address</title>
</head>
<body>
 <c:if test = "${msg == 'updated' }">
	<h3 class="alert">Address Successfully Updated !</h3>
</c:if>
<c:if test = "${msg == 'invalid' }" >
	<h3 class="alert">Some thing Went Wrong! Try Again!</h3> 
</c:if>
<form action="changeAddressAction" method="post">
<h3>Address Id</h3>
	<input class="input-style" type="text" name="addressId" 
	value="${address.addressId }"
		placeholder="Enter Address Id" required>
	<hr>
	<h3>Enter House Number</h3>
	<input class="input-style" type="text" name="hNo" 
	value="${address.hNo }"
		placeholder="Enter House Number" required>
	<hr>

	<h3>Enter Address Line1</h3>
	<input class="input-style" type="text" name="addressLine1" 
	value="${address.addressLine1 }"
		placeholder="Enter Address" required>
	<hr>

	<h3>Enter Address Line2</h3>
	<input class="input-style" type="text" name="addressLine2" 
	value="${address.addressLine2 }"
		placeholder="Enter Address" required>
	<hr>

	<h3>Enter city</h3>
	<input class="input-style" type="text" name="city" 
	value="${address.city }"
		placeholder="Enter City" required>
	<hr>
	<h3>Enter State</h3>
	<input class="input-style" type="text" name="state" 
	value="${address.state }"
		placeholder="Enter State" required>
	<hr>
	<h3>Enter Country</h3>
	<input class="input-style" type="text" name="country" 
	value="${address.country }"
		placeholder="Enter Country" required>
	<hr>
	<h3>Enter Pincode</h3>
	<input class="input-style" type="text" name="pincode" 
	value="${address.pincode }"
		placeholder="Enter Pincode" required>
	<hr>
	<button class="button" type="submit">
		Save <i class='far fa-arrow-alt-circle-right'></i>
	</button>
</form>
</body>
</html>