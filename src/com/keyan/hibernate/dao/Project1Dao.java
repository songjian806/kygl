package com.keyan.hibernate.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.keyan.hibernate.form.Project1;
import com.keyan.hibernate.hibernateSessionFactory.HibernateSessionFactory;
import com.keyan.struts.form.Project1Form;

public class Project1Dao {

	public void insert(Project1 project1) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.save(project1);
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

	public void insert11(Project1 project1, Integer id) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			project1 = (Project1) session.get(Project1.class, id);
			session.saveOrUpdate(project1);
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
		Project1 project1 = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			project1 = (Project1) session.get(Project1.class, id);
			session.delete(project1);
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

	public List findall88(String name) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Project1 where pname= '"
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

	public List queryByName(String pnum, String pname, String pcome,
			String pclassify, String pcontrol, String pdept, String pform,
			String pstate1, String pstate2, String pstar1, String pstar2,
			String userdept) {
		Session session = null;
		Transaction tx = null;
		List list = new ArrayList();
		try {
			if (userdept.equals("")) {
				session = HibernateSessionFactory.getSession();
				tx = session.beginTransaction();
				String sql = "from Project1 ";
				int i = 0;
				if (pnum != null && !pnum.equals("")) {
					sql = sql + " where pnum='" + pnum + "'";
					i = 1;
				}

				if (pname != null && !pname.equals("")) {
					if (i == 0) {
						sql = sql + " where pname='" + pname + "'";
						i = 1;
					} else {
						sql = sql + " and pname='" + pname + "'";
					}
					i = 1;
				}

				if (pcome != null && !pcome.equals("")) {
					if (i == 0) {
						sql = sql + " where pcome='" + pcome + "'";
						i = 1;
					} else {
						sql = sql + " and pcome='" + pcome + "'";
					}
					i = 1;
				}

				if (pclassify != null && !pclassify.equals("")) {
					if (i == 0) {
						sql = sql + " where pclassify='" + pclassify + "'";
						i = 1;
					} else {
						sql = sql + " and pclassify='" + pclassify + "'";
					}
					i = 1;
				}
				if (pcontrol != null && !pcontrol.equals("")) {
					if (i == 0) {
						sql = sql + " where pcontrol='" + pcontrol + "'";
						i = 1;
					} else {
						sql = sql + " and pcontrol='" + pcontrol + "'";
					}
					i = 1;
				}
				if (pdept != null && !pdept.equals("")) {
					if (i == 0) {
						sql = sql + " where pdept='" + pdept + "'";
						i = 1;
					} else {
						sql = sql + " and pdept='" + pdept + "'";
					}
					i = 1;
				}
				if (pform != null && !pform.equals("")) {
					if (i == 0) {
						sql = sql + " where pform='" + pform + "'";
						i = 1;
					} else {
						sql = sql + " and pform='" + pform + "'";
					}
					i = 1;
				}
				if (pstate1 != null && !pstate1.equals("")) {
					if (i == 0) {
						sql = sql + " where pstate1='" + pstate1 + "'";
						i = 1;
					} else {
						sql = sql + " and pstate1='" + pstate1 + "'";
					}
					i = 1;
				}
				if (pstate2 != null && !pstate2.equals("")) {
					if (i == 0) {
						sql = sql + " where pstate2='" + pstate2 + "'";
						i = 1;
					} else {
						sql = sql + " and pstate2='" + pstate2 + "'";
					}
					i = 1;
				}
				if (pstar1 != null && !pstar1.equals("") && pstar2 != null
						&& !pstar2.equals("")) {
					if (i == 0) {
						sql = sql + " where pstar like :time";
						i = 1;
					} else {
						sql = sql + " and pstar like :time ";

					}
					i = 1;
				}
				Query query = session.createQuery(sql);
				if (pstar1 != null && !pstar1.equals("") && pstar2 != null
						&& !pstar2.equals("")) {

					query.setString("time", "%" + pstar1 + "-" + pstar2 + "%");
				}

				list = query.list();
				query = null;
			} else if (userdept != "") {
				session = HibernateSessionFactory.getSession();
				tx = session.beginTransaction();
				String sql = "from Project1 ";
				int i = 0;
				if (pnum != null && !pnum.equals("")) {
					sql = sql + " where pnum='" + pnum + "'";
					i = 1;
				}

				if (pname != null && !pname.equals("")) {
					if (i == 0) {
						sql = sql + " where pname='" + pname + "'";
						i = 1;
					} else {
						sql = sql + " and pname='" + pname + "'";
					}
					i = 1;
				}

				if (pcome != null && !pcome.equals("")) {
					if (i == 0) {
						sql = sql + " where pcome='" + pcome + "'";
						i = 1;
					} else {
						sql = sql + " and pcome='" + pcome + "'";
					}
					i = 1;
				}

				if (pclassify != null && !pclassify.equals("")) {
					if (i == 0) {
						sql = sql + " where pclassify='" + pclassify + "'";
						i = 1;
					} else {
						sql = sql + " and pclassify='" + pclassify + "'";
					}
					i = 1;
				}
				if (pcontrol != null && !pcontrol.equals("")) {
					if (i == 0) {
						sql = sql + " where pcontrol='" + pcontrol + "'";
						i = 1;
					} else {
						sql = sql + " and pcontrol='" + pcontrol + "'";
					}
					i = 1;
				}
				if (pdept != null && !pdept.equals("")) {
					if (i == 0) {
						sql = sql + " where pdept='" + pdept + "'";
						i = 1;
					} else {
						sql = sql + " and pdept='" + pdept + "'";
					}
					i = 1;
				}
				if (pform != null && !pform.equals("")) {
					if (i == 0) {
						sql = sql + " where pform='" + pform + "'";
						i = 1;
					} else {
						sql = sql + " and pform='" + pform + "'";
					}
					i = 1;
				}
				if (pstate1 != null && !pstate1.equals("")) {
					if (i == 0) {
						sql = sql + " where pstate1='" + pstate1 + "'";
						i = 1;
					} else {
						sql = sql + " and pstate1='" + pstate1 + "'";
					}
					i = 1;
				}
				if (pstate2 != null && !pstate2.equals("")) {
					if (i == 0) {
						sql = sql + " where pstate2='" + pstate2 + "'";
						i = 1;
					} else {
						sql = sql + " and pstate2='" + pstate2 + "'";
					}
					i = 1;
				}
				if (pstar1 != null && !pstar1.equals("") && pstar2 != null
						&& !pstar2.equals("")) {
					if (i == 0) {
						sql = sql + " where pstar like :time";
						i = 1;
					} else {
						sql = sql + " and pstar like :time ";

					}
					i = 1;
				}
				sql = sql + "and pdept='" + userdept + "'";
				Query query = session.createQuery(sql);
				if (pstar1 != null && !pstar1.equals("") && pstar2 != null
						&& !pstar2.equals("")) {

					query.setString("time", "%" + pstar1 + "-" + pstar2 + "%");
				}

				list = query.list();
				query = null;
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
		return list;
	}

	public List findall() {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Project1");
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

	public List findall2(String userclasify, String userdept, int username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where pstatus=null and pstate1='系审通过'");
				list = query.list();
				query = null;
			} else if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus=null and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			} else if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus=null and pdept='"
								+ userdept + "'and pid='" + username + "'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall2(String userclasify, String userdept, String username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where pstatus=null and pstate1='系审通过'");
				list = query.list();
				query = null;
			} else if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus=null and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			} else if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus=null and pdept='"
								+ userdept + "'and pid='" + username + "'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall111(String userclasify, String userdept, Integer username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='立项' and pstate3='立项1') or (pstatus='立项' and pstate3='立项2')or (pstatus='立项' and pstate3='立项22')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='立项' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='立项' and pdept='"
								+ userdept + "'and pid = '" + username + "'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall111(String userclasify, String userdept, String username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='立项' and pstate3='立项1') or (pstatus='立项' and pstate3='立项2')or (pstatus='立项' and pstate3='立项22')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='立项' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='立项' and pdept='"
								+ userdept
								+ "'and pusernum like '%"
								+ username
								+ "%'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall112(String userclasify, String userdept, Integer username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='中检' and pstate3='中检1') or (pstatus='中检' and pstate3='中检2')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='中检' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='中检' and pdept='"
								+ userdept + "'and pid = '" + username + "'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall112(String userclasify, String userdept, String username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='中检' and pstate3='中检1') or (pstatus='中检' and pstate3='中检2')or (pstatus='中检' and pstate3='中检22')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='中检' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='中检' and pdept='"
								+ userdept
								+ "'and pusernum like '%"
								+ username
								+ "%'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall113(String userclasify, String userdept, Integer username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='结项' and pstate3='结项1') or (pstatus='结项' and pstate3='结项2')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='结项' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='结项' and pdept='"
								+ userdept + "'and pid = '" + username + "'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall113(String userclasify, String userdept, String username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='结项' and pstate3='结项1') or (pstatus='结项' and pstate3='结项2')or(pstatus='结项' and pstate3='结项22')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='结项' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='结项' and pdept='"
								+ userdept
								+ "'and pusernum like '%"
								+ username
								+ "%'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall114(String userclasify, String userdept, Integer username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='延期' and pstate3='延期1') or (pstatus='延期' and pstate3='延期2')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='延期' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='延期' and pdept='"
								+ userdept + "'and pid= '" + username + "'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall114(String userclasify, String userdept, String username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='延期' and pstate3='延期1') or (pstatus='延期' and pstate3='延期2') or (pstatus='延期' and pstate3='延期22')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='延期' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='延期' and pdept='"
								+ userdept
								+ "'and pusernum like '%"
								+ username
								+ "%'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall115(String userclasify, String userdept, Integer username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='终止' and pstate3='系审通过') or (pstatus='终止' and pstate3='校审通过')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='终止' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='终止' and pdept='"
								+ userdept + "'and pid= '" + username + "'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findall115(String userclasify, String userdept, String username) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			if (userclasify.equals("2")) {
				Query query = session
						.createQuery("from Project1 where (pstatus='终止' and pstate3='系审通过') or (pstatus='终止' and pstate3='校审通过')");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("1")) {
				Query query = session
						.createQuery("from Project1 where pstatus='终止' and pdept='"
								+ userdept + "'");
				list = query.list();
				query = null;
			}
			if (userclasify.equals("0")) {
				Query query = session
						.createQuery("from Project1 where pstatus='终止' and pdept='"
								+ userdept
								+ "'and pusernum like '%"
								+ username
								+ "%'");
				list = query.list();
				query = null;
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
		return list;
	}

	public List findallpici1(String piciname) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Project1 where pnum='"
					+ piciname + "' ");
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

	public List findallpici2(String piciname) {
		Session session = null;
		Transaction tx = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Project1 where pnum='"
					+ piciname + "' and pstate2='校审通过'");
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

	public void update(Project1Form project1Form) {
		Session session = null;
		Transaction tx = null;
		Project1 project1 = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			project1 = (Project1) session.get(Project1.class,
					project1Form.getPname());
			project1.setPclassify(project1Form.getPclassify());
			project1.setPcome(project1Form.getPcome());
			project1.setPcontrol(project1Form.getPcontrol());
			project1.setPdept(project1Form.getPdept());
			project1.setPform(project1Form.getPform());
			project1.setPname(project1Form.getPname());
			project1.setPnum(project1Form.getPnum());
			project1.setPremark(project1Form.getPremark());
			project1.setPstate1(project1Form.getPstate1());
			project1.setPstate2(project1Form.getPstate2());
			session.saveOrUpdate(project1);
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

	public void update2(String pname, String pid, String pusernum) {
		Session session = null;
		Transaction tx = null;
		Project1 project1 = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			project1 = (Project1) session.get(Project1.class, new Integer(pid));
			session.saveOrUpdate(project1);
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

	public void update1(Project1 project1) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(project1);
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
				query = session.createQuery("from Project1");
			else if (level.equals("1"))
				query = session
						.createQuery("from Project1 where p_score = '未审核' or p_score = '院审通过' order by PScore asc");
			else
				query = session
						.createQuery("from Project1 where p_score = '院审通过' or p_score = '校审通过' order by PScore asc");

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
				query = session.createQuery("from Project1");
			else if (level.equals("1"))
				query = session
						.createQuery("from Project1 where p_score = '未审核' or p_score = '院审通过' order by PScore asc");
			else
				query = session
						.createQuery("from Project1 where (p_score = '院审通过' or p_score = '校审通过') and (p_name like '%"
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
			Query query = session.createQuery("from Project1 where p_name = '"
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
			Query query = session.createQuery("from Project1 where p_dept = '"
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

	public Project1 queryId(Integer id) { 
		Session session = null;
		Transaction tx = null;
		Project1 project1 = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			System.out.println("_------------");
			project1 = (Project1) session.get(Project1.class, id);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return project1;
	}

	public Project1 queryOther(String other) { 
		Session session = null;
		Transaction tx = null;
		Project1 project1 = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();

			Query query = session.createQuery("from Project1 where other='"
					+ other + "'");

			List list = query.list();

			if (list.size() > 0) {
				project1 = (Project1) list.get(0);
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
		return project1;
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
			String sql = "from Project1 where (p_score = '院审通过' or p_score = '校审通过')";
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
			String sql = "from Project1 where (p_dept = '" + unit + "')";
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
			String sql = "from Project1 where (p_name = '" + username + "')";
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
					.createQuery("from Project1 where PName=? order by PScore asc");
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
			Query query = session.createQuery("from Project1 where PTitle=?");
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
					.createQuery("from Project1 where PDept=? order by PScore asc");
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
