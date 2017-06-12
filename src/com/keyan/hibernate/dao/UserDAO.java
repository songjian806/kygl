package com.keyan.hibernate.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.keyan.hibernate.form.Keyanuser;
import com.keyan.hibernate.form.Projectcg;
import com.keyan.hibernate.form.Thesis;
import com.keyan.hibernate.form.Work;
import com.keyan.hibernate.form.Zhuanli;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;

public class UserDAO {
	// insert
	public List qurryuser(String unitnum) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session
					.createQuery("from Keyanuser as model where model.unitnum = '"
							+ unitnum + "'");
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

	public Keyanuser qurryuser(String username, String password, String userType) {
		Session session = null;
		Transaction tx = null;
		Keyanuser keyanUser = new Keyanuser();
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			// 查询数据库的用户和密码，权限
			Query query = session
					.createQuery("from Keyanuser where username=? and password=? and userclasify=?");
			query.setString(0, username);
			query.setString(1, password);
			query.setString(2, userType);
			// 从数据库查询结果
			keyanUser = (Keyanuser) query.uniqueResult();
			tx.commit();

		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {

			HibernateSessionFactory.closeSession();
		}
		return keyanUser;
	}

	public float getTotalScoreByUser(Keyanuser user, String nian) {
		if (nian == null || nian.equals(""))
			nian = "2010";
		List projectList = new ProjectcgDao().findByUserNian(user, nian);
		List thesisList = new ThesisDao().findByUserNian(user, nian);
		List workList = new WorkDao().findByUserNian(user, nian);
		List zhuanliList = new ZhuanliDao().findByUserNian(user, nian);
		float totalscore = 0;
		// thesis
		Iterator thesisit = thesisList.iterator();
		float thesisscore = 0;
		while (thesisit.hasNext()) {
			float score = 0;
			Thesis thesis = (Thesis) thesisit.next();
			if (thesis.getTMembers().intValue() == 1
					&& thesis.getTName().equals(user.getName()))
				score += thesis.getPoint();
			else if (thesis.getTMembers().intValue() == 2) {
				// 7-3
				if (thesis.getTName().equals(user.getName()))
					score += thesis.getPoint() * 0.7;
				else if (thesis.getSecond().equals(user.getName()))
					score += thesis.getPoint() * 0.3;

			} else if (thesis.getTMembers().intValue() == 3) {
				// 7-2-1
				if (thesis.getTName().equals(user.getName()))
					score += thesis.getPoint() * 0.7;
				else if (thesis.getSecond().equals(user.getName()))
					score += thesis.getPoint() * 0.2;
				else if (thesis.getThird().equals(user.getName()))
					score += thesis.getPoint() * 0.1;

			} else if (thesis.getTMembers().intValue() >= 4) {
				if (thesis.getTName().equals(user.getName()))
					score += thesis.getPoint() * 0.6;
				else if (thesis.getSecond().equals(user.getName()))
					score += thesis.getPoint() * 0.2;
				else if (thesis.getThird().equals(user.getName()))
					score += thesis.getPoint() * 0.1;
				else
					score += (thesis.getPoint() * 0.1)
							/ (thesis.getTMembers().intValue() - 3);
			}
			thesisscore += score;
		}
		totalscore += thesisscore;
		// work
		Iterator workit = workList.iterator();
		float workscore = 0;
		while (workit.hasNext()) {
			float score = 0;
			Work work = (Work) workit.next();

			if (work.getWMembers().intValue() == 1
					&& work.getWName().equals(user.getName()))
				score += work.getPoint();
			else if (work.getWMembers().intValue() == 2) {
				// 7-3
				if (work.getWName().equals(user.getName()))
					score += work.getPoint() * 0.7;
				else if (work.getSecond().equals(user.getName()))
					score += work.getPoint() * 0.3;

			} else if (work.getWMembers().intValue() == 3) {
				// 7-2-1
				if (work.getWName().equals(user.getName()))
					score += work.getPoint() * 0.7;
				else if (work.getSecond().equals(user.getName()))
					score += work.getPoint() * 0.2;
				else if (work.getThird().equals(user.getName()))
					score += work.getPoint() * 0.1;

			} else if (work.getWMembers().intValue() >= 4) {
				if (work.getWName().equals(user.getName()))
					score += work.getPoint() * 0.6;
				else if (work.getSecond().equals(user.getName()))
					score += work.getPoint() * 0.2;
				else if (work.getThird().equals(user.getName()))
					score += work.getPoint() * 0.1;
				else
					score += (work.getPoint() * 0.1)
							/ (work.getWMembers().intValue() - 3);
			}
			workscore += score;
		}
		totalscore += workscore;
		// zhuanli
		Iterator zhuanliit = zhuanliList.iterator();
		float zhuanliscore = 0;
		while (zhuanliit.hasNext()) {
			float score = 0;
			Zhuanli zhuanli = (Zhuanli) zhuanliit.next();

			if (zhuanli.getZMembers().intValue() == 1
					&& zhuanli.getZName().equals(user.getName()))
				score += zhuanli.getPoint();
			else if (zhuanli.getZMembers().intValue() == 2) {
				// 7-3
				if (zhuanli.getZName().equals(user.getName()))
					score += zhuanli.getPoint() * 0.7;
				else if (zhuanli.getSecond().equals(user.getName()))
					score += zhuanli.getPoint() * 0.3;

			} else if (zhuanli.getZMembers().intValue() == 3) {
				// 7-2-1
				if (zhuanli.getZName().equals(user.getName()))
					score += zhuanli.getPoint() * 0.7;
				else if (zhuanli.getSecond().equals(user.getName()))
					score += zhuanli.getPoint() * 0.2;
				else if (zhuanli.getThird().equals(user.getName()))
					score += zhuanli.getPoint() * 0.1;

			} else if (zhuanli.getZMembers().intValue() >= 4) {
				if (zhuanli.getZName().equals(user.getName()))
					score += zhuanli.getPoint() * 0.6;
				else if (zhuanli.getSecond().equals(user.getName()))
					score += zhuanli.getPoint() * 0.2;
				else if (zhuanli.getThird().equals(user.getName()))
					score += zhuanli.getPoint() * 0.1;
				else
					score += (zhuanli.getPoint() * 0.1)
							/ (zhuanli.getZMembers().intValue() - 3);
			}
			zhuanliscore += score;
		}
		totalscore += zhuanliscore;
		// project
		Iterator projectit = projectList.iterator();
		float projectscore = 0;
		while (projectit.hasNext()) {
			float score = 0;
			Projectcg project = (Projectcg) projectit.next();

			if (project.getPMembers().intValue() == 1
					&& project.getPName().equals(user.getName()))
				score += project.getPoint();
			else if (project.getPMembers().intValue() == 2) {
				// 7-3
				if (project.getPName().equals(user.getName()))
					score += project.getPoint() * 0.7;
				else if (project.getSecond().equals(user.getName()))
					score += project.getPoint() * 0.3;

			} else if (project.getPMembers().intValue() == 3) {
				// 7-2-1
				if (project.getPName().equals(user.getName()))
					score += project.getPoint() * 0.7;
				else if (project.getSecond().equals(user.getName()))
					score += project.getPoint() * 0.2;
				else if (project.getThird().equals(user.getName()))
					score += project.getPoint() * 0.1;

			} else if (project.getPMembers().intValue() >= 4) {
				if (project.getPName().equals(user.getName()))
					score += project.getPoint() * 0.6;
				else if (project.getSecond().equals(user.getName()))
					score += project.getPoint() * 0.2;
				else if (project.getThird().equals(user.getName()))
					score += project.getPoint() * 0.1;
				else
					score += (project.getPoint() * 0.1)
							/ (project.getPMembers().intValue() - 3);
			}
			projectscore += score;
		}
		totalscore += projectscore;

		return totalscore;
	}

