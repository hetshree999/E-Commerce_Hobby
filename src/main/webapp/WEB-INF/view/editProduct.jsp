<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="adminHeader.jsp"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<style>
body {
	font-family: "Open Sans", sans-serif;
	line-height: 1.25;
	background-color: #0080FF;
}

a {
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

table th, table td {
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
		clip: rect(0, 0, 0, 0);
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
* {
	box-sizing: border-box;
}

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
	background-color: #ccc;
	color: black;
	text-align: center;
}

.input-style {
	width: 90%;
	padding: 12px 20px;
	margin-left: 5%;
	box-sizing: border-box;
	border: none;
	background-color: white;
	color: black;
	font-size: 16px;
}

input[type=text]:focus, textarea:focus, button:focus {
	outline: 4px solid orange;
	background-color: rgb(224, 255, 219); /* oranges! yey */
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
	margin-left: 5%;
	font-size: 16px;
	width: 90%;
	border-radius: 25px;
}

.button:hover {
	background-color: #555555;
	color: white;
}

hr {
	width: 90%
}

h3 {
	text-align: center;
	color: white;
}

.alert {
	color: yellow;
}

.profile-style {
	border-style: dotted;
}

.left-div {
	width: 50%;
	display: inline-block;
}

.right-div {
	float: right;
	width: 50%;
	display: inline-block;
}

.back {
	color: white;
	margin-left: 2.5%
}
</style>
</head>
<body>
	<h2>
		<a class="back" href="/hobby_jt/allProductEditProduct"><i
			class='fas fa-arrow-circle-left'> Back</i></a>
	</h2>

	<form action="/hobby_jt/addNewProductAction"
		method="post">
		<div>
			<h3>Id</h3>
			<input class="input-style" type=text " name="id"
				value="${product.id }">
		</div>
		<div class="left-div">
			<h3>Enter Name</h3>
			<input class="input-style" type="text" name="name"
				value="${product.name }" required>
			<hr>
		</div>

		<div class="right-div">
			<h3>Enter Category</h3>
			<input class="input-style" type="text" name="category"
				value="${product.category }" required>
			<hr>
		</div>

		<div class="left-div">
			<h3>Enter Price</h3>
			<input class="input-style" type="number" name="price"
				value="${product.price }" required>
			<hr>
		</div>

		<div class="right-div">
			<h3>Enter Stock</h3>
			<input class="input-style" type="number" name="stock"
				value="${product.stock }" required>
			<hr>
		</div>

		<div>
			<h3>Enter Description</h3>
			<input class="input-style" type="text" name="description"
				value="${product.description }" required>
			<hr>
		</div>


		<button class="button">
			Save <i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>

</body>
<br>
<br>
<br>
</body>
</html>