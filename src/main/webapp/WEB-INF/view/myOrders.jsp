<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
              
          </tr>
        </thead>
        <tbody>
<c:forEach items="${acart }" var="a">
          <tr>
            <td>${a.productid}</td>
            <td>${a.productName }</td>
            <td><i class="fa fa-inr"></i>${a.price } </td>
            <td>${a.quantity }</td>
            <td><i class="fa fa-inr">${a.quantity * a.price }</i> </td>
             <td></td>
              <td></td>
            </tr>
         </c:forEach>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>