	public void insert(Keyanuser user) {
		Session session = null;
		Transaction tx = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			session.save(user);
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
		Keyanuser user = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			user = (Keyanuser) session.get(Keyanuser.class, id);
			session.delete(user);
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
			Query query = session.createQuery("from Keyanuser");
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

	public List findByUnit(String unitnum) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session
					.createQuery("from Keyanuser as model where model.unitnum = '"
							+ unitnum + "'");
			list = query.list();
			query = null;
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return list;
	}

	public List queryName(String name) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session
					.createQuery("from Keyanuser where username=?");
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

	public Keyanuser findByZgnumClasify(String zgnum, Keyanuser loginuser) {
		Session session = null;
		Transaction tx = null;
		Keyanuser user = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = null;
			if (loginuser.getUserclasify().equals("2"))
				query = session
						.createQuery("from Keyanuser as model where model.username= '"
								+ zgnum + "'");
			else
				query = session
						.createQuery("from Keyanuser as model where model.username= '"
								+ zgnum
								+ "' and model.unitnum = '"
								+ loginuser.getUnitnum() + "'");
			user = (Keyanuser) query.uniqueResult();
			query = null;
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return user;
	}

	public List queryName1(String name) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session.createQuery("from Keyanuser where name=?");
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

	public List findUsersByNameClasify(String name, Keyanuser user) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = null;
			if (user.getUserclasify().equals("1"))
				query = session.createQuery("from Keyanuser where name= '"
						+ name + "' and unitnum = '" + user.getUnitnum() + "'");
			else if (user.getUserclasify().equals("2"))
				query = session.createQuery("from Keyanuser where name= '"
						+ name + "'");
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

