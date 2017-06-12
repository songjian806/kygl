/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.keyan.struts.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.keyan.hibernate.dao.PointDAO;
import com.keyan.hibernate.dao.PostDAO;
import com.keyan.hibernate.dao.ProjectcgDao;
import com.keyan.hibernate.dao.ThesisDao;
import com.keyan.hibernate.dao.UnitDAO;
import com.keyan.hibernate.dao.UserDAO;
import com.keyan.hibernate.dao.WorkDao;
import com.keyan.hibernate.dao.ZhuanliDao;
import com.keyan.hibernate.form.Depttable;
import com.keyan.hibernate.form.DepttableDAO;
import com.keyan.hibernate.form.Keyanuser;
import com.keyan.hibernate.form.Post;
import com.keyan.hibernate.form.Projectcg;
import com.keyan.hibernate.form.Thesis;
import com.keyan.hibernate.form.Unit;
import com.keyan.hibernate.form.Work;
import com.keyan.hibernate.form.Zhuanli;
import com.keyan.struts.form.GeSearchForm;

/**
 * MyEclipse Struts Creation date: 11-02-2010
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/geSearch" name="geSearchForm" parameter="method"
 *                scope="request" validate="true"
 * @struts.action-forward name="fail" path="/fail.jsp" redirect="true"
 */
