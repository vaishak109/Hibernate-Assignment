<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../header.jsp" %>
<%@taglib prefix="date"  uri="CurrentDate"%>
<date:displaydate/>
	<div class="container">
  		<div class="row">
  			<div class="col-md-4"></div>
  			<div class="col-md-4">
  				<form action = "${pageContext.request.contextPath}/EmployeeController" method="POST">
	  				<c:choose>
		  				<c:when test="${employee == null }">
		  					<h3 class="form-heading mt-5 mb-3">Add Employee</h3>
		  				</c:when>
		  				<c:otherwise>
		  					<h3 class="form-heading mt-5 mb-3">Edit Employee</h3>
		  				  	<div class="form-floating mb-3">
								<input type="text" class="form-control" id="id" name="id" placeholder="Employee Id" disabled value="${employee.getId()}">
								<label for="id">Employee Id</label>
							</div>
		  				</c:otherwise>
	  				</c:choose>
	  				<input type = "hidden" name = "id" value = "${employee.id}"/>
	  				<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="name" name="name" placeholder="Employee Name" value="${employee.getName()}" required>
					  <label for="name">Employee Name</label>
					</div>
					<div class="form-floating mb-3">
					  <input type="number" class="form-control" id="salary" name="salary" placeholder="Salary in Rupees" value="${employee.getSalary()}" required min=10000>
					  <label for="salary">Salary in Rupees</label>
					</div>
					<div class="form-floating mb-3">
					  <select name="dept" class="form-control" id="dept" required>
					  	<c:choose>
					  		<c:when test="${employee == null}">
					  			<option value="">--Please choose an option--</option>
							    <option value="Accounting">Accounting</option>
							    <option value="Design">Design</option>
							    <option value="Engineering">Engineering</option>
							    <option value="HR">HR</option>
							    <option value="Marketing">Marketing</option>
							    <option value="Sales">Sales</option>
					  		</c:when>
						  	<c:otherwise>
						  		<c:forEach items="${deptList}" var="dept">
						  			<c:choose>
						  				<c:when test="${employee.getDepartment() == dept}">
						  					<option value="${dept}" selected>${dept}</option>
						  				</c:when>
						  				<c:otherwise>
						  					<option value="${dept}">${dept}</option>
						  				</c:otherwise>
						  			</c:choose>
						  		</c:forEach>
						  	</c:otherwise>
						  </c:choose>	
					  </select>
					  <label for="dept">Department</label>
					</div>
					<div class="form-floating mb-3">
					  <textarea class="form-control" placeholder="Address" id="address" name="address" required>${employee.getAddress()}</textarea>
					  <label for="address">Address</label>
					</div>
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" value="${employee.getPhoneNo()}" required pattern="^[7-9][0-9]{9}$">
					  <label for="phone">Phone</label>
					</div>
					<div class="form-floating mb-3">
					  <input type="date" class="form-control" id="phone" name="dob" placeholder="dob" value="${employee.getDOB()}" required>
					  <label for="dob">Date of Birth</label>
					</div>
					<button class="btn btn-primary" type="submit">Submit</button>
  				</form>
  			</div>
  		</div>
  	</div>
 	 <%@ include file = "../footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#add").addClass("active")
		});
	</script>
</body>
</html>