<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Employee Site</title>
	<!-- Bootstrap cdn -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Employee Portal</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav ms-auto">
	        <li class="nav-item">
	          <a class="nav-link" id="home" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" id="add" href="${pageContext.request.contextPath}/views/employee-form.jsp">Add Employee</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" id="edit" href="${pageContext.request.contextPath}/EmployeeController?action=EDIT">Edit</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" id="delete" href="${pageContext.request.contextPath}/EmployeeController?action=DELETE">Delete</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" id="all" href="${pageContext.request.contextPath}/EmployeeController?action=LIST">View All</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>