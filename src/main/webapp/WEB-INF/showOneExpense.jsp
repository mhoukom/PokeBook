<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Expense Details</title>
</head>
<body>
<div class="container">
	<h1>Expense Details</h1>
	<table class="table table-striped">
		<tr>
			<th>Expense</th>
			<th>Vendor</th>
			<th>Amount</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>${expense.name}</td>
			<td>${expense.vendor}</td>
			<td>$${expense.amount}</td>
			<td>${expense.description}</td>
		</tr>
	</table>
	<a href="/">Go Back</a>
</div>
</body>
</html>