	public List findUsersByNameClasify1(String name, Keyanuser user) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = null;
			query = session.createQuery("from Keyanuser where name= '" + name
					+ "'");
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
	public Keyanuser queryId(Integer id) {
		Session session = null;
		Transaction tx = null;
		Keyanuser user = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			user = (Keyanuser) session.get(Keyanuser.class, id);
			tx.commit();

		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return user;
	}

	public boolean update(Integer id, String tel, String post, String addr) {
		Session session = null;
		Transaction tx = null;
		Keyanuser user = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			user = (Keyanuser) session.get(Keyanuser.class, id);
			user.setTel(tel);
			user.setPost(post);
			user.setAddr(addr);
			session.saveOrUpdate(user);
			tx.commit();
			return true;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			// throw e;
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	public boolean update(Integer id, String tel, String post, String addr,
			String userclasify) {
		Session session = null;
		Transaction tx = null;
		Keyanuser user = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			user = (Keyanuser) session.get(Keyanuser.class, id);
			user.setTel(tel);
			user.setPost(post);
			user.setAddr(addr);
			user.setUserclasify(userclasify);
			session.saveOrUpdate(user);
			tx.commit();
			return true;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			// throw e;
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	public boolean update(Integer id, String password, String tel, String post,
			String addr, String userclasify) {
		Session session = null;
		Transaction tx = null;
		Keyanuser user = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			user = (Keyanuser) session.get(Keyanuser.class, id);
			user.setPassword(password);
			user.setTel(tel);
			user.setPost(post);
			user.setAddr(addr);
			user.setUserclasify(userclasify);
			session.saveOrUpdate(user);
			tx.commit();
			return true;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			// throw e;
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	public boolean update(Integer id, String password) {
		Session session = null;
		Transaction tx = null;
		Keyanuser user = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			tx.begin();
			user = (Keyanuser) session.get(Keyanuser.class, id);
			user.setPassword(password);
			session.saveOrUpdate(user);
			tx.commit();
			return true;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			// throw e;
			return false;

		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
}