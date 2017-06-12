package com.keyan.hibernate.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.keyan.hibernate.form.Pppeople;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

public class PppeopleDao {

	public void insert(Pppeople pppeople) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.save(pppeople);
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

	public Pppeople queryId(Integer id) { // 把project1改成project1
		Session session = null;
		Transaction tx = null;
		Pppeople pppeople = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			pppeople = (Pppeople) session.get(Pppeople.class, id);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return pppeople;
	}

	public List findall() {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Pppeople");
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

	public List queryPid(Integer id) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Pppeople where pid='" + id
					+ "' ");
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

	public List queryPpusernum(String id) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Pppeople where ppusernum='"
					+ id + "' ");
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

	public void delete(Integer id) {
		Session session = null;
		Transaction tx = null;
		Pppeople pppeople = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			pppeople = (Pppeople) session.get(Pppeople.class, id);
			session.delete(pppeople);
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

	public void delete(String id) {
		Session session = null;
		Transaction tx = null;
		Pppeople pppeople = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createSQLQuery("delete from pppeople where pid='" + id
							+ "' ");
			query.executeUpdate();
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

	public void update1(Pppeople pppeople) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(pppeople);
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
