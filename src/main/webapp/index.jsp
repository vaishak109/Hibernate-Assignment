<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="date"  uri="CurrentDate"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Employee Portal</title>
	<!-- Bootstrap cdn -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<style type="text/css">
		a {
			width: 100%;
		}
		.container {
			margin-top: 12%;
		}
		h2 {
			text-align: center;
		}
	</style>
</head>
<body>
	<date:displaydate/>
	<div class="container">
		<h2>Employee Portal</h2>
		<div class="row">
			<div class="col-md-3 mt-5"></div>
			<div class="col-md-3 mt-5">
				<a class="btn btn-lg btn-success" href = "${pageContext.request.contextPath}/views/employee-form.jsp">Add Employee</a>
			</div>
			<div class="col-md-3 mt-5">
				<a class="btn btn-lg btn-info" href = "${pageContext.request.contextPath}/EmployeeController?action=LIST">View All Employees</a>
			</div>
			<div class="col-md-3"></div>
			<div class="col-md-3"></div>
			<div class="col-md-3 mt-5">
				<a class="btn btn-lg btn-warning" href = "${pageContext.request.contextPath}/EmployeeController?action=EDIT">Edit Employee</a>
			</div>
			<div class="col-md-3 mt-5">
				<a class="btn btn-lg btn-danger" href = "${pageContext.request.contextPath}/EmployeeController?action=DELETE">Delete Employee</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#home").addClass("active")
		});
	</script>
	<!-- Bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>