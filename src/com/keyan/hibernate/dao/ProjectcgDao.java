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
import com.keyan.hibernate.form.Projectcg;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;
import com.keyan.struts.form.ProjectcgForm;

public class ProjectcgDao {

	public void insert(Projectcg projectcg) {
		Session session = null;
		Transaction tx = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			session.save(projectcg);
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

	public void update(ProjectcgForm projectcgForm) {
		Session session = null;
		Transaction tx = null;
		Projectcg projectcg = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			projectcg = (Projectcg) session.get(Projectcg.class,
					projectcgForm.getId());

			projectcg.setPName(projectcgForm.getPName());
			projectcg.setPPost(projectcgForm.getPPost());
			projectcg.setPDept(projectcgForm.getPDept());
			projectcg.setPTitle(projectcgForm.getPTitle());
			projectcg.setPUnit(projectcgForm.getPUnit());
			projectcg.setPId(projectcgForm.getPId());

			projectcg.setPScore(projectcgForm.getPScore());
			projectcg.setPOthers(projectcgForm.getPOthers());
			projectcg.setPRemarks(projectcgForm.getPRemarks());
			projectcg.setSecond(projectcgForm.getPSecond());
			projectcg.setThird(projectcgForm.getPThird());

			session.saveOrUpdate(projectcg);
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

	public void update(ProjectcgForm projectcgForm, String pusernum) {
		Session session = null;
		Transaction tx = null;
		Projectcg projectcg = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			projectcg = (Projectcg) session.get(Projectcg.class,
					projectcgForm.getId());

			projectcg.setPName(projectcgForm.getPName());
			projectcg.setPPost(projectcgForm.getPPost());
			projectcg.setPDept(projectcgForm.getPDept());
			projectcg.setPTitle(projectcgForm.getPTitle());
			projectcg.setPUnit(projectcgForm.getPUnit());
			projectcg.setPId(projectcgForm.getPId());

			projectcg.setPScore(projectcgForm.getPScore());
			projectcg.setPOthers(projectcgForm.getPOthers());
			projectcg.setPRemarks(projectcgForm.getPRemarks());
			projectcg.setSecond(projectcgForm.getPSecond());
			projectcg.setThird(projectcgForm.getPThird());
			projectcg.setPusernum(pusernum + ","
					+ projectcgForm.getPSecondnum() + ","
					+ projectcgForm.getPThirdnum() + ","
					+ projectcgForm.getPOthersnum());

			session.saveOrUpdate(projectcg);
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

	public void update1(Projectcg projectcg) {
		Session session = null;
		Transaction tx = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			session.saveOrUpdate(projectcg);
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
				query = session.createQuery("from Projectcg where p_time>="
						+ time1 + " and p_time>=" + time2
						+ " and p_score = '院审通过' and p_score = '校审通过'");
			} else {
				query = session.createQuery("from Projectcg where p_dept='"
						+ yuanxi + "' and p_time>=" + time1 + " and p_time>="
						+ time2 + " and p_score = '院审通过' and p_score = '校审通过'");
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
			// query = session.createQuery("from Projectcg");
			if (level.equals("0"))
				query = session.createQuery("from Projectcg");
			else if (level.equals("1"))
				query = session
						.createQuery("from Projectcg where p_score = '未审核' or p_score = '院审通过' order by PScore asc");
			else
				query = session
						.createQuery("from Projectcg where p_score = '院审通过' or p_score = '校审通过' order by PScore asc");

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
				query = session.createQuery("from Projectcg");
			else if (level.equals("1"))
				query = session
						.createQuery("from Projectcg where p_score = '未审核' or p_score = '院审通过' order by PScore asc");
			else
				query = session
						.createQuery("from Projectcg where (p_score = '院审通过' or p_score = '校审通过') and (p_name like '%"
								+ word
								+ "%' or p_dept like '%"
								+ word
								+ "%' or p_title like '%"
								+ word
								+ "%' or p_post like '%"
								+ word
								+ "%' or p_others like '%"
								+ word
								+ "%') order by PScore asc");

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

			Query query = session.createQuery("from Projectcg where p_name = '"
					+ name + "' and ( p_title like '%" + word
					+ "%' or  p_others like '%" + word
					+ "%' ) order by PScore asc");

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

			Query query = session.createQuery("from Projectcg where p_dept = '"
					+ unit + "' and ( p_title like '%" + word
					+ "%' or  p_name like '%" + word + "%' or  p_post like '%"
					+ word + "%' ) order by PScore asc");

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

		Session session = null;
		Transaction tx = null;
		Projectcg projectcg = null;

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			projectcg = (Projectcg) session.get(Projectcg.class, id);
			session.delete(projectcg);
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

	public int queryByUserdept(String userdept, int nian) {
		Session session = null;
		Transaction tx = null;
		int count = 0;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("select count(*) from Projectcg as model where (model.PTime between :btime and :etime)and (model.PDept = :name)");
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
					.createQuery("select count(*) from Projectcg as model where (model.PTime between :btime and :etime) ");
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

	public static List findByUserNian(Keyanuser user, String nian) {
		// TODO Auto-generated method stubSession session = null;
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Projectcg as model where (model.PTime between :btime and :etime) and (model.Pusernum   like '%"
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

	public static List findByUserNian(Keyanuser user, int nian) {
		// TODO Auto-generated method stubSession session = null;
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();

		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Projectcg as model where (model.PTime between :btime and :etime) and (model.PName = :name or model.Second = :name or model.Third=:name or model.POthers like '%"
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

	public Projectcg queryId(Integer id) { 
		Session session = null;
		Transaction tx = null;
		Projectcg projectcg = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			projectcg = (Projectcg) session.get(Projectcg.class, id);
			tx.commit();

		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {

			HibernateSessionFactory.closeSession();
		}
		return projectcg;
	}

	public List queryByName(String name, String dept, String post,
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
			String sql = "from Projectcg";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " where PName=:name";
				i = 1;
			}

			if (dept != null && !dept.equals("")) {
				if (i == 0) {
					sql = sql + " where PDept=:dept";
					i = 1;
				} else {
					sql = sql + " and PDept=:dept";
				}
				i = 1;
			}

			if (post != null && !post.equals("")) {
				if (i == 0) {
					sql = sql + " where PPost=:post";
					i = 1;
				} else {
					sql = sql + " and PPost=:post";
				}
				i = 1;
			}

			if (title != null && !title.equals("")) {
				if (i == 0) {
					sql = sql + " where PTitle=:title";
					i = 1;
				} else {
					sql = sql + " and PTitle=:title";
				}
				i = 1;
			}
			if (btime != null && !btime.equals("")) {
				if (i == 0) {
					sql = sql + " where PTime>=:btime";
					i = 1;
				} else {
					sql = sql + " and PTime>=:btime";
				}
				i = 1;
			}
			if (etime != null && !etime.equals("")) {
				if (i == 0) {
					sql = sql + " where PTime<=:etime";
					i = 1;
				} else {
					sql = sql + " and PTime<=:etime";
				}
				i = 1;
			}
			sql = sql + " order by PScore asc";

			Query query = session.createQuery(sql);
			if (name != null && !name.equals("")) {
				query.setParameter("name", name);

			}
			if (dept != null && !dept.equals("")) {
				query.setParameter("dept", dept);

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

	public List queryByNamef(String name, String dept, String post,
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
			String sql = "from Projectcg";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " where PName=:name";
				i = 1;
			}

			if (dept != null && !dept.equals("")) {
				if (i == 0) {
					sql = sql + " where PDept=:dept";
					i = 1;
				} else {
					sql = sql + " and PDept=:dept";
				}
				i = 1;
			}

			if (post != null && !post.equals("")) {
				if (i == 0) {
					sql = sql + " where PPost=:post";
					i = 1;
				} else {
					sql = sql + " and PPost=:post";
				}
				i = 1;
			}

			if (title != null && !title.equals("")) {
				if (i == 0) {
					sql = sql + " where PRemarks like :title";
					i = 1;
				} else {
					sql = sql + " and PRemarks like :title";
				}
				i = 1;
			}
			if (btime != null && !btime.equals("")) {
				if (i == 0) {
					sql = sql + " where PTime>=:btime";
					i = 1;
				} else {
					sql = sql + " and PTime>=:btime";
				}
				i = 1;
			}
			if (etime != null && !etime.equals("")) {
				if (i == 0) {
					sql = sql + " where PTime<=:etime";
					i = 1;
				} else {
					sql = sql + " and PTime<=:etime";
				}
				i = 1;
			}
			sql = sql + " order by PScore asc";

			Query query = session.createQuery(sql);
			if (name != null && !name.equals("")) {
				query.setParameter("name", name);

			}
			if (dept != null && !dept.equals("")) {
				query.setParameter("dept", dept);

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
			String sql = "from Projectcg where (p_score = '院审通过' or p_score = '校审通过')";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " and PName like:name";

			}

			if (unit != null && !unit.equals("")) {

				sql = sql + " and PUnit like:unit";

			}

			if (post != null && !post.equals("")) {

				sql = sql + " and PPost=:post";

			}

			if (title != null && !title.equals("")) {

				sql = sql + " and PTitle like:title";

			}
			if (btime != null && !btime.equals("")) {

				sql = sql + " and PTime>=:btime";

			}
			if (etime != null && !etime.equals("")) {

				sql = sql + " and PTime<=:etime";

			}
			sql = sql + " order by PScore asc";

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
			String sql = "from Projectcg where (p_dept = '" + unit + "')";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " and PName like:name";
			}

			if (post != null && !post.equals("")) {
				sql = sql + " and PPost=:post";

			}

			if (title != null && !title.equals("")) {
				sql = sql + " and PTitle like:title";

			}
			if (btime != null && !btime.equals("")) {
				sql = sql + " and PTime>=:btime";

			}
			if (etime != null && !etime.equals("")) {
				sql = sql + " and PTime<=:etime";

			}
			sql = sql + " order by PScore asc";

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
			String sql = "from Projectcg where (p_name = '" + username + "')";
			int i = 0;

			if (unit != null && !unit.equals("")) {

				sql = sql + " and PUnit=:unit";

			}

			if (post != null && !post.equals("")) {

				sql = sql + " and PPost=:post";

			}

			if (title != null && !title.equals("")) {

				sql = sql + " and PTitle like:title";

			}
			if (btime != null && !btime.equals("")) {

				sql = sql + " and PTime>=:btime";

			}
			if (etime != null && !etime.equals("")) {

				sql = sql + " and PTime<=:etime";

			}
			sql = sql + " order by PScore asc";

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
					.createQuery("from  Projectcg   where  P_usernum like '%"
							+ name + "%' ORDER BY P_Score asc");
			// query.setString(0, name);
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
			Query query = session.createQuery("from Projectcg where PTitle=?");
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
					.createQuery("from Projectcg where PDept=? order by PScore asc");
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
