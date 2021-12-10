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
<title>PokeBook</title>
</head>
<body>
	<div class="container">
		<h1>PokeBook</h1>
		<div class="container">
			<div class="row">
				<div class="col">Expense</div>
				<div class="col">Vendor</div>
				<div class="col">Amount</div>
				<div class="col">Actions</div>
				<div class="col"></div>
			</div>
			<c:forEach var="expense" items="${expenses}">
				<div class="row mb-3">
					<div class="col"><a href="/expense/${expense.id}">${expense.name}</a></div>
					<div class="col">${expense.vendor}</div>
					<div class="col">$${expense.amount}</div>
					<div class="col"><a href="/expense/${expense.id}/edit">edit</a></div>
					<div class="col">
						<form action="/expense/${expense.id}/delete" method="post">
							<input type="hidden" name="_method" value="delete" />
							<button class="btn btn-danger"> Delete</button>
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="container">
		<h3>Track an expense:</h3>
		<form:form action="/" method="post" modelAttribute="newExpense" class="form">
			<form:label path="name" class="form-label">Expense Name:</form:label>
			<form:errors path="name" class="text-danger"></form:errors>
			<form:input path="name" type="text" class="form-control"/>
			
			<form:label path="vendor" class="form-label">Vendor:</form:label>
			<form:errors path="vendor" class="text-danger"></form:errors>
			<form:input path="vendor" type="text" class="form-control"/>
			
			<form:label path="amount" class="form-label">Amount:</form:label>
			<form:errors path="amount" class="text-danger"></form:errors>
			<form:input path="amount" type="number" class="form-control"/>
			
			<form:label path="description" class="form-label">Description:</form:label>
			<form:errors path="description" class="text-danger"></form:errors>
			<form:textarea path="description" class="form-control"></form:textarea>
			
			<button class="btn btn-primary mt-3">Submit</button>
		</form:form>
	</div>
</body>
</html>