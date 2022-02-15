package com.employee.dao;

import com.employee.model.Employee;
import java.util.List;

public interface EmployeeDAO {
	boolean saveEmployee(Employee employee);
	Employee getEmployee(int id);
	List<Employee> getEmployees();
	boolean updateEmployee(Employee employee);
	boolean deleteEmployee(int id);
}