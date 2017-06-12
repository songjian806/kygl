package com.keyan.hibernate.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.keyan.hibernate.form.Keyanuser;
import com.keyan.hibernate.form.Work;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;
import com.keyan.struts.form.WorkForm;

public class WorkDao {

	public void insert(Work work) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.save(work);
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

	public void update(WorkForm workForm) {
		Session session = null;
		Transaction tx = null;
		Work work = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			work = (Work) session.get(Work.class, workForm.getId());
			work.setWName(workForm.getWName());
			work.setWPost(workForm.getWPost());
			work.setWUnit(workForm.getWUnit());
			work.setWTitle(workForm.getWTitle());
			work.setWPublisher(workForm.getWPublisher());
			work.setWIsbnid(workForm.getWIsbnid());
			work.setWOthers(workForm.getWOthers());
			work.setWScore(workForm.getWScore());
			work.setWRemarks(workForm.getWRemarks());
			work.setSecond(workForm.getWSecond());
			work.setThird(workForm.getWThird());
			session.saveOrUpdate(work);
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

	public void update(WorkForm workForm, String wusernum) {
		Session session = null;
		Transaction tx = null;
		Work work = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			work = (Work) session.get(Work.class, workForm.getId());
			work.setWName(workForm.getWName());
			work.setWPost(workForm.getWPost());
			work.setWUnit(workForm.getWUnit());
			work.setWTitle(workForm.getWTitle());
			work.setWPublisher(workForm.getWPublisher());
			work.setWIsbnid(workForm.getWIsbnid());
			work.setWOthers(workForm.getWOthers());
			work.setWScore(workForm.getWScore());
			work.setWRemarks(workForm.getWRemarks());
			work.setSecond(workForm.getWSecond());
			work.setThird(workForm.getWThird());
			work.setWusernum(wusernum + "," + workForm.getWSecondnum() + ","
					+ workForm.getWThirdnum() + "," + workForm.getWOthersnum());
			session.saveOrUpdate(work);
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

	public void update1(Work work) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(work);
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

	public List query(String level) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = null;
			if (level.equals("0"))
				query = session.createQuery("from Work");
			else if (level.equals("1"))
				query = session
						.createQuery("from Work where w_score = '未审核' or w_score = '院审通过' order by WScore asc");
			else
				query = session
						.createQuery("from Work where w_score = '院审通过' or w_score = '校审通过' order by WScore asc");

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

	public static List queryByNian(String nian1, String nian2, String yuanxi)
			throws ParseException {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		DateFormat time = DateFormat.getDateInstance();
		Date time1 = time.parse(nian1);
		Date time2 = time.parse(nian2);
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = null;
			if (yuanxi.equals("0")) {
				query = session
						.createQuery("from Work where WTime>=:time1 and WTime<=:time2  and w_score = '校审通过' ");
			} else {
				query = session
						.createQuery("from Work where w_unit='"
								+ yuanxi
								+ "' and WTime>=:time1 and WTime<=:time2  and w_score = '校审通过'");
			}
			query.setTime("time1", time1);
			query.setTime("time2", time2);
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

	public List queryBy(String word, String level) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = null;
			if (level.equals("0"))
				query = session.createQuery("from Work");
			else if (level.equals("1"))
				query = session
						.createQuery("from Work where w_score = '未审核' or w_score = '院审通过' order by WScore asc");
			else
				query = session
						.createQuery("from Work where (w_score = '院审通过' or w_score = '校审通过') and (w_title like '%"
								+ word
								+ "%' or w_name like '%"
								+ word
								+ "%'  or w_post like '%"
								+ word
								+ "%' or w_unit like '%"
								+ word
								+ "%') order by WScore asc");

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

	public List queryByname(String name, String word) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Work where w_name = '"
					+ name + "' and ( w_title like '%" + word
					+ "%' or  w_unit like '%" + word
					+ "%' ) order by WScore asc");
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

	public List queryByunit(String unit, String word) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Work where w_unit = '"
					+ unit + "' and ( w_title like '%" + word
					+ "%' or  w_name like '%" + word + "%' or  w_post like '%"
					+ word + "%' ) order by WScore asc");
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
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Work work = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			work = (Work) session.get(Work.class, id);
			session.delete(work);
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

	public static List findByUserNian(Keyanuser user, String nian) {
		// TODO Auto-generated method stubSession session = null;
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Work as model where (model.WTime between :btime and :etime) and ( model.Wusernum like '%"
							+ user.getUsername() + "%')");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			query.setTimestamp("btime", df.parse(nian + "-01-01"));
			query.setTimestamp("etime", df.parse(nian + "-12-31"));
			list = query.list();
			query = null;
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return list;
	}

	public int queryByUserdept(String userdept, int nian) {
		Session session = null;
		Transaction tx = null;
		int count = 0;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("select count(*) from Work as model where (model.WTime between :btime and :etime)and (model.WUnit = :name)");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			query.setTimestamp("btime", df.parse(nian + "-01-01"));
			query.setTimestamp("etime", df.parse(nian + "-12-31"));
			query.setString("name", userdept);			
			count = Integer.valueOf(query.uniqueResult().toString());			
			query = null;

			tx.commit();

		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return count;
	}

	public static int findByUserNian(Integer nian) {
		// TODO Auto-generated method stubSession session = null;
		Session session = null;
		Transaction tx = null;
		int count = 0;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("select count(*)from Work as model where (model.WTime between :btime and :etime) ");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			query.setTimestamp("btime", df.parse(nian + "-01-01"));
			query.setTimestamp("etime", df.parse(nian + "-12-31"));			
			count = Integer.valueOf(query.uniqueResult().toString());
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return count;
	}

	public static List findByUserNian(Keyanuser user, int nian) {
		// TODO Auto-generated method stubSession session = null;
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Work as model where (model.WTime between :btime and :etime) and (model.WName = :name or model.Second = :name or model.Third=:name or model.WOthers like '%"
							+ user.getName() + "%')");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			query.setTimestamp("btime", df.parse(nian + "-01-01"));
			query.setTimestamp("etime", df.parse(nian + "-12-31"));
			query.setString("name", user.getName());
			list = query.list();
			query = null;
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return list;
	}

	public Work queryId(Integer id) { // 把work改成Work
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Work work = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			work = (Work) session.get(Work.class, id);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return work;
	}

	public List queryByName(String name, String unit, String post,
			String title, String btime, String etime) {
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
			String sql = "from Work";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " where WName=:name";
				i = 1;
			}

			if (unit != null && !unit.equals("")) {
				if (i == 0) {
					sql = sql + " where WUnit=:unit";
					i = 1;
				} else {
					sql = sql + " and WUnit=:unit";
				}
				i = 1;
			}

			if (post != null && !post.equals("")) {
				if (i == 0) {
					sql = sql + " where WPost=:post";
					i = 1;
				} else {
					sql = sql + " and WPost=:post";
				}
				i = 1;
			}

			if (title != null && !title.equals("")) {
				if (i == 0) {
					sql = sql + " where WTitle=:title";
					i = 1;
				} else {
					sql = sql + " and WTitle=:title";
				}
				i = 1;
			}
			if (btime != null && !btime.equals("")) {
				if (i == 0) {
					sql = sql + " where WTime>=:btime";
					i = 1;
				} else {
					sql = sql + " and WTime>=:btime";
				}
				i = 1;
			}
			if (etime != null && !etime.equals("")) {
				if (i == 0) {
					sql = sql + " where WTime<=:etime";
					i = 1;
				} else {
					sql = sql + " and WTime<=:etime";
				}
				i = 1;
			}
			sql = sql + " order by WScore asc";

			Query query = session.createQuery(sql);
			if (name != null && !name.equals("")) {
				query.setParameter("name", name);

			}
			if (unit != null && !unit.equals("")) {
				query.setParameter("unit", unit);

			}
			if (post != null && !post.equals("")) {
				query.setParameter("post", post);

			}
			if (title != null && !title.equals("")) {
				query.setParameter("title", title);

			}
			if (btime != null && !btime.equals("")) {
				query.setParameter("btime", time1);

			}
			if (etime != null && !etime.equals("")) {
				query.setParameter("etime", time2);

			}
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

	public List queryByNamef(String name, String unit, String post,
			String WRemarks, String btime, String etime) {
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
			String sql = "from Work";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " where WName=:name";
				i = 1;
			}

			if (unit != null && !unit.equals("")) {
				if (i == 0) {
					sql = sql + " where WUnit=:unit";
					i = 1;
				} else {
					sql = sql + " and WUnit=:unit";
				}
				i = 1;
			}

			if (post != null && !post.equals("")) {
				if (i == 0) {
					sql = sql + " where WPost=:post";
					i = 1;
				} else {
					sql = sql + " and WPost=:post";
				}
				i = 1;
			}

			if (WRemarks != null && !WRemarks.equals("")) {
				if (i == 0) {
					sql = sql + " where WRemarks like :WRemarks";
					i = 1;
				} else {
					sql = sql + " and WRemarks like :WRemarks";
				}
				i = 1;
			}
			if (btime != null && !btime.equals("")) {
				if (i == 0) {
					sql = sql + " where WTime>=:btime";
					i = 1;
				} else {
					sql = sql + " and WTime>=:btime";
				}
				i = 1;
			}
			if (etime != null && !etime.equals("")) {
				if (i == 0) {
					sql = sql + " where WTime<=:etime";
					i = 1;
				} else {
					sql = sql + " and WTime<=:etime";
				}
				i = 1;
			}
			sql = sql + " order by WScore asc";

			Query query = session.createQuery(sql);
			if (name != null && !name.equals("")) {
				query.setParameter("name", name);

			}
			if (unit != null && !unit.equals("")) {
				query.setParameter("unit", unit);

			}
			if (post != null && !post.equals("")) {
				query.setParameter("post", post);

			}
			if (WRemarks != null && !WRemarks.equals("")) {
				query.setParameter("WRemarks", "%" + WRemarks + "%");

			}
			if (btime != null && !btime.equals("")) {
				query.setParameter("btime", time1);

			}
			if (etime != null && !etime.equals("")) {
				query.setParameter("etime", time2);

			}
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

	public List queryByName1(String name, String unit, String post,
			String title, String btime, String etime) {
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
			String sql = "from Work where (w_score = '院审通过' or w_score = '校审通过')";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " and WName like:name";

			}

			if (unit != null && !unit.equals("")) {

				sql = sql + " and WUnit like:unit";

			}

			if (post != null && !post.equals("")) {

				sql = sql + " and WPost=:post";

			}

			if (title != null && !title.equals("")) {

				sql = sql + " and WTitle like:title";

			}
			if (btime != null && !btime.equals("")) {

				sql = sql + " and WTime>=:btime";

			}
			if (etime != null && !etime.equals("")) {

				sql = sql + " and WTime<=:etime";

			}
			sql = sql + " order by WScore asc";

			Query query = session.createQuery(sql);
			if (name != null && !name.equals("")) {
				query.setParameter("name", "%" + name + "%");

			}
			if (unit != null && !unit.equals("")) {
				query.setParameter("unit", "%" + unit + "%");

			}
			if (post != null && !post.equals("")) {
				query.setParameter("post", post);

			}
			if (title != null && !title.equals("")) {
				query.setParameter("title", "%" + title + "%");

			}
			if (btime != null && !btime.equals("")) {
				query.setParameter("btime", time1);

			}
			if (etime != null && !etime.equals("")) {
				query.setParameter("etime", time2);

			}
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

	public List queryByName2(String name, String unit, String post,
			String title, String btime, String etime) {
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
			String sql = "from Work where (w_unit = '" + unit + "')";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " and WName like:name";
			}

			if (post != null && !post.equals("")) {

				sql = sql + " and WPost=:post";

			}

			if (title != null && !title.equals("")) {

				sql = sql + " and WTitle like:title";

			}
			if (btime != null && !btime.equals("")) {

				sql = sql + " and WTime>=:btime";

			}
			if (etime != null && !etime.equals("")) {

				sql = sql + " and WTime<=:etime";

			}
			sql = sql + " order by WScore asc";

			Query query = session.createQuery(sql);
			if (name != null && !name.equals("")) {
				query.setParameter("name", "%" + name + "%");
			}

			if (post != null && !post.equals("")) {
				query.setParameter("post", post);

			}
			if (title != null && !title.equals("")) {
				query.setParameter("title", "%" + title + "%");

			}
			if (btime != null && !btime.equals("")) {
				query.setParameter("btime", time1);

			}
			if (etime != null && !etime.equals("")) {
				query.setParameter("etime", time2);
			}
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

	public List queryByName3(String username, String unit, String post,
			String title, String btime, String etime) {
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
			String sql = "from Work where (w_name = '" + username + "')";
			int i = 0;
			if (unit != null && !unit.equals("")) {
				sql = sql + " and WUnit=:unit";
			}

			if (post != null && !post.equals("")) {
				sql = sql + " and WPost=:post";
			}

			if (title != null && !title.equals("")) {
				sql = sql + " and WTitle like:title";
			}
			if (btime != null && !btime.equals("")) {
				sql = sql + " and WTime>=:btime";
			}
			if (etime != null && !etime.equals("")) {
				sql = sql + " and WTime<=:etime";
			}
			sql = sql + " order by WScore asc";
			Query query = session.createQuery(sql);
			if (unit != null && !unit.equals("")) {
				query.setParameter("unit", unit);
			}
			if (post != null && !post.equals("")) {
				query.setParameter("post", post);
			}
			if (title != null && !title.equals("")) {
				query.setParameter("title", "%" + title + "%");
			}
			if (btime != null && !btime.equals("")) {
				query.setParameter("btime", time1);
			}
			if (etime != null && !etime.equals("")) {
				query.setParameter("etime", time2);
			}
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

	public List queryByName(String name) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Work where w_usernum  like '%" + name
							+ "%' ORDER BY W_Score asc");
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

	public List queryByName1(String name) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Work where WName=? order by WScore");
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

	public List queryByName2(String name) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Work where WTitle=?");
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

	public List queryByUserdept(String userdept) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Work where WUnit=? order by WScore asc");
			query.setString(0, userdept);
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
