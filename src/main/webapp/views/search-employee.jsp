<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../header.jsp" %>
<%@taglib prefix="date"  uri="CurrentDate"%>
<date:displaydate/>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<c:choose>
					<c:when test="${action == 'EDIT'}">
						<h3 class="mt-5 mb-3">Edit Employee</h3>
					</c:when>
					<c:when test="${action == 'DELETE'}">
						<h3 class="mt-5 mb-3">Delete Employee</h3>
					</c:when>
				</c:choose>
				<form action="${pageContext.request.contextPath}/EmployeeController">
					<div class="form-floating mb-3">
						<input type="hidden" id="action" name="action" value="${action}">
					  	<input type="text" class="form-control" id="id" name="id" placeholder="Employee Id">
					  	<label for="id">Employee Id</label>
					</div>
					<button class="btn btn-primary" type="submit">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file = "../footer.jsp" %>
	<c:if test="${action == 'EDIT'}">
		<script type="text/javascript">
			$(document).ready(function(){
				$("#edit").addClass("active")
			});
		</script>
	</c:if>
	<c:if test="${action == 'DELETE'}">
		<script type="text/javascript">
			$(document).ready(function(){
				$("#delete").addClass("active")
			});
		</script>
	</c:if>
</body>
</html>