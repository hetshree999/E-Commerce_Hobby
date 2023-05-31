<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
<style>
.input-style {
  width: 60%;
  padding: 12px 20px;
  margin-left:20%;
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

textarea
{
	height: 250px;
	font-size: 16px;
}

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
  margin-left:20%;
  font-size: 16px;
}

.button:hover {
  background-color: #555555;
  color: white;
}

hr
{
	width: 60%
}

h3
{
	text-align: center;
	color: white;
}

</style>
</head>
<body>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>

<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>

<h3 style="text-align:center; color:yellow">Some thing Went Wrong! Try Again!</h3>
<form action="messageUsAction" method="post">
<input class="input-style" type="text" name="subject" placeholder="Subject" required>
<hr>
<textarea class="input-style" name="body" placeholder="Enter Your Message"></textarea>
<hr>
<button class="button" type="submit">Send <i class="far fa-arrow-alt-circle-right"></i></button>
</form>

<br><br><br>
</body>
</html>