public class GeSearchAction extends Action {
	/*
	 * Generated Methods
	 */

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("keyanuser") == null) {
			return mapping.findForward("logout");
		}
		GeSearchForm geSearchForm = (GeSearchForm) form;// TODO Auto-generated
		// method stub

		String method = (String) request.getParameter("method");
		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward();
		ServletContext context = this.servlet.getServletContext();
		List list = new ArrayList();
		List list1 = new ArrayList();

		if (method.equals("query")) {
			Keyanuser keyanUser = new Keyanuser();
			UserDAO userDAO = new UserDAO();
			String nian = request.getParameter("nian1");
			if (nian == null || nian.equals(""))
				nian = new Date().toString().split(" ")[new Date().toString()
						.split(" ").length - 1];
			String name = request.getParameter("name");
			String zgnum = request.getParameter("zgnum");
			boolean flag = true;
			List userlist = null;
			Keyanuser loginUser = (Keyanuser) request.getSession()
					.getAttribute("keyanuser");

			try {

				if (name != null && !name.equals("")) {
					userlist = userDAO.findUsersByNameClasify(name, loginUser);
					if (userlist.size() > 1 || userlist.size() == 0)
						flag = false;
					if (!flag)
						request.getSession().setAttribute("userlist", userlist);
				}

				if (flag) {
					Keyanuser user = null;
					if (zgnum != null && !zgnum.equals(""))
						user = new UserDAO().findByZgnumClasify(zgnum,
								loginUser);
					else if (name != null && !name.equals(""))
						user = (Keyanuser) userlist.get(0);
					else
						user = (Keyanuser) request.getSession().getAttribute(
								"keyanuser");
					List projectList = null;
					List thesisList = null;
					List workList = null;
					List zhuanliList = null;
					if (user != null
							&& (loginUser.getUnitnum()
									.equals(user.getUnitnum()) || loginUser
									.getUserclasify().equals("2"))) {
						projectList = ProjectcgDao.findByUserNian(user, nian);
						thesisList = ThesisDao.findByUserNian(user, nian);
						workList = WorkDao.findByUserNian(user, nian);
						zhuanliList = ZhuanliDao.findByUserNian(user, nian);

					}
					request.getSession().setAttribute("searchuser", user);
					request.getSession().setAttribute("nian", nian);
					request.getSession().setAttribute("projectList",
							projectList);
					request.getSession().setAttribute("thesisList", thesisList);
					request.getSession().setAttribute("workList", workList);
					request.getSession().setAttribute("zhuanliList",
							zhuanliList);
				}
				context.setAttribute("keyanUser", keyanUser);
				context.setAttribute("list", list);

				return mapping.findForward("query");

			} catch (Exception e) {
				e.printStackTrace();
				return mapping.findForward("fail1");
			}
		} else if (method.equals("gesearchByName")) {

			Keyanuser keyanUser = new Keyanuser();
			UserDAO userDAO = new UserDAO();
			String id = request.getParameter("id");
			Keyanuser loginUser = userDAO.queryId(new Integer(id));
			Work thesis = new Work();
			String nian = request.getParameter("nian1");
			if (nian == null || nian.equals(""))
				nian = new Date().toString().split(" ")[new Date().toString()
						.split(" ").length - 1];
			String name = loginUser.getName();
			String zgnum = loginUser.getUsername();

			WorkDao thesisDao = new WorkDao();
			boolean flag = true;
			List userlist = null;

			try {

				Keyanuser user = null;

				user = loginUser;
				List projectList = null;
				List thesisList = null;
				List workList = null;
				List zhuanliList = null;
				if (user != null
						&& (loginUser.getUnitnum().equals(user.getUnitnum()) || loginUser
								.getUserclasify().equals("2"))) {
					projectList = ProjectcgDao.findByUserNian(user, nian);
					thesisList = ThesisDao.findByUserNian(user, nian);
					workList = WorkDao.findByUserNian(user, nian);
					zhuanliList = ZhuanliDao.findByUserNian(user, nian);
				}
				request.getSession().setAttribute("searchuser", user);
				request.getSession().setAttribute("nian", nian);
				request.getSession().setAttribute("projectList", projectList);
				request.getSession().setAttribute("thesisList", thesisList);
				request.getSession().setAttribute("workList", workList);
				request.getSession().setAttribute("zhuanliList", zhuanliList);

				request.getSession().setAttribute("keyanUser1", keyanUser);
				context.setAttribute("list", list);

				String url = "geren.jsp";
				forward = new ActionForward(url);
				forward.setPath(url);
				forward.setRedirect(true);

				return forward;

			} catch (Exception e) {
				e.printStackTrace();
				return mapping.findForward("fail1");
			}
		}

		else if (method.equals("yuanxichaxun1")) {
			Keyanuser loginUser = (Keyanuser) request.getSession()
					.getAttribute("keyanuser");

			Date d = new Date();

			List<Keyanuser> userlist = null;

			List unitlist = null;

			List<Depttable> list2 = null;
			List scorelist = new ArrayList();
			List postlist = new ArrayList();
			UserDAO userDAO = new UserDAO();
			PostDAO postDAO = new PostDAO();
			int date = d.getYear() + 1900;

			Unit unit = null;
			UnitDAO unitDAO = new UnitDAO();
			postlist = postDAO.findAll();
			DepttableDAO depttableDAO = new DepttableDAO();
			list2 = depttableDAO.findAll();
			for (int i = 0; i < list2.size(); i++) {

				float score = 0;
				Depttable depttable = list2.get(i);
				userlist = userDAO.qurryuser(depttable.getId().toString());

				List scorelist2 = defen(userlist, date);
				for (int j = 0; j < scorelist2.size(); j++) {
					score = (Float) scorelist2.get(j) + score;
				}
				scorelist.add(score);
			}
			context.setAttribute("scorelist", scorelist);
			context.setAttribute("postlist", postlist);
			context.setAttribute("listdepttable", list2);
			context.setAttribute("loginkeyanuser", loginUser);
			String url = "yuanxichaxun1.jsp";
			forward = new ActionForward(url);
			forward.setPath(url);
			forward.setRedirect(true);

			return forward;

		} else if (method.equals("yuanxichaxun")) {
			Keyanuser loginUser = (Keyanuser) request.getSession()
					.getAttribute("keyanuser");

			String id = request.getParameter("id");

			List<Keyanuser> userlist = null;
			List projectList = null;
			List thesisList = null;
			List workList = null;
			List unitlist = null;
			Date d = new Date();

			List scorelist = new ArrayList();
			List postlist = new ArrayList();
			UserDAO userDAO = new UserDAO();
			PostDAO postDAO = new PostDAO();
			int date = d.getYear() + 1900;

			if (id != null) {

				userlist = userDAO.qurryuser(id);
				scorelist = defen(userlist, date);

			} else {

				userlist = userDAO.qurryuser(loginUser.getUnitnum());
				scorelist = defen(userlist, date);
			}

			for (int i = 0; i < userlist.size(); i++) {
				Keyanuser user = (Keyanuser) userlist.get(i);

				Post post = postDAO.findByPostnum(user.getPostnum());
				postlist.add(post.getTask());
			}

			context.setAttribute("userlist", userlist);
			context.setAttribute("loginkeyanuser", loginUser);
			context.setAttribute("scorelist", scorelist);
			context.setAttribute("postlist", postlist);
			String url = "yuanxichaxun.jsp";
			forward = new ActionForward(url);
			forward.setPath(url);
			forward.setRedirect(true);

			return forward;

		}

		else if (method.equals("chakan")) {
			Date data = new Date();
			int d = data.getYear() + 1900;

			Keyanuser keyanUser = new Keyanuser();
			UserDAO userDAO = new UserDAO();
			String id = request.getParameter("id");
			Keyanuser loginUser = userDAO.queryId(new Integer(id));
			Work thesis = new Work();
			String nian = request.getParameter("nian1");
			if (nian == null || nian.equals(""))
				nian = new Date().toString().split(" ")[new Date().toString()
						.split(" ").length - 1];
			String name = loginUser.getName();
			String zgnum = loginUser.getUsername();

			WorkDao thesisDao = new WorkDao();
			boolean flag = true;
			List userlist = null;

			try {

				Keyanuser user = null;

				user = loginUser;
				List projectList = null;
				List thesisList = null;
				List workList = null;
				List zhuanliList = null;
				if (user != null
						&& (loginUser.getUnitnum().equals(user.getUnitnum()) || loginUser
								.getUserclasify().equals("2"))) {
					projectList = ProjectcgDao.findByUserNian(user, nian);
					thesisList = ThesisDao.findByUserNian(user, nian);
					workList = WorkDao.findByUserNian(user, nian);
					zhuanliList = ZhuanliDao.findByUserNian(user, nian);
				}
				request.getSession().setAttribute("searchuser", user);
				request.getSession().setAttribute("nian", nian);
				request.getSession().setAttribute("projectList", projectList);
				request.getSession().setAttribute("thesisList", thesisList);
				request.getSession().setAttribute("workList", workList);
				request.getSession().setAttribute("zhuanliList", zhuanliList);

				request.getSession().setAttribute("keyanUser1", keyanUser);
				context.setAttribute("list", list);

				return mapping.findForward("query");

			} catch (Exception e) {
				e.printStackTrace();
				return mapping.findForward("fail1");
			}
		}

		else if (method.equals("queryThree")) {
			List<Float> listscore = new ArrayList<Float>();
			List<Float> listscore1 = new ArrayList<Float>();
			List<Float> listscore2 = new ArrayList<Float>();
			Keyanuser loginUser = (Keyanuser) request.getSession()
					.getAttribute("keyanuser");
			List userlist = new ArrayList();
			Date d = new Date();
			int date = d.getYear() + 1900;
			userlist.add(loginUser);

			listscore = defen(userlist, date);
			listscore1 = defen(userlist, (date - 1));
			listscore2 = defen(userlist, (date - 2));
			request.getSession().setAttribute("listscore", listscore);
			request.getSession().setAttribute("nian", "" + date);
			request.getSession().setAttribute("listscore1", listscore1);
			request.getSession().setAttribute("listscore2", listscore2);
			request.getSession().setAttribute("keyanuser", loginUser);
			return mapping.findForward("query1");
		}
		return null;
	}

	public List<Float> defen(List userlist, int date) {
		List projectList = null;
		List thesisList = null;
		List workList = null;
		List unitlist = null;
		String nian = String.valueOf(date);
		List zhuanlilist = null;
		List<Float> scorelist = new ArrayList<Float>();
		List postlist = new ArrayList();
		UserDAO userDAO = new UserDAO();
		PostDAO postDAO = new PostDAO();

		for (int i = 0; i < userlist.size(); i++) {
			float score = 0;

			Keyanuser user = (Keyanuser) userlist.get(i);

			Post post = postDAO.findByPostnum(user.getPostnum());
			projectList = ProjectcgDao.findByUserNian(user, nian);
			thesisList = ThesisDao.findByUserNian(user, nian);
			workList = WorkDao.findByUserNian(user, nian);
			zhuanlilist = ZhuanliDao.findByUserNian(user, nian);
			for (int j = 0; j < thesisList.size(); j++) {
				Thesis thesis = (Thesis) thesisList.get(j);
				thesis.setPoint(new PointDAO().findByAchnum(thesis.getAchnum())
						.getPoint());
				if (thesis.getTMembers().intValue() == 1
						&& thesis.getTName().equals(user.getName())) {
					// ���������ķ���
					score += thesis.getPoint();
				}
				// �������������
				else if (thesis.getTMembers().intValue() == 2) {
					// 7-3
					// ����һ��������
					String[] num = thesis.getTusernum().split(",");
					if (num[0].equals(user.getUsername()))
					// �������0.7
					{
						score += thesis.getPoint() * 0.7;
					}
					// ���

					else if (num[1].equals(user.getUsername())) {
						score += thesis.getPoint() * 0.3;
					}
				} else if (thesis.getTMembers().intValue() == 3) {
					String[] num = thesis.getTusernum().split(",");
					// 7-2-1
					if (num[0].equals(user.getUsername()))
						score += thesis.getPoint() * 0.7;
					else if (num[1].equals(user.getUsername()))
						score += thesis.getPoint() * 0.2;
					else if (num[2].equals(user.getUsername()))
						score += thesis.getPoint() * 0.1;

				} else if (thesis.getTMembers().intValue() >= 4) {
					String[] num = thesis.getTusernum().split(",");
					if (num[0].equals(user.getUsername()))
						score += thesis.getPoint() * 0.6;
					else if (num[1].equals(user.getUsername()))
						score += thesis.getPoint() * 0.2;
					else if (num[2].equals(user.getUsername()))
						score += thesis.getPoint() * 0.1;
					else
						score += (thesis.getPoint() * 0.1)
								/ (thesis.getTMembers().intValue() - 3);
				}

			}

			for (int j = 0; j < projectList.size(); j++) {
				Projectcg project = (Projectcg) projectList.get(j);
				project.setPoint(new PointDAO().findByAchnum(
						project.getAchnum()).getPoint());
				if (project.getPMembers().intValue() == 1
						&& project.getPName().equals(user.getName()))
					score += project.getPoint();
				else if (project.getPMembers().intValue() == 2) {
					// 7-3
					String[] Pnum = project.getPusernum().split(",");
					if (Pnum[0].equals(user.getUsername()))
						score += project.getPoint() * 0.7;
					else if (Pnum[1].equals(user.getUsername()))
						score += project.getPoint() * 0.3;

				} else if (project.getPMembers().intValue() == 3) {
					// 7-2-1
					String[] Pnum = project.getPusernum().split(",");
					if (Pnum[0].equals(user.getUsername()))
						score += project.getPoint() * 0.7;
					else if (Pnum[1].equals(user.getUsername()))
						score += project.getPoint() * 0.2;
					else if (Pnum[2].equals(user.getUsername()))
						score += project.getPoint() * 0.1;

				} else if (project.getPMembers().intValue() >= 4) {
					String[] Pnum = project.getPusernum().split(",");
					if (Pnum[0].equals(user.getUsername()))
						score += project.getPoint() * 0.6;
					else if (Pnum[1].equals(user.getUsername()))
						score += project.getPoint() * 0.2;
					else if (Pnum[2].equals(user.getUsername()))
						score += project.getPoint() * 0.1;
					else
						score += (project.getPoint() * 0.1)
								/ (project.getPMembers().intValue() - 3);
				}

			}
			for (int j = 0; j < zhuanlilist.size(); j++) {
				Zhuanli project = (Zhuanli) zhuanlilist.get(j);
				project.setPoint(new PointDAO().findByAchnum(
						project.getAchnum()).getPoint());
				if (project.getZMembers().intValue() == 1
						&& project.getZName().equals(user.getName()))
					score += project.getPoint();
				else if (project.getZMembers().intValue() == 2) {
					// 7-3
					String[] Znum = project.getZusernum().split(",");
					if (Znum[0].equals(user.getUsername()))
						score += project.getPoint() * 0.7;
					else if (Znum[1].equals(user.getUsername()))
						score += project.getPoint() * 0.3;

				} else if (project.getZMembers().intValue() == 3) {
					// 7-2-1
					String[] Znum = project.getZusernum().split(",");
					if (Znum[0].equals(user.getUsername()))
						score += project.getPoint() * 0.7;
					else if (Znum[1].equals(user.getUsername()))
						score += project.getPoint() * 0.2;
					else if (Znum[2].equals(user.getUsername()))
						score += project.getPoint() * 0.1;

				} else if (project.getZMembers().intValue() >= 4) {
					String[] Znum = project.getZusernum().split(",");
					if (Znum[0].equals(user.getUsername()))
						score += project.getPoint() * 0.6;
					else if (Znum[1].equals(user.getUsername()))
						score += project.getPoint() * 0.2;
					else if (Znum[2].equals(user.getUsername()))
						score += project.getPoint() * 0.1;
					else
						score += (project.getPoint() * 0.1)
								/ (project.getZMembers().intValue() - 3);
				}

			}

			for (int j = 0; j < workList.size(); j++) {
				Work work = (Work) workList.get(j);
				work.setPoint(new PointDAO().findByAchnum(work.getAchnum())
						.getPoint());
				if (work.getWMembers().intValue() == 1
						&& work.getWName().equals(user.getName()))
					// ���������ķ���
					score += work.getPoint();
				// �������������
				else if (work.getWMembers().intValue() == 2) {
					// 7-3
					// ����һ��������
					String[] Wnum = work.getWusernum().split(",");
					if (Wnum[0].equals(user.getUsername()))
					// �������0.7
					{
						score += work.getPoint() * 0.7;
					}
					// ���ڶ���������������0.3
					else if (Wnum[1].equals(user.getUsername()))
						score += work.getPoint() * 0.3;

				} else if (work.getWMembers().intValue() == 3) {
					// 7-2-1
					String[] Wnum = work.getWusernum().split(",");
					if (Wnum[0].equals(user.getUsername()))
						score += work.getPoint() * 0.7;
					else if (Wnum[1].equals(user.getUsername()))
						score += work.getPoint() * 0.2;
					else if (Wnum[2].equals(user.getUsername()))
						score += work.getPoint() * 0.1;

				} else if (work.getWMembers().intValue() >= 4) {
					String[] Wnum = work.getWusernum().split(",");
					if (Wnum[0].equals(user.getUsername()))
						score += work.getPoint() * 0.6;
					else if (Wnum[0].equals(user.getUsername()))
						score += work.getPoint() * 0.2;
					else if (Wnum[0].equals(user.getUsername()))
						score += work.getPoint() * 0.1;
					else
						score += (work.getPoint() * 0.1)
								/ (work.getWMembers().intValue() - 3);
				}

			}
			scorelist.add(score);

		}

		return scorelist;
	}

}