<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
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
	height: 527px;
	border-radius: 0 5px 5px 0;
	padding-top: 20px;
	padding-right: 20px;
}

.whysignLogin {
	float: left;
	background-color: white;
	width: 480px;
	height: 346px;
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
<title>Sign Up</title>
</head>
<body>

	<div id='container'>
		<div class='signup'>
			<form action="saveuser" method="post">
				<input type="text" name="name" placeholder="Enter Name" required>
				<input type="email" name="email" placeholder="Enter Email" required>
				<input type="number" name="mobileNumber"
					placeholder="Enter Mobile Number" required> <select
					name="securityQuestion" required>
					<option value="What was your first car?">What was your
						first car?</option>
					<option value="What is the name of your first pet?">What
						is the name of your first pet?</option>
					<option value="What elementary school did you attend?">What
						elementary school did you attend?</option>
					<option value="What is the name of the town where you were born?">What
						is the name of the town where you were born?</option>
				</select> <input type="text" name="answer" placeholder="Enter Answer"
					required> <input type="password" name="password"
					placeholder="Enter Password" required> <input type="submit"
					value="signup">
			</form>
			<h2>
				<a href="login">Login</a>
			</h2>
		</div>
		<div class='whysign'>
			<c:if test="${msg == 'Invalid' }">
				<h1>Email id already exits</h1>
			</c:if>
			<!-- <h1>Successfully Updated</h1>


			<h1>Some thing Went Wrong! Try Again !</h1> -->

			<h2>Online Shopping</h2>
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>
	</div>


</body>
</html>