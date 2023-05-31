<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%> --%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page import="java.util.List"%>
<%@include file="adminHeader.jsp"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Product Edit Product</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		All Products & Edit Products <i class='fab fa-elementor'></i>
	</div>
	<%-- <c:if test = "${msg == 'Valid' }">
	<h3 class="alert">Product Successfully Updated!</h3>
	</c:if> --%>
	 <c:if test = "${msg == 'Invalid' }">
	<h3 class="alert">No Product Yet</h3>
	</c:if> 
	<!-- <h3 class="alert">Some thing went wrong! Try again!</h3> -->

	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col"><i class="fa fa-inr"></i> Price</th>
				<th scope="col">Stock</th>
				<th scope="col">Description</th>
				<!-- <th>Status</th> -->
				<th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
				<th scope="col">Delete <i class='fa fa-trash'></i></th>
			</tr>
		</thead>
		<tbody>
		 <c:if test = "${msg == 'Valid' }">
			<c:forEach items="${product}" var="p">
				<tr>
					<td>${p.id}</td>
					<td>${p.name}</td>
					<td>${p.category }</td>
					<td><i class="fa fa-inr"></i>${p.price }</td>
					<td>${p.stock }</td>
					<td>${p.description }</td>
					<%-- <td>${p.active }</td> --%>
					<td><a href="editProduct/${p.id}">Edit <i class='fas fa-pen-fancy'></i></a></td>
					<td><a href="deleteProduct?/${p.id}">Delete <i class='fas fa-trash'></i></a></td>
				</tr>
			</c:forEach>
			</c:if>
		</tbody>
	</table>
	<br>
	<br>
	<br>

</body>
</html>