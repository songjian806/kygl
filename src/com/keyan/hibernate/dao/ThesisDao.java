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
import com.keyan.hibernate.form.Thesis;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;
import com.keyan.struts.form.ThesisForm;

public class ThesisDao {

	public void insert(Thesis thesis) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.save(thesis);
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

	public void update(ThesisForm thesisForm) {
		Session session = null;
		Transaction tx = null;
		Thesis thesis = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			thesis = (Thesis) session.get(Thesis.class,
					new Integer(thesisForm.getId()));
			thesis.setTName(thesisForm.getT_name());
			thesis.setTPost(thesisForm.getT_post());
			thesis.setTUnit(thesisForm.getT_unit());
			thesis.setTTitle(thesisForm.getT_title());
			thesis.setTPeriodical(thesisForm.getT_periodical());
			thesis.setTCnid(thesisForm.getT_CNId());
			thesis.setTIssnid(thesisForm.getT_ISSNId());
			thesis.setTOthers(thesisForm.getT_others());
			thesis.setTScore(thesisForm.getT_score());
			thesis.setTRemarks(thesisForm.getT_remarks());
			thesis.setSecond(thesisForm.getSecond());
			thesis.setThird(thesisForm.getThird());
			session.saveOrUpdate(thesis);
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

	public void update(ThesisForm thesisForm, String tusernum) {
		Session session = null;
		Transaction tx = null;
		Thesis thesis = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			thesis = (Thesis) session.get(Thesis.class,
					new Integer(thesisForm.getId()));
			thesis.setTName(thesisForm.getT_name());
			thesis.setTPost(thesisForm.getT_post());
			thesis.setTUnit(thesisForm.getT_unit());
			thesis.setTTitle(thesisForm.getT_title());
			thesis.setTPeriodical(thesisForm.getT_periodical());
			thesis.setTCnid(thesisForm.getT_CNId());
			thesis.setTIssnid(thesisForm.getT_ISSNId());
			thesis.setTOthers(thesisForm.getT_others());
			thesis.setTScore(thesisForm.getT_score());
			thesis.setTRemarks(thesisForm.getT_remarks());
			thesis.setSecond(thesisForm.getSecond());
			thesis.setThird(thesisForm.getThird());
			thesis.setTusernum(tusernum + "," + thesisForm.getSecondnum() + ","
					+ thesisForm.getThirdnum() + ","
					+ thesisForm.getT_othersnum());
			session.saveOrUpdate(thesis);
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
			if (yuanxi.equals("全部")) {
				query = session.createQuery("from Thesis where  t_time>="
						+ time1 + " and t_time>=" + time2
						+ " and t_score = '院审通过' and t_score = '校审通过'");
			} else {
				query = session.createQuery("from Thesis where t_unit='"
						+ yuanxi + "' and t_time>=" + time1 + " and t_time>="
						+ time2 + " and t_score = '院审通过' and t_score = '校审通过'");
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

	public List query(String level) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = null;
			if (level.equals("0"))
				query = session.createQuery("from Thesis");
			else if (level.equals("1"))
				query = session
						.createQuery("from Thesis where t_score = '未审核' or t_score = '院审通过' order by TScore asc");
			else
				query = session
						.createQuery("from Thesis where t_score = '院审通过' or t_score = '校审通过' order by TScore asc");
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
				query = session.createQuery("from Thesis");
			else if (level.equals("1"))
				query = session
						.createQuery("from Thesis where t_score = '未审核' or t_score = '院审通过' order by TScore asc");
			else
				query = session
						.createQuery("from Thesis where (t_score = '院审通过' or t_score = '校审通过') and (t_name like '%"
								+ word
								+ "%' or t_unit like '%"
								+ word
								+ "%' or t_title like '%"
								+ word
								+ "%' or t_others like '%"
								+ word
								+ "%') order by TScore asc");

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

			Query query = session.createQuery("from Thesis where t_name = '"
					+ name + "' and ( t_title like '%" + word
					+ "%' or  t_others like '%" + word
					+ "%' ) order by TScore asc");
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
			Query query = session.createQuery("from Thesis where t_unit = '"
					+ unit + "' and ( t_title like '%" + word
					+ "%' or  t_name like '%" + word + "%' or  t_post like '%"
					+ word + "%' ) order by TScore asc");
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
		Thesis thesis = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			thesis = (Thesis) session.get(Thesis.class, id);
			session.delete(thesis);
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
					.createQuery("from Thesis as model where (model.TTime between :btime and :etime) and (model.Tusernum like '%"
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

	public static int findByUserNian(Integer nian) {
		// TODO Auto-generated method stubSession session = null;
		Session session = null;
		Transaction tx = null;
		int count = 0;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("select count(*) from Thesis as model where (model.TTime between :btime and :etime) ");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			query.setTimestamp("btime", df.parse(nian + "-01-01"));
			query.setTimestamp("etime", df.parse(nian + "-12-31"));
			count = Integer.valueOf(query.uniqueResult().toString());
			query = null;
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
					.createQuery("from Thesis as model where (model.TTime between :btime and :etime) and (model.TName = :name or model.Second = :name or model.Third=:name or model.Tusernum like '%"
							+ user.getUsername() + "%')");
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

	public void update1(Thesis thesis) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			session.saveOrUpdate(thesis);
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

	public Thesis queryId(Integer id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Thesis thesis = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			thesis = (Thesis) session.get(Thesis.class, id);

			tx.commit();

		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {

			HibernateSessionFactory.closeSession();
		}
		return thesis;
	}

	public List queryByUserdept(String userdept) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Thesis where TUnit=? order by TScore asc");
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

	public int queryByUserdept(String userdept, int nian) {
		Session session = null;
		Transaction tx = null;
		int count = 0;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("select count(*) from Thesis as model where (model.TTime between :btime and :etime)and (model.TUnit = :name)");
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

	public List queryByName(String name) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			System.out.println("name" + name);
			Query query = session
					.createQuery("from Thesis where  t_usernum like '%" + name
							+ "%' ORDER BY T_Score asc");
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
			Query query = session.createQuery("from Thesis where TTitle=?");
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
			String sql = "from Thesis";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " where TName=:name";
				i = 1;
			}

			if (unit != null && !unit.equals("")) {
				if (i == 0) {
					sql = sql + " where TUnit=:unit";
					i = 1;
				} else {
					sql = sql + " and TUnit=:unit";
				}
				i = 1;
			}

			if (post != null && !post.equals("")) {
				if (i == 0) {
					sql = sql + " where TPost=:post";
					i = 1;
				} else {
					sql = sql + " and TPost=:post";
				}
				i = 1;
			}

			if (title != null && !title.equals("")) {
				if (i == 0) {
					sql = sql + " where TTitle=:title";
					i = 1;
				} else {
					sql = sql + " and TTitle=:title";
				}
				i = 1;
			}
			if (btime != null && !btime.equals("")) {
				if (i == 0) {
					sql = sql + " where TTime>=:btime";
					i = 1;
				} else {
					sql = sql + " and TTime>=:btime";
				}
				i = 1;
			}
			if (etime != null && !etime.equals("")) {
				if (i == 0) {
					sql = sql + " where TTime<=:etime";
					i = 1;
				} else {
					sql = sql + " and TTime<=:etime";
				}
				i = 1;
			}
			sql = sql + " order by TScore asc";

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
			String sql = "from Thesis";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " where TName=:name";
				i = 1;
			}

			if (unit != null && !unit.equals("")) {
				if (i == 0) {
					sql = sql + " where TUnit=:unit";
					i = 1;
				} else {
					sql = sql + " and TUnit=:unit";
				}
				i = 1;
			}

			if (post != null && !post.equals("")) {
				if (i == 0) {
					sql = sql + " where TPost=:post";
					i = 1;
				} else {
					sql = sql + " and TPost=:post";
				}
				i = 1;
			}

			if (title != null && !title.equals("")) {
				if (i == 0) {
					sql = sql + " where TRemarks like :title";
					i = 1;
				} else {
					sql = sql + " and TRemarks like :title";
				}
				i = 1;
			}
			if (btime != null && !btime.equals("")) {
				if (i == 0) {
					sql = sql + " where TTime>=:btime";
					i = 1;
				} else {
					sql = sql + " and TTime>=:btime";
				}
				i = 1;
			}
			if (etime != null && !etime.equals("")) {
				if (i == 0) {
					sql = sql + " where TTime<=:etime";
					i = 1;
				} else {
					sql = sql + " and TTime<=:etime";
				}
				i = 1;
			}
			sql = sql + " order by TScore asc";

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
			String sql = "from Thesis where (t_score = '院审通过' or t_score = '校审通过')";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " and TName like:name";

			}

			if (unit != null && !unit.equals("")) {

				sql = sql + " and TUnit like:unit";

			}

			if (post != null && !post.equals("")) {

				sql = sql + " and TPost=:post";

			}

			if (title != null && !title.equals("")) {

				sql = sql + " and TTitle like:title";

			}
			if (btime != null && !btime.equals("")) {

				sql = sql + " and TTime>=:btime";

			}
			if (etime != null && !etime.equals("")) {

				sql = sql + " and TTime<=:etime";

			}
			sql = sql + " order by TScore asc";

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
			String sql = "from Thesis where (t_unit = '" + unit + "')";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " and TName like:name";

			}

			if (post != null && !post.equals("")) {

				sql = sql + " and TPost=:post";

			}

			if (title != null && !title.equals("")) {

				sql = sql + " and TTitle like:title";

			}
			if (btime != null && !btime.equals("")) {

				sql = sql + " and TTime>=:btime";

			}
			if (etime != null && !etime.equals("")) {

				sql = sql + " and TTime<=:etime";

			}
			sql = sql + " order by TScore asc";

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
			String sql = "from Thesis where (t_name='" + username + "')";
			int i = 0;

			if (unit != null && !unit.equals("")) {

				sql = sql + " and TUnit=:unit";
			}

			if (post != null && !post.equals("")) {

				sql = sql + " and TPost=:post";

			}

			if (title != null && !title.equals("")) {

				sql = sql + " and TTitle like:title";

			}
			if (btime != null && !btime.equals("")) {

				sql = sql + " and TTime>=:btime";

			}
			if (etime != null && !etime.equals("")) {

				sql = sql + " and TTime<=:etime";

			}
			sql = sql + " order by TScore asc";

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
				// query.setParameter("btime", time1);
				query.setTimestamp("btime", time1);

			}
			if (etime != null && !etime.equals("")) {
				// query.setParameter("etime", time2);
				query.setTimestamp("etime", time2);

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
}
