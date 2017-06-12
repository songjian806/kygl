package com.keyan.hibernate.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.keyan.hibernate.form.Project;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

public class ShenpiDao {
	public boolean insert(Project tbUser) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			session.save(tbUser);
			tx.commit();
			return true;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
}