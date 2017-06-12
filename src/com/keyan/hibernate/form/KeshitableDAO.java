package com.keyan.hibernate.form;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Keshitable entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.keyan.hibernate.form.Keshitable
 * @author MyEclipse Persistence Tools
 */

public class KeshitableDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(KeshitableDAO.class);
	// property constants
	public static final String KESHI_NAME = "keshiName";
	public static final String DEPT_ID = "deptId";
	public static final String TYPE = "type";

	public void save(Keshitable transientInstance) {
		log.debug("saving Keshitable instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Keshitable persistentInstance) {
		log.debug("deleting Keshitable instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public void delete(Integer id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Keshitable depttable = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			depttable = (Keshitable) session.get(Keshitable.class, id);

			session.delete(depttable);

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

	public void delete1(Integer id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Depttable depttable = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			tx.begin();
			Query query = session.createQuery("from Keshitable where deptID="
					+ new Integer(id));
			List list = query.list();
			query = null;

			for (int i = 0; i < list.size(); i++) {
				depttable = (Depttable) list.get(i);
				session.delete(depttable);
			}
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

	public Keshitable findById(java.lang.Integer id) {
		log.debug("getting Keshitable instance with id: " + id);
		try {
			Keshitable instance = (Keshitable) getSession().get(
					"com.keyan.hibernate.form.Keshitable", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Keshitable instance) {
		log.debug("finding Keshitable instance by example");
		try {
			List results = getSession()
					.createCriteria("com.keyan.hibernate.form.Keshitable")
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
		log.debug("finding Keshitable instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Keshitable as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByKeshiName(Object keshiName) {
		return findByProperty(KESHI_NAME, keshiName);
	}

	public List findByDeptId(Object deptId) {
		return findByProperty(DEPT_ID, deptId);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findAll() {
		log.debug("finding all Keshitable instances");
		try {
			String queryString = "from Keshitable";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Keshitable merge(Keshitable detachedInstance) {
		log.debug("merging Keshitable instance");
		try {
			Keshitable result = (Keshitable) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Keshitable instance) {
		log.debug("attaching dirty Keshitable instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Keshitable instance) {
		log.debug("attaching clean Keshitable instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}