<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Addresses</title>
</head>
<body>
	<h1>Welcome to view address</h1>
	<c:forEach items="${add}" var="a">
	${a.hNo}
	</c:forEach>
</body>
</html>