package com.employee.controller;

import jakarta.servlet.RequestDispatcher;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import com.employee.dao.EmployeeDAO;
import com.employee.dao.EmployeeDAOImpl;
import com.employee.model.Employee;

/**
 * Servlet implementation class EmployeeController
 */
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	RequestDispatcher dispatcher = null;
	EmployeeDAO employeeDAO = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeController() {
        super();
        employeeDAO = new EmployeeDAOImpl();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if(action == null) {
			action = "LIST";
		}
		switch(action) {
			
			case "LIST":
				browseEmployees(request, response);
				break;
				
			case "EDIT":
				editEmployee(request, response);
				break;
				
			case "DELETE":
				deleteEmployee(request, response);
				break;
			case "CONFIRM_DELETE":
				removeEmployee(request, response);
			default:
				browseEmployees(request, response);
				break;
				
		}
	}
	
	private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dispatcher = request.getRequestDispatcher("/views/search-employee.jsp");
		dispatcher.forward(request, response);
	}
	
	private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id == null || id.isEmpty()) {
			request.setAttribute("action", "EDIT");
			searchEmployee(request, response);
		}
		else {
			int empId = Integer.parseInt(id);
			Employee employee = employeeDAO.getEmployee(empId);
			if(employee == null) {
				request.setAttribute("status", "NOT_FOUND");
				request.setAttribute("action", "EDIT");
				dispatcher = request.getRequestDispatcher("/views/status.jsp");
				dispatcher.forward(request, response);
			} else {
				List<String> deptList = Arrays.asList("Accounting", "Design", "Engineering", "HR", "Marketing", "Sales");
				request.setAttribute("deptList", deptList);
				request.setAttribute("employee", employee);
				dispatcher = request.getRequestDispatcher("/views/employee-form.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
	
	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id == null || id.isEmpty()) {
			request.setAttribute("action", "DELETE");
			searchEmployee(request, response);
		}
		else {
			int empId = Integer.parseInt(id);
			Employee employee = employeeDAO.getEmployee(empId);
			if(employee == null) {
				request.setAttribute("status", "NOT_FOUND");
				request.setAttribute("action", "DELETE");
				dispatcher = request.getRequestDispatcher("/views/status.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("employee", employee);
				dispatcher = request.getRequestDispatcher("/views/delete-employee.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
	
	private void removeEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(employeeDAO.deleteEmployee(id)) {
			request.setAttribute("status", "DELETE_SUCCESS");
			request.setAttribute("msg", "Employee Deleted Sucessfully!");
			dispatcher = request.getRequestDispatcher("/views/status.jsp");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("status", "DELETE_FAILED");
			request.setAttribute("msg", "Delete Operation Failed!");
			request.setAttribute("action", "DELETE");
			dispatcher = request.getRequestDispatcher("/views/status.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	private void browseEmployees(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Employee> theList = employeeDAO.getEmployees();
		request.setAttribute("list", theList);
		dispatcher = request.getRequestDispatcher("/views/employee-list.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Employee e = new Employee();
		e.setName(request.getParameter("name"));
		e.setDepartment(request.getParameter("dept"));
		e.setSalary(Double.valueOf(request.getParameter("salary")));
		e.setAddress(request.getParameter("address"));
		e.setPhoneNo(Long.valueOf(request.getParameter("phone")));
		e.setDOB(Date.valueOf(request.getParameter("dob")));
		if(id == null || id.isEmpty()) {
			if(employeeDAO.saveEmployee(e)) {
				request.setAttribute("status", "ADD_SUCCESS");
				request.setAttribute("msg", "Employee Added Sucessfully!");
				dispatcher = request.getRequestDispatcher("/views/status.jsp");
				dispatcher.forward(request, response);
			}else {
				request.setAttribute("status", "ADD_FAILED");
				dispatcher = request.getRequestDispatcher("/views/status.jsp");
				dispatcher.forward(request, response);
			}
		}else {	
			e.setId(Integer.parseInt(request.getParameter("id")));
			if(employeeDAO.updateEmployee(e)) {
				request.setAttribute("status", "EDIT_SUCCESS");
				request.setAttribute("msg", "Employee Updated Sucessfully!");
				dispatcher = request.getRequestDispatcher("/views/status.jsp");
				dispatcher.forward(request, response);
			}
			else {
				request.setAttribute("status", "EDIT_FAILED");
				request.setAttribute("msg", "Edit Operation Failed!");
				request.setAttribute("action", "EDIT");
				dispatcher = request.getRequestDispatcher("/views/status.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
