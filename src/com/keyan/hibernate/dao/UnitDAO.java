package com.keyan.hibernate.dao;

import com.keyan.hibernate.dao.BaseHibernateDAO;
import com.keyan.hibernate.form.Unit;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for Unit
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.keyan.hibernate.form.Unit
 * @author MyEclipse Persistence Tools
 */

public class UnitDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(UnitDAO.class);
	// property constants
	public static final String UNITNUM = "unitnum";
	public static final String UNITNAME = "unitname";
	public static final String SECRETARY = "secretary";
	public static final String TEL = "tel";
	public static final String EMAIL = "email";

	public void save(Unit transientInstance) {
		log.debug("saving Unit instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Unit persistentInstance) {
		log.debug("deleting Unit instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Unit findById(java.lang.Integer id) {
		log.debug("getting Unit instance with id: " + id);
		try {
			Unit instance = (Unit) getSession().get(
					"com.keyan.hibernate.form.Unit", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public Unit findByUnitnum(String unitnum) {
	     Session session = null;
		 Transaction tx = null;
		 Unit unit = null;
		 try {
		 	session = HibernateSessionFactory.getSession();
		 	tx = session.beginTransaction();
		 	Query query = session.createQuery("from Unit as model where model.unitnum = '"+unitnum+"'");
		 	unit = (Unit)query.uniqueResult();
			query = null;
			tx.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return unit;
	}

	public List findByExample(Unit instance) {
		log.debug("finding Unit instance by example");
		try {
			List results = getSession().createCriteria(
					"com.keyan.hibernate.form.Unit").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Unit instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Unit as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUnitnum(Object unitnum) {
		return findByProperty(UNITNUM, unitnum);
	}

	public List findByUnitname(Object unitname) {
		return findByProperty(UNITNAME, unitname);
	}

	public List findBySecretary(Object secretary) {
		return findByProperty(SECRETARY, secretary);
	}

	public List findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findAll() {
		log.debug("finding all Unit instances");
		try {
			String queryString = "from Unit";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Unit merge(Unit detachedInstance) {
		log.debug("merging Unit instance");
		try {
			Unit result = (Unit) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Unit instance) {
		log.debug("attaching dirty Unit instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Unit instance) {
		log.debug("attaching clean Unit instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}