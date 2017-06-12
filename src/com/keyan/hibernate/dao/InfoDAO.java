package com.keyan.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.keyan.hibernate.form.Info;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

public class InfoDAO {

	public void insert(Info tbManager) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();// ������
			tx = session.beginTransaction();// ��������
			tx.begin();
			session.save(tbManager);// Session��save()����ʹһ����ʱ����ת��Ϊ�־û�����
			tx.commit();// �ύ����
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();// ����ʧ�ܺ�ָ�֮ǰ�������
			}
			throw e;
		} finally {

			HibernateSessionFactory.closeSession();// �ر�����
		}
	}

	public void delete(Integer id) {
		Session session = null;
		Transaction tx = null;
		Info tbManager = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();

			tbManager = (Info) session.get(Info.class, id);

			session.delete(tbManager);

			tx.commit();

		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();// ����ʧ�ܺ�ָ�֮ǰ�������
			}
			throw e;
		} finally {

			HibernateSessionFactory.closeSession();
		}

	}

	// query
	public List queryform(String name) {

		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session
					.createQuery("from Info where infoform=? order by infotime desc");
			query.setString(0, name);
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
	public List queryto(String name) {

		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session
					.createQuery("from Info where infoto=? order by infotime desc");
			query.setString(0, name);
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
	public int queryto1(String name) {

		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session
					.createQuery("from Info where infoto=? and fujian=0 order by infotime desc");
			query.setString(0, name);
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

		return list.size();
	}

	public Info queryId(Integer id) {

		Session session = null;
		Transaction tx = null;
		Info info = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();

			info = (Info) session.get(Info.class, id);

			tx.commit();

		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {

			HibernateSessionFactory.closeSession();
		}

		return info;
	}

	public void update(Info info) {
		Session session = null;
		Transaction tx = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			info.setFujian("1");

			session.saveOrUpdate(info);
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
