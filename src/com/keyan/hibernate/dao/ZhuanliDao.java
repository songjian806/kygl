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
import com.keyan.hibernate.form.Zhuanli;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;
import com.keyan.struts.form.ZhuanliForm;

public class ZhuanliDao {

	public void insert(Zhuanli zhuanli) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.save(zhuanli);
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

	public void update(ZhuanliForm zhuanliForm, String zusernum) {
		Session session = null;
		Transaction tx = null;
		Zhuanli zhuanli = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			zhuanli = (Zhuanli) session.get(Zhuanli.class, zhuanliForm.getId());
			zhuanli.setZName(zhuanliForm.getZName());
			zhuanli.setZPost(zhuanliForm.getZPost());
			zhuanli.setZDept(zhuanliForm.getZDept());
			zhuanli.setZTitle(zhuanliForm.getZTitle());
			zhuanli.setZType(zhuanliForm.getZType());
			zhuanli.setZId(zhuanliForm.getZId());
			zhuanli.setZState(zhuanliForm.getZState());
			zhuanli.setZNum(zhuanliForm.getZNum());
			zhuanli.setZAward(zhuanliForm.getZAward());
			zhuanli.setZOthers(zhuanliForm.getZOthers());
			zhuanli.setZScore(zhuanliForm.getZScore());
			zhuanli.setZRemarks(zhuanliForm.getZRemarks());
			zhuanli.setSecond(zhuanliForm.getZSecond());
			zhuanli.setThird(zhuanliForm.getZThird());
			zhuanli.setZusernum(zusernum + "," + zhuanliForm.getZSecondnum()
					+ "," + zhuanliForm.getZThirdnum() + ","
					+ zhuanliForm.getZOthersnum());
			session.saveOrUpdate(zhuanli);
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

	public void update(ZhuanliForm zhuanliForm) {
		Session session = null;
		Transaction tx = null;
		Zhuanli zhuanli = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			zhuanli = (Zhuanli) session.get(Zhuanli.class, zhuanliForm.getId());
			zhuanli.setZName(zhuanliForm.getZName());
			zhuanli.setZPost(zhuanliForm.getZPost());
			zhuanli.setZDept(zhuanliForm.getZDept());
			zhuanli.setZTitle(zhuanliForm.getZTitle());
			zhuanli.setZType(zhuanliForm.getZType());
			zhuanli.setZId(zhuanliForm.getZId());
			zhuanli.setZState(zhuanliForm.getZState());
			zhuanli.setZNum(zhuanliForm.getZNum());
			zhuanli.setZAward(zhuanliForm.getZAward());
			zhuanli.setZOthers(zhuanliForm.getZOthers());
			zhuanli.setZScore(zhuanliForm.getZScore());
			zhuanli.setZRemarks(zhuanliForm.getZRemarks());
			zhuanli.setSecond(zhuanliForm.getZSecond());
			zhuanli.setThird(zhuanliForm.getZThird());
			session.saveOrUpdate(zhuanli);
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

	public void update1(Zhuanli zhuanli) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(zhuanli);
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
				query = session.createQuery("from Zhuanli");
			else if (level.equals("1"))
				query = session
						.createQuery("from Zhuanli where z_score = '未审核' or z_score = '院审通过' order by ZScore asc");
			else
				query = session
						.createQuery("from Zhuanli where z_score = '院审通过' or z_score = '校审通过' order by ZScore asc");			
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
			Query query = session
					.createQuery("from Zhuanli where z_title like '%" + word
							+ "%' or z_name like '%" + word
							+ "%' or z_dept like '%" + word
							+ "%' order by ZScore asc");
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
			Query query = session.createQuery("from Zhuanli where z_name = '"
					+ name + "' and ( z_title like '%" + word
					+ "%' or  z_others like '%" + word
					+ "%' ) order by ZScore asc");
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
			Query query = session.createQuery("from Zhuanli where z_dept = '"
					+ unit + "' and ( z_title like '%" + word
					+ "%' or  z_name like '%" + word + "%' or  z_post like '%"
					+ word + "%' ) order by ZScore asc");
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
		Zhuanli zhuanli = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			zhuanli = (Zhuanli) session.get(Zhuanli.class, id);
			session.delete(zhuanli);
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

	public static List findByUserNian(Keyanuser user, int nian) {
		// TODO Auto-generated method stubSession session = null;
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Zhuanli as model where (model.ZTime between :btime and :etime) and (model.ZName = :name or model.Second = :name or model.Third=:name or model.ZOthers like '%"
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

	public int queryByUserdept(String userdept, int nian) {
		Session session = null;
		Transaction tx = null;
		int count = 0;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("select count(*) from Zhuanli as model where (model.ZTime between :btime and :etime)and (model.ZDept = :name)");
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

	public static int findByUserNian(int nian) {
		// TODO Auto-generated method stubSession session = null;
		Session session = null;
		Transaction tx = null;		
		int count = 0;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("select count(*) from Zhuanli as model where (model.ZTime between :btime and :etime) ");
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
					.createQuery("from Zhuanli as model where (model.ZTime between :btime and :etime) and (model.Zusernum like '%"
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

	public Zhuanli queryId(Integer id) { 
		Session session = null;
		Transaction tx = null;
		Zhuanli zhuanli = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			zhuanli = (Zhuanli) session.get(Zhuanli.class, id);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return zhuanli;
	}

	public List queryByName(String name) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session
					.createQuery("from Zhuanli where z_usernum like '%" + name
							+ "%' ORDER BY z_Score asc");
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
			Query query = session.createQuery("from Zhuanli where ZTitle=?");
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
					.createQuery("from Zhuanli where ZDept=? order by ZScore asc");
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
			String sql = "from Zhuanli";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " where ZName=:name";
				i = 1;
			}

			if (unit != null && !unit.equals("")) {
				if (i == 0) {
					sql = sql + " where ZDept=:unit";
					i = 1;
				} else {
					sql = sql + " and ZDept=:unit";
				}
				i = 1;
			}

			if (post != null && !post.equals("")) {
				if (i == 0) {
					sql = sql + " where ZPost=:post";
					i = 1;
				} else {
					sql = sql + " and ZPost=:post";
				}
				i = 1;
			}

			if (title != null && !title.equals("")) {
				if (i == 0) {
					sql = sql + " where ZTitle=:title";
					i = 1;
				} else {
					sql = sql + " and ZTitle=:title";
				}
				i = 1;
			}
			if (btime != null && !btime.equals("")) {
				if (i == 0) {
					sql = sql + " where ZTime>=:btime";
					i = 1;
				} else {
					sql = sql + " and ZTime>=:btime";
				}
				i = 1;
			}
			if (etime != null && !etime.equals("")) {
				if (i == 0) {
					sql = sql + " where ZTime<=:etime";
					i = 1;
				} else {
					sql = sql + " and ZTime<=:etime";
				}
				i = 1;
			}
			sql = sql + " order by ZScore asc";

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
			String sql = "from Zhuanli";
			int i = 0;
			if (name != null && !name.equals("")) {
				sql = sql + " where ZName=:name";
				i = 1;
			}

			if (unit != null && !unit.equals("")) {
				if (i == 0) {
					sql = sql + " where ZDept=:unit";
					i = 1;
				} else {
					sql = sql + " and ZDept=:unit";
				}
				i = 1;
			}

			if (post != null && !post.equals("")) {
				if (i == 0) {
					sql = sql + " where ZPost=:post";
					i = 1;
				} else {
					sql = sql + " and ZPost=:post";
				}
				i = 1;
			}

			if (title != null && !title.equals("")) {
				if (i == 0) {
					sql = sql + " where ZRemarks like :title";
					i = 1;
				} else {
					sql = sql + " and ZRemarks like :title";
				}
				i = 1;
			}
			if (btime != null && !btime.equals("")) {
				if (i == 0) {
					sql = sql + " where ZTime>=:btime";
					i = 1;
				} else {
					sql = sql + " and ZTime>=:btime";
				}
				i = 1;
			}
			if (etime != null && !etime.equals("")) {
				if (i == 0) {
					sql = sql + " where ZTime<=:etime";
					i = 1;
				} else {
					sql = sql + " and ZTime<=:etime";
				}
				i = 1;
			}
			sql = sql + " order by ZScore asc";

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
}
