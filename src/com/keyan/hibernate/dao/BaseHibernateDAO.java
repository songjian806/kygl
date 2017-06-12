package com.keyan.hibernate.dao;

import org.hibernate.Session;

import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;


/**
 * Data access object (DAO) for domain model
 * @author MyEclipse Persistence Tools
 */
public class BaseHibernateDAO implements IBaseHibernateDAO {
	
	public Session getSession() {
	
		return HibernateSessionFactory.getSession();
	}
	
}