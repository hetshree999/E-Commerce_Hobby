<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*" %>
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
	<%@include file="/WEB-INF/resource/css/bills.css" %> 
</style>
<title>Bill</title>
</head>
<body>
<%
Date currentDate = new Date();
Calendar c = Calendar.getInstance();
c.setTime(currentDate); 
Date currentDate1 = c.getTime();
c.add(Calendar.DATE, 7);
Date currentDatePlusSeven = c.getTime();
%>
<h3>Online shopping Bill (Hobbies)</h3>
<hr>
<div class="left-div"><h3>Name: ${user.name } </h3></div>
<div class="right-div-right"><h3>Email: ${user.email } </h3></div>
<div class="right-div"><h3>Mobile Number: ${user.mobileNumber } </h3></div>  

<div class="left-div"><h3>Order Date:  <%= currentDate1%></h3></div>
 <div class="right-div-right"><h3>Address Line1: ${address.addressLine1 } </h3></div> 
<div class="right-div"><h3>Expected Delivery: <%=currentDatePlusSeven %> </h3></div> 

 <div class="left-div"><h3>Address Line2: ${address.addressLine2 } </h3></div>
<div class="right-div-right"><h3>City: ${address.city } </h3></div> 
<!-- <div class="right-div"><h3>Address:  </h3></div>  -->

<div class="left-div"><h3>State: ${address.state } </h3></div>
<div class="right-div-right"><h3>Country: ${address.country } </h3></div>  

<hr>


	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%-- <c:forEach items="${orderItem } var="o"> --%>
  	<c:forEach items="${orderItem}" var="p">
  <tr>
    <td>${p.productid }</td>
    <td>${p.productName }</td>
    <td>${p.price }</td>
    <td>${p.quantity }</td>
     <td>${p.quantity * p.price }</td>
  </tr>
</c:forEach>
  <tr>

</table>
<h3>Total: ${grandTotal }</h3>
<a href="continueShopping"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>

</body>

</html>