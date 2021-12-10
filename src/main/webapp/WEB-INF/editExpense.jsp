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
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Edit Expense</title>
</head>
<body>
<div class="container">
	<h1>Edit Expense</h1>
	<form:form action="/expense/${expense.id}/edit" method="post" modelAttribute="expense" class="form">
		<input type="hidden" name="_method" value="put"/>
		
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
			
		<button class="btn btn-primary mt-3" onclick="window.location.href='/';">Submit</button>
	</form:form>	
</div>
</body>
</html>