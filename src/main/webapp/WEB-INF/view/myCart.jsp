<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page isELIgnored="false"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		My Cart <i class='fas fa-cart-arrow-down'></i>
	</div>

<c:if test = "${msg =='last' }">
	<h3 class="alert">There is only one Quantity! So click on remove!</h3>
</c:if>

<c:if test = "${msg =='inc' }">
	<h3 class="alert">Quantity Increased Successfully!</h3>
</c:if>

<c:if test = "${msg =='dec' }">
	<h3 class="alert">Quantity Decreased Successfully!</h3>
</c:if>

	<table>
		<thead>

			<tr>
				<th scope="col" style="background-color: yellow;">Total: ${grandTotal } <i
					class="fa fa-inr"></i></th>
					<c:if test="${grandTotal > 0 }">
						<th scope="col"><a href="addressPaymentForOrder">Proceed to
						order</a></th>
					</c:if>
			</tr>
		</thead>
		<thead>

			<tr>
				<th scope="col">P.No</th>
				<th scope="col">Product Name</th>
				<!-- <th scope="col">Category</th>
				<th scope="col">Description</th> -->
				<th scope="col"><i class="fa fa-inr"></i> price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Sub Total</th>
				<th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
			</tr>

		</thead>
		<tbody>
			<c:if test="${msg == 'Valid' }">
				<c:forEach items="${cartItem}" var="p">
					<tr>
						<td>${p.productid}</td>
						<td>${p.productName }</td>
						<td><i class="fa fa-inr"></i>${p.price }</td>
						<td><a href="incQuantityAction/${p.productid }"><i
								class='fas fa-plus-circle'></i></a> ${p.quantity } <a href="decQuantityAction/${p.productid }"><i
								class='fas fa-minus-circle'></i></a></td>
						<td><i class="fa fa-inr">${p.quantity * p.price}</i></td>
						<td><a href="removeFromCart/${p.cartItemId }">Remove <i
								class='fas fa-trash-alt'></i></a></td>
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