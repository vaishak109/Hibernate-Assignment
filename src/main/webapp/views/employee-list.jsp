<%@ include file = "../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="date"  uri="CurrentDate"%>
<date:displaydate/>
	<div class="container">
		<h3 class="mt-5">Employee List</h3>
		<table class = "table table-striped table-hover table-bordered mt-5" id="datatable">
			<thead>
				<tr class = "table-primary">
					<th>Id</th>
					<th>Name</th>
					<th>Department</th>
					<th>Salary</th>
					<th>Date of Birth</th>
					<th>Address</th>
					<th>Phone No</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="employee">
					<tr>
						<td>${employee.getId()}</td>
						<td>${employee.getName()}</td>
						<td>${employee.getDepartment()}</td>
						<td>${employee.getSalary()}</td>
						<td><fmt:formatDate value="${employee.getDOB()}" pattern="dd-MMM-yyyy"/></td>
						<td>${employee.getAddress()}</td>
						<td>${employee.getPhoneNo()}</td>
						<td> 
							<a href = "${pageContext.request.contextPath}/EmployeeController?action=EDIT&id=${employee.id}">Edit</a> 
							| 
							<a href = "${pageContext.request.contextPath}/EmployeeController?action=DELETE&id=${employee.id}">Delete</a> 
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file = "../footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#all").addClass("active")
		});
	</script>
</body>
</html>