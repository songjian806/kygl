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
import com.keyan.hibernate.form.Mode;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;
import com.keyan.struts.form.ModeForm;

public class ModeDao {

	public void insert(Mode mode) {
		Session session = null;
		Transaction tx = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			session.save(mode);
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

	public void update(ModeForm modeForm) {
		Session session = null;
		Transaction tx = null;
		Mode mode = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Date d = new Date();
			mode = (Mode) session
					.get(Mode.class, new Integer(modeForm.getId()));
			mode.setBeizhu(modeForm.getBeizhu());
			mode.setBokuanzt(modeForm.getBokuanzt());
			mode.setFenlei(modeForm.getFenlei());
			mode.setJFName(modeForm.getJf_name());
			mode.setJFScore(modeForm.getJf_score());
			mode.setPici(modeForm.getPici());
			mode.setrenyuan(modeForm.getRenyuan());
			mode.setXmjingfei(modeForm.getXmjingfei());
			mode.setXmname(modeForm.getXmname());
			session.saveOrUpdate(mode);
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
				query = session.createQuery("from Mode where  t_time>=" + time1
						+ " and t_time>=" + time2
						+ " and t_score = '院审通过' and t_score = '校审通过'");
			} else {
				query = session.createQuery("from Mode where t_unit='" + yuanxi
						+ "' and t_time>=" + time1 + " and t_time>=" + time2
						+ " and t_score = '院审通过' and t_score = '校审通过'");
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
				query = session.createQuery("from Mode");
			else if (level.equals("1"))
				query = session
						.createQuery("from Mode where jf_score = '未审核' or jf_score = '院审通过' order by JFScore asc");
			else
				query = session
						.createQuery("from Mode where jf_score = '院审通过' or jf_score = '校审通过' order by JFScore asc");
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
				query = session.createQuery("from Mode");
			else if (level.equals("1"))
				query = session
						.createQuery("from Mode where jf_score = '未审核' or jf_score = '院审通过' order by JfScore asc");
			else
				query = session
						.createQuery("from Mode where (JF_score = '院审通过' or JF_score = '校审通过') and (xmname like '%"
								+ word
								+ "%' or jf_name like '%"
								+ word
								+ "%'  or renyuan like '%"
								+ word
								+ "%') order by JFScore asc");

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

			Query query = session.createQuery("from Mode where jf_name = '"
					+ name + "' and (xmname like '%" + word
					+ "%' or  renyuan like '%" + word
					+ "%' ) order by JFScore asc");
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

			Query query = session.createQuery("from Mode where pici = '" + unit
					+ "' and (xmname like '%" + word + "%' or  renyuan like '%"
					+ word + "%'  ) order by JFScore asc");

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
		Mode mode = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			mode = (Mode) session.get(Mode.class, id);
			session.delete(mode);
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
					.createQuery("from Mode as model where (model.TTime between :btime and :etime) and (model.TName = :name or model.Second = :name or model.Third=:name or model.TOthers like '%"
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

	public void update1(Mode mode) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(mode);
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

	public Mode queryId(Integer id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Mode mode = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			mode = (Mode) session.get(Mode.class, id);

			tx.commit();

		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {

			HibernateSessionFactory.closeSession();
		}
		return mode;
		}

	public List queryByUserdept(String userdept) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Mode where PiCi=? order by JFScore asc");
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

	public List queryByName(String name) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Mode where musernum=? order by JFScore asc");
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
			Query query = session.createQuery("from Mode where TTitle=?");
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
			String sql = "from Mode";
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
			String sql = "from Mode";
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
			String sql = "from Mode where (t_score = '院审通过' or t_score = '校审通过')";
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
			String sql = "from Mode where (t_unit = '" + unit + "')";
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
			String sql = "from Mode where (t_name='" + username + "')";
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
				query.setTimestamp("btime", time1);
			}
			if (etime != null && !etime.equals("")) {
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
