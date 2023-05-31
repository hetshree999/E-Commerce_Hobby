<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page isELIgnored="false"%>
<%@include file="adminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Orders Received</title>
<style>
<%@include file="/WEB-INF/resource/css/ordersReceived.css" %>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>

<br>

<table id="customers">
          <tr>
          <th>Email</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <!-- <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th> -->
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
          
         
          </tr>
        
       <c:forEach items="${alist}" var="s">
          <tr>
          <td>${s.email}</td>
            <td>${s.productName }</td>
            <td>${s.quantity }</td>
            <td><i class="fa fa-inr"></i>${s.quantity * s.price }  </td>
               <!--  <td></td>
               <td></td>
                <td></td>
                 <td></td> -->
               <td>${s.orderDate }</td>
               <td>${s.deliverDate }</td>
            </tr>
         </c:forEach>
        </table>
      <br>
      <br>
      <br>

</body>
</html>