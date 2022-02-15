package com.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.employee.util.SessionFactoryUtil;
import com.employee.model.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class EmployeeDAOImpl implements EmployeeDAO{
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;
	SessionFactory factory = null;
    Session session = null;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> getEmployees() {
		
		List<Employee> empList = null;
		Employee employee = null;
		
		try {
			factory = SessionFactoryUtil.getSessionFactory();
			session= factory.openSession();
			empList = (List<Employee>)session.createQuery("from Employee", Employee.class).getResultList();
			factory.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return empList;
	}
	
	@Override
	public boolean saveEmployee(Employee emp) {
		boolean flag = false;
		try {
			// Create a session factory to get a session object to perform the operations
			factory = SessionFactoryUtil.getSessionFactory();
			session= factory.openSession();			 // create a Student Object 
			System.out.println("Creating a emp Object !!");
			 
			// start the transaction 
			session.beginTransaction();
			// Save the Employee Object 
			System.out.println("Saving the emp Object ");
			session.save(emp);
			// commit the Transaction
			session.getTransaction().commit(); 
			System.out.println("Object saved into Table !!");
			factory.close();
			flag = true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return flag;
	}
	
	@Override
	public Employee getEmployee(int id) {
		Employee employee = null;
		try {
			factory = SessionFactoryUtil.getSessionFactory();
			session= factory.openSession();			 // create a Student Object 
			System.out.println("Retrieving a emp Object !!");
			employee = (Employee)session.get(Employee.class, id);
			// start the transaction 
			factory.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return employee;
	}
	
	@Override
	public boolean updateEmployee(Employee emp) {
		boolean flag = false;
		try {
			factory = SessionFactoryUtil.getSessionFactory();
			session= factory.openSession();			 // create a Student Object 
			System.out.println("Updating a emp Object !!");
			// start the transaction 
			session.beginTransaction();
			session.update(emp);
			session.getTransaction().commit();
			factory.close();
			flag = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	@Override
	public boolean deleteEmployee(int id) {
		boolean flag = false;
		try {
			factory = SessionFactoryUtil.getSessionFactory();
			session= factory.openSession();			 // create a Student Object 
			System.out.println("Updating a emp Object !!");
			// start the transaction 
			session.beginTransaction();
			Employee emp = session.get(Employee.class, id);
			if(emp != null)
				session.delete(emp);
			session.getTransaction().commit();
			factory.close();
			flag = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
		
}