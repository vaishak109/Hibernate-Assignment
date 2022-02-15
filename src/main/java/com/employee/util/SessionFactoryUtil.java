package com.employee.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SessionFactoryUtil {
		
	private static SessionFactory factory = null;
	
	public static SessionFactory getSessionFactory() {
        try {
        	factory =new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return factory;
	}
}