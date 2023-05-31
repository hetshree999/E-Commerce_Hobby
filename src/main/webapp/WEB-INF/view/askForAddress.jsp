<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="changeDetailHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
	 margin-left: 5%; 
	 margin-top: 10%;
	font-size: 16px;
	width: 90%;
}

.button:hover {
	background-color: #555555;
	color: white;
}
</style>
<meta charset="ISO-8859-1">
<title>Add or Update Address</title>
</head>
<body>
	<button class="button">
		<a href="addChangeAddress">Add New Address</a>
	</button>
	<c:if test="${msg == 'valid' }">
	<h3 class="alert">Address Successfully Added !</h3>
</c:if>
	<button class="button">
		<a href="changeAddress">Update</a>
	</button>
</body>
</html>