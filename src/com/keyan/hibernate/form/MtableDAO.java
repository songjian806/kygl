package com.keyan.hibernate.form;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
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
import com.keyan.struts.form.MeetingForm;
import com.keyan.struts.form.ThesisForm;

/**
 * A data access object (DAO) providing persistence and search support for
 * Mtable entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.keyan.hibernate.form.Mtable
 * @author MyEclipse Persistence Tools
 */

public class MtableDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(MtableDAO.class);
	// property constants
	public static final String MEETING_NAME = "meetingName";
	public static final String MEETING_TYPE = "meetingType";
	public static final String COURSE_NAME = "courseName";
	public static final String ADDRESS = "address";
	public static final String TYPE1 = "type1";

	public void save(Mtable transientInstance) {
		log.debug("saving Mtable instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void update(MeetingForm thesisForm) throws ParseException {
		Session session = null;
		Transaction tx = null;
		Mtable mtable = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			mtable = (Mtable) session.get(Mtable.class,
					new Integer(thesisForm.getId()));
			DateFormat time = DateFormat.getDateInstance();
			mtable.setMeetingName(thesisForm.getMeetingName());
			mtable.setAddress(thesisForm.getAddress());
			mtable.setMeetingType(thesisForm.getMeetingType());
			mtable.setStartTime(time.parse(thesisForm.getStartTime()));
			mtable.setEndTime(time.parse(thesisForm.getStartTime()));
			mtable.setType1(new Integer(thesisForm.getType1()));
			mtable.setCourseName(thesisForm.getCourseName());

			session.saveOrUpdate(mtable);
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
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Mtable mtable = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			mtable = (Mtable) session.get(Mtable.class, id);

			session.delete(mtable);

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

	public void update(Mtable transientInstance) {
		log.debug("saving Mtable instance");
		try {
			getSession().update(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Mtable persistentInstance) {
		log.debug("deleting Mtable instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Mtable findById(java.lang.Integer id) {
		log.debug("getting Mtable instance with id: " + id);
		try {
			Mtable instance = (Mtable) getSession().get(
					"com.keyan.hibernate.form.Mtable", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Mtable instance) {
		log.debug("finding Mtable instance by example");
		try {
			List results = getSession()
					.createCriteria("com.keyan.hibernate.form.Mtable")
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
		log.debug("finding Mtable instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Mtable as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMeetingName(Object meetingName) {
		return findByProperty(MEETING_NAME, meetingName);
	}

	public List findByMeetingType(Object meetingType) {
		return findByProperty(MEETING_TYPE, meetingType);
	}

	public List findByCourseName(Object courseName) {
		return findByProperty(COURSE_NAME, courseName);
	}

	public List findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List findByType1(Object type1) {
		return findByProperty(TYPE1, type1);
	}

	public List findAll() {
		log.debug("finding all Mtable instances");
		try {
			String queryString = "from Mtable";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Mtable merge(Mtable detachedInstance) {
		log.debug("merging Mtable instance");
		try {
			Mtable result = (Mtable) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Mtable instance) {
		log.debug("attaching dirty Mtable instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Mtable instance) {
		log.debug("attaching clean Mtable instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public List queryByName(String title, String btime, String etime,
			String type1) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		DateFormat time = DateFormat.getDateInstance();
		Date time1 = null;
		Date time2 = null;
		try {
			time1 = time.parse(btime);
			time2 = time.parse(etime);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			String sql = "from Mtable";
			int i = 0;

			if (title != null && !title.equals("")) {
				if (i == 0) {
					sql = sql
							+ " where meetingName like :title or courseName like :title or address like :title";
					i = 1;
				} else {
					sql = sql
							+ " and meetingName like :title or courseName like :title or address like :title";
				}
				i = 1;
			}
			if (btime != null && !btime.equals("")) {
				if (i == 0) {
					sql = sql + " where startTime>=:btime";
					i = 1;
				} else {
					sql = sql + " and startTime>=:btime";
				}
				i = 1;
			}
			if (etime != null && !etime.equals("")) {
				if (i == 0) {
					sql = sql + " where startTime<=:etime";
					i = 1;
				} else {
					sql = sql + " and startTime<=:etime";
				}
				i = 1;
			}
			if (type1 != null && !type1.equals("")) {
				if (i == 0) {
					sql = sql + " where type1=:type";
					i = 1;
				} else {
					sql = sql + " and type1=:type";
				}
				i = 1;
			}
			sql = sql + "";

			Query query = session.createQuery(sql);

			if (title != null && !title.equals("")) {
				query.setParameter("title", title);

			}
			if (btime != null && !btime.equals("")) {
				query.setParameter("btime", time1);

			}
			if (etime != null && !etime.equals("")) {
				query.setParameter("etime", time2);

			}
			if (type1 != null && !type1.equals("")) {
				query.setParameter("type", new Integer(type1));

			}
			list = query.list();
			query = null;

			System.out.println(sql);

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