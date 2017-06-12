package com.keyan.hibernate.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import com.keyan.hibernate.form.Post;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

/**
 * A data access object (DAO) providing persistence and search support for Post
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.keyan.hibernate.form.Post
 * @author MyEclipse Persistence Tools
 */

public class PostDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(PostDAO.class);
	// property constants
	public static final String POSTNUM = "postnum";
	public static final String POSTNAME = "postname";
	public static final String TASK = "task";

	public void save(Post transientInstance) {
		log.debug("saving Post instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Post persistentInstance) {
		log.debug("deleting Post instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Post findById(java.lang.Integer id) {
		log.debug("getting Post instance with id: " + id);
		try {
			Post instance = (Post) getSession().get(
					"com.keyan.hibernate.form.Post", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByPostnum1(String postnum) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Post as model where model.postnum = '"
							+ postnum + "'");
			list = (List) query.uniqueResult();
			query = null;
			tx.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return list;
	}

	public Post findByPostnum(String postnum) {
		Session session = null;
		Transaction tx = null;
		Post post = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Post as model where model.postnum = '"
							+ postnum + "'");
			post = (Post) query.uniqueResult();
			query = null;
			tx.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return post;
	}

	public List findByExample(Post instance) {
		log.debug("finding Post instance by example");
		try {
			List results = getSession()
					.createCriteria("com.keyan.hibernate.form.Post")
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
		log.debug("finding Post instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Post as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPostnum(Object postnum) {
		return findByProperty(POSTNUM, postnum);
	}

	public List findByPostname(Object postname) {
		return findByProperty(POSTNAME, postname);
	}

	public List findByTask(Object task) {
		return findByProperty(TASK, task);
	}

	public List findAll() {
		log.debug("finding all Post instances");
		try {
			String queryString = "from Post";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Post merge(Post detachedInstance) {
		log.debug("merging Post instance");
		try {
			Post result = (Post) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Post instance) {
		log.debug("attaching dirty Post instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Post instance) {
		log.debug("attaching clean Post instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}