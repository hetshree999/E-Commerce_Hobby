<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page isELIgnored="false"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		Home <i class="fa fa-institution">     (Welcome, ${email })</i>
	</div>
	<c:if test="${msg == 'Invalid' }">
		<h3 class="alert">No Product Yet</h3>
	</c:if>
	<c:if test = "${msg == 'added' }" >
	<h3 class="alert">Product added successfully!</h3>
</c:if>
<c:if test = "${msg =='alreayThere' }">
	<h3 class="alert">Product already exist in you cart! Quantity
		increased!</h3>
</c:if>
	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col"><i class="fa fa-inr"></i> Price</th>
				<th scope="col">Description</th>
				<!-- <th>Status</th> -->
				    <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${msg == 'Valid' }">
				<c:forEach items="${product}" var="p">
					<tr>
						<td>${p.id}</td>
						<td>${p.name}</td>
						<td>${p.category }</td>
						<td><i class="fa fa-inr"></i>${p.price }</td>
						<td>${p.description }</td>
						  <td><a href="addToCartAction/${p.id }">Add to cart <i class='fas fa-cart-plus'></i></a></td>
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