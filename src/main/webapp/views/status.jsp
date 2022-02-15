<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../header.jsp" %>
<%@taglib prefix="date"  uri="CurrentDate"%>
<date:displaydate/>
	<div class="d-flex justify-content-center mt-5">
		<div class="status mt-5">
			<c:choose>
				<c:when test="${status == 'NOT_FOUND'}">
					<p>Employee with the given id not found!</p>
					<div class="text-center">
						<a class="btn btn-primary" href = "${pageContext.request.contextPath}/EmployeeController?action=${action}">Try Again</a>
					</div>
				</c:when>
				<c:when test="${status == 'DELETE_SUCCESS' || status == 'EDIT_SUCCESS' || status == 'ADD_SUCCESS'}">
					<p>${msg}</p>
					<div class="text-center">
						<a class="btn btn-primary" href = "${pageContext.request.contextPath}/index.jsp">Go to Home</a>
					</div>
				</c:when>
				<c:when test="${status == 'EDIT_FAILED' || status == 'DELETE_FAILED'}">
					<p>Edit Operation Failed!</p>
					<div class="text-center">
						<a class="btn btn-primary" href = "${pageContext.request.contextPath}/EmployeeController?action=${action}">Try Again</a>
					</div>
				</c:when>
				<c:when test="${status == 'ADD_FAILED'}">
					<p>Employee Not Added!</p>
					<div class="text-center">
						<a class="btn btn-primary" href = "${pageContext.request.contextPath}/views/employee-form.jsp">Try Again</a>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
<%@ include file = "../footer.jsp" %>