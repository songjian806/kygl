package com.keyan.hibernate.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import com.keyan.hibernate.form.Point;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

/**
 * A data access object (DAO) providing persistence and search support for Point
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.keyan.hibernate.form.Point
 * @author MyEclipse Persistence Tools
 */

public class PointDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(PointDAO.class);
	// property constants
	public static final String ACH_NUM = "achNum";
	public static final String ACH_NAME = "achName";
	public static final String POINT = "point";

	public void save(Point transientInstance) {
		log.debug("saving Point instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Point persistentInstance) {
		log.debug("deleting Point instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Point findById(java.lang.Integer id) {
		log.debug("getting Point instance with id: " + id);
		try {
			Point instance = (Point) getSession().get(
					"com.keyan.hibernate.form.Point", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public Point findByAchnum(String achnum) {
		Session session = null;
		Transaction tx = null;
		Point point = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Point as model where model.achNum = '"
							+ achnum + "'");
			point = (Point) query.uniqueResult();
			query = null;
			tx.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return point;
	}

	public List findByExample(Point instance) {
		log.debug("finding Point instance by example");
		try {
			List results = getSession()
					.createCriteria("com.keyan.hibernate.form.Point")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Point instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Point as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAchNum(Object achNum) {
		return findByProperty(ACH_NUM, achNum);
	}

	public List findByAchName(Object achName) {
		return findByProperty(ACH_NAME, achName);
	}

	public List findByPoint(Object point) {
		return findByProperty(POINT, point);
	}

	public List findAll() {
		log.debug("finding all Point instances");
		try {
			String queryString = "from Point";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Point merge(Point detachedInstance) {
		log.debug("merging Point instance");
		try {
			Point result = (Point) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Point instance) {
		log.debug("attaching dirty Point instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Point instance) {
		log.debug("attaching clean Point instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}