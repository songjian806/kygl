package com.keyan.hibernate.dao;

import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.keyan.hibernate.form.Keyanuser;
import com.keyan.hibernate.form.Project;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

public class Shenpi21Dao {

	public List query() {
		Session session = null;
		Transaction tx = null;
		Keyanuser keyanUser = new Keyanuser();
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session.createQuery("from Project");
			list = query.list();
			tx.commit();

		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return list;
	}
	// delete
	public void deleteById(Integer id) {
		Session session = null;
		Transaction tx = null;
		Project tbUser = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			tbUser = (Project) session.get(Project.class, id);
			session.delete(tbUser);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	public void shenpi(String id) {
		Session session = null;
		Transaction tx = null;
		Project project = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			project = (Project) session.get(Project.class, new Integer(id));
			project.setPsp1("1");
			session.saveOrUpdate(project);
			tx.commit();
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
