<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Address Payment for order</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script>
if(window.history.forward(1) != null)
	window.history.forward(1);
</script>
<style>
    body {
  font-family: "Open Sans", sans-serif;
  line-height: 1.25;
  background-color: #0080FF;
}

a
{
	text-decoration: none;
}
.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
}

table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  /*margin-left: 5%;*/
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  
  table td::before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}

/*Header Css*/
* {box-sizing: border-box;}
    
    body {
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
    }
    

/*footer*/
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color:#ccc;
   color:black;
   text-align: center;
}

.input-style {
  width: 90%;
  padding: 12px 20px;
  margin-left:5%;
  box-sizing: border-box;
  border: none;
  background-color:white;
  color: black;
  font-size: 16px;
}

input[type=text]:focus, textarea:focus,button:focus{
  outline: 4px solid orange;
  background-color:rgb(224, 255, 219);     /* oranges! yey */
}

.button {
  background-color: aqua;
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
  margin-left:5%;
  font-size: 16px;
  width: 90%;
   border-radius: 25px;
}

.button:hover {
  background-color: #555555;
  color: white;
}

hr
{
	width: 90%
}
h3
{
	text-align: center;
	color: white;
}
.alert
{
	color:yellow;
}

.profile-style
{
	border-style: dotted;
	
}

.left-div
{
	width: 50%;
	display:inline-block;
}

.right-div
{
	float:right;
	width: 50%;
	display:inline-block;
}
</style>
</head>
<body>
<br>
<table>
<thead>

          <tr>
          <th scope="col"><a href=""><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: ${grandTotal }<i class="fa fa-inr"></i> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="l">
          <tr>
           <td> ${l.productid}</td>
            <td>${l.productName }</td>
            <td><i class="fa fa-inr"></i>${l.price } </td>
            <td>${l.quantity } </td>
            <td><i class="fa fa-inr"></i>${l.quantity * l.price } </td>
            </tr>
         </c:forEach>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction" method="post">
<div class="left-div">
 <h3>Enter Home Number</h3>
<input class="input-style" type="text" name="hNo" 
value="<c:if test = "${msg == 'address' }">${address.hNo }</c:if>" 
placeholder="Enter Home Number" required>
 </div>
 <div class="right-div">
 <h3>Enter Address Line1</h3>
<input class="input-style" type="text" name="addressLine1" 
value="<c:if test = "${msg == 'address' }">${address.addressLine1 }</c:if>" 
placeholder="Enter Address Line1" required>
 </div>
 <div class="left-div">
 <h3>Enter Address Line2</h3>
<input class="input-style" type="text" name="addressLine2" 
value="<c:if test = "${msg == 'address' }">${address.addressLine2 }</c:if>" 
placeholder="Enter Address Line2" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" 
value="<c:if test = "${msg == 'address' }">${address.city }</c:if>" 
placeholder="Enter City" required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<c:if test = "${msg == 'address' }">${address.state }</c:if>" placeholder="Enter Country" required>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<c:if test = "${msg == 'address' }">${address.country }</c:if>" placeholder="Enter Country" required>
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<!-- <div class="left-div">
<h3>Select way of Payment</h3>
 
</div>

<div class="right-div">
<h3>Pay online on this btechdays@pay.com</h3>

<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div> -->
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobileNumber" value="${mNo }" placeholder="Enter Mobile Number" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Procced to generate Bill and Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>

      <br>
      <br>
      <br>

</body>

</html>