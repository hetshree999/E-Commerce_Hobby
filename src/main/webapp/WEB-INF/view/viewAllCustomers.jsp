<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="adminHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Customers</title>
<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 0.5px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #ccc;
	color: black;
}

.alert {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		All Customers <i class='fas fa-eye'></i>
	</div>
	<c:if test = "${msg =='noUser' }">
	<h1>No user till now</h1>
	</c:if>
	<table id="customers">
	<c:if test="${msg == 'valid' }">
				<c:forEach items="${user}" var="p">
		<tr>
			<th>Name</th>
			<th>Email Address</th>
			<th>Mobile Number</th>
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>Country</th>
		</tr>
				<tr>
					<td>${p.name}</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				</c:forEach>
				</c:if>
	</table>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page isELIgnored="false"%>
<%@include file="adminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Customer</title>
<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 0.5px solid #ddd;
	padding: 8px;
	text-align: left;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #ccc;
	color: black;
}

.alert {
	color: yellow;
	text-align: center;
}
	<%-- <%@include file="/WEB-INF/resource/css/viewAllCustomers.css" %> --%>
</style>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		All Customers <i class='fas fa-eye'></i>
	</div>
	<c:if test = "${msg =='noUser' }">
	<h1>No user till now</h1>
	</c:if>
	<table id="customers">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email Address</th>
			<th>Mobile Number</th>
		</tr>
		<c:if test="${msg == 'valid' }">
			<c:forEach items="${user}" var="userItem">
				<tr>
					<td>${userItem.id}</td>
					<td>${userItem.name}</td>
					<td>${userItem.email}</td>
					<td>${userItem.mobileNumber}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>