<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-color: #0080FF;
	font: 1em Helvetica;
}

#container {
	width: 840px;
	margin: 25px auto;
	margin-top: 50px;
}

.whysign {
	float: left;
	background-color: white;
	width: 480px;
	height: 525px;
	border-radius: 0 5px 5px 0;
	padding-top: 20px;
	padding-right: 20px;
}

.whysignLogin {
	float: left;
	background-color: white;
	width: 480px;
	height: 298px;
	border-radius: 0 5px 5px 0;
	padding-top: 20px;
	padding-right: 20px;
}

.whyforgotPassword {
	float: left;
	background-color: white;
	width: 480px;
	height: 470px;
	border-radius: 0 5px 5px 0;
	padding-top: 20px;
	padding-right: 20px;
}

.signup {
	float: left;
	width: 300px;
	padding: 30px 20px;
	background-color: white;
	text-align: center;
	border-radius: 5px 0 0 5px;
}

[type=text], [type=email], [type=number], [type=password], select,
	option {
	display: block;
	margin: 0 auto;
	width: 80%;
	border: 0;
	border-bottom: 1px solid rgba(0, 0, 0, .2);
	height: 45px;
	line-height: 45px;
	margin-bottom: 10px;
	font-size: 1em;
	color: black;
}

[type=submit] {
	margin-top: 25px;
	width: 80%;
	border: 0;
	background-color: #0080FF;
	border-radius: 5px;
	height: 50px;
	color: white;
	font-weight: 400;
	font-size: 1em;
}

[type='text']:focus {
	outline: none;
	border-color: #53CACE;
}

h1 {
	color: red;
	font-weight: 900;
	font-size: 2.5em;
}

/* p {
	color: rgba(0, 0, 0, .6);
	font-size: 1.2em;
	margin: 50px 0 50px 0;
} */
span {
	font-size: .75em;
	background-color: white;
	padding: 2px 5px;
	color: rgba(0, 0, 0, .6);
	border-radius: 2px;
	box-shadow: 1px 1px 1px rgba(0, 0, 0, .3);
	margin: 5px;
}

span:hover {
	color: #53CACE;
}

p:nth-of-type(2) {
	font-size: 1em;
}
</style>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="loginAction" method="post">
				<input type="email" name="email" placeholder="Enter Email" required>
				<input type="password" name="password" placeholder="Enter Password"
					required> <input type="submit" value="Login">
			</form>
			<h2>
				<a href="signup">SignUp</a>
			</h2>
			<!-- <h2>
				<a href="forgotPassword">Forgot Password?</a>
			</h2> -->
		</div>
		<div class='whysignLogin'>
			<c:if test = "${msg == 'Invalid' }">
			<h1>Incorrect Username or Password</h1>
			</c:if>
			<!-- <h1>Some thing Went Wrong! Try Again !</h1> -->

			<h2>Online Shopping</h2>
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>
	</div>
</body>
</html>