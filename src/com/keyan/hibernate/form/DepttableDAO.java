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
 * Depttable entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.keyan.hibernate.form.Depttable
 * @author MyEclipse Persistence Tools
 */

public class DepttableDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(DepttableDAO.class);
	// property constants
	public static final String DEPT_NAME = "deptName";
	public static final String LEADER = "leader";
	public static final String JIAOSHOUCOUNT = "jiaoshoucount";
	public static final String FUJIAOSHOU = "fujiaoshou";
	public static final String JIANGSHI = "jiangshi";
	public static final String ZHUJIAO = "zhujiao";
	public static final String KESHI = "keshi";
	public static final String JIGOU = "jigou";

	public void save(Depttable transientInstance) {
		log.debug("saving Depttable instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Depttable persistentInstance) {
		log.debug("deleting Depttable instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Depttable findById(java.lang.Integer id) {
		log.debug("getting Depttable instance with id: " + id);
		try {
			Depttable instance = (Depttable) getSession().get(
					"com.keyan.hibernate.form.Depttable", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public void delete(Integer id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Depttable depttable = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			depttable = (Depttable) session.get(Depttable.class, id);

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

	public List findByExample(Depttable instance) {
		log.debug("finding Depttable instance by example");
		try {
			List results = getSession()
					.createCriteria("com.keyan.hibernate.form.Depttable")
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
		log.debug("finding Depttable instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Depttable as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDeptName(Object deptName) {
		return findByProperty(DEPT_NAME, deptName);
	}

	public List findByLeader(Object leader) {
		return findByProperty(LEADER, leader);
	}

	public List findByJiaoshoucount(Object jiaoshoucount) {
		return findByProperty(JIAOSHOUCOUNT, jiaoshoucount);
	}

	public List findByFujiaoshou(Object fujiaoshou) {
		return findByProperty(FUJIAOSHOU, fujiaoshou);
	}

	public List findByJiangshi(Object jiangshi) {
		return findByProperty(JIANGSHI, jiangshi);
	}

	public List findByZhujiao(Object zhujiao) {
		return findByProperty(ZHUJIAO, zhujiao);
	}

	public List findByKeshi(Object keshi) {
		return findByProperty(KESHI, keshi);
	}

	public List findByJigou(Object jigou) {
		return findByProperty(JIGOU, jigou);
	}

	public List findAll() {
		log.debug("finding all Depttable instances");
		try {
			String queryString = "from Depttable";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Depttable merge(Depttable detachedInstance) {
		log.debug("merging Depttable instance");
		try {
			Depttable result = (Depttable) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Depttable instance) {
		log.debug("attaching dirty Depttable instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Depttable instance) {
		log.debug("attaching clean Depttable instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}