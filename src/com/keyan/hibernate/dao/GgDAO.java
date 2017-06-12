package com.keyan.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.keyan.hibernate.form.Gg;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

public class GgDAO {

	public void insert(Gg tbManager) {
		Session session = null;
		Transaction tx = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			session.save(tbManager);
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

	public void delete(Integer id) {
		Session session = null;
		Transaction tx = null;
		Gg tbManager = null;

		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			tbManager = (Gg) session.get(Gg.class, id);
			session.delete(tbManager);
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
	// query
	public List query() {

		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session.createQuery("from Gg");
			list = query.list();
			query = null;
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

	// query
	public List query1() {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session.createQuery("from Gg order by shijian");
			query.setFirstResult(0);
			query.setMaxResults(1);
			list = query.list();
			query = null;
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
}
