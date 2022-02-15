<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file = "../header.jsp" %>
<%@taglib prefix="date"  uri="CurrentDate"%>
<date:displaydate/>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 d-flex justify-content-center">
				<div class="details">
					<h3 class="mt-5 mb-3">Employee Details</h3>
					<p>
						<strong>Id: </strong>${employee.getId()}
					</p>
					<p>
						<strong>Name: </strong>${employee.getName()}
					</p>
					<p>
						<strong>Department: </strong>${employee.getDepartment()}
					</p>
					<p>
						<strong>Salary: </strong>₹${employee.getSalary()} / month
					</p>
					<p>
						<strong>Date of Birth: </strong><fmt:formatDate value="${employee.getDOB()}" pattern="dd-MMM-yyyy"/>
					</p>
					<p>
						<strong>Address: </strong>${employee.getAddress()}
					</p>
					<p>
						<strong>Phone No: </strong>${employee.getPhoneNo()}
					</p>
					<a class="btn btn-danger mt-2" href = "${pageContext.request.contextPath}/EmployeeController?action=CONFIRM_DELETE&id=${employee.getId()}">Delete Employee</a>
					<a class="btn btn-primary mt-2" href = "${pageContext.request.contextPath}/index.jsp">Cancel</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file = "../footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#delete").addClass("active")
		});
	</script>
</body>
</html>