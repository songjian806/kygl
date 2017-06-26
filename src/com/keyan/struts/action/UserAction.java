package com.keyan.struts.action;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

import com.keyan.hibernate.dao.ProjectcgDao;
import com.keyan.hibernate.dao.ThesisDao;
import com.keyan.hibernate.dao.UserDAO;
import com.keyan.hibernate.dao.WorkDao;
import com.keyan.hibernate.dao.ZhuanliDao;
import com.keyan.hibernate.form.Keyanuser;
import com.keyan.struts.form.UserForm;

/**
 * MyEclipse Struts Creation date: 10-05-2010
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/manager" name="managerForm" parameter="method"
 *                scope="request" validate="true"
 */
public class UserAction extends Action {
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
	public static String MD5Password(String oldstr) {

		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };

		byte[] oldbytes = oldstr.getBytes();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");// 获取对象
			md.update(oldbytes);// 初始化对象
			byte[] newBytes = md.digest();// 运行加密算法
			char[] newStr = new char[32];
			for (int i = 0; i < 16; i++) {
				byte temp = newBytes[i];
				newStr[2 * i] = hexDigits[temp >>> 4 & 0xf];
				newStr[2 * i + 1] = hexDigits[temp & 0xf];

			}
			return new String(newStr);
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
if (request.getSession().getAttribute("keyanuser") == null) {
	
	
			return mapping.findForward("logout");
}
	

UserForm UserForm = (UserForm) form;// TODO Auto-generated method stub

		String method = (String) request.getParameter("method");
		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward();
		ServletContext context = this.servlet.getServletContext();
		List list = new ArrayList();
		Keyanuser user = new Keyanuser();
		UserDAO userDAO = new UserDAO();
		WorkDao workDao = new WorkDao();
		ProjectcgDao projectcgDao = new ProjectcgDao();
		ZhuanliDao zhuanliDao = new ZhuanliDao();
		Keyanuser kuser = (Keyanuser) request.getSession().getAttribute(
				"keyanuser");
		ThesisDao thesisDao = new ThesisDao();

		
if (method.equals("query")) {
			if (kuser.getUserclasify().equals("3")) {
				try {

					list = userDAO.query();

					context.setAttribute("list", list);

					return mapping.findForward("query");

				} catch (Exception e) {
					return mapping.findForward("fail1");
				}
			} else {
				return mapping.findForward("fail1");
			}
}



if (method.equals("query00")) {
			String id = (String) request.getParameter("id");
			try {

				Date date = new Date();
				String nian = String.valueOf(date.getYear() + 1900);
				user = userDAO.queryId(new Integer(id));
				List list1 = thesisDao.findByUserNian(user, nian);
				List list2 = workDao.findByUserNian(user, nian);
				List list3 = projectcgDao.findByUserNian(user, nian);
				List list4 = zhuanliDao.findByUserNian(user, nian);

				context.setAttribute("user", user);
				context.setAttribute("list", list1);
				context.setAttribute("list2", list2);
				context.setAttribute("list3", list3);
				context.setAttribute("list4", list4);
				if (user.getUserclasify().equals("3")) {
					if (id != null || id.equals("")) {
						return mapping.findForward("query1");
					} else {
						return mapping.findForward("query");
					}
				} else {
					return mapping.findForward("query1");
				}

			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
}

		
else if (method.equals("updatepassword")) {

			try {

				list = userDAO.query();

				context.setAttribute("list", list);


				return mapping.findForward("updatepassword");

			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
}


if (method.equals("adduser")) {

			return mapping.findForward("adduser");
} 


else if (method.equals("updatepassword2")) {
			{
				try {
					String url = null;
					boolean f = false;
					String password = MD5Password(UserForm.getPassword());
					f = userDAO.update(new Integer(UserForm.getId()), password);
					if (f) {
						user = userDAO.queryId(new Integer(UserForm.getId()));
						context.setAttribute("user", user);
					}
					context.setAttribute("status", "updatesuccess");
					if (user.getUserclasify().equals("3")) {
						url = "user.do?method=updatepassword&&id="
								+ UserForm.getId() + "";
					} else {
						url = "user.do?method=query00&&id=" + UserForm.getId()
								+ "";
					}
					forward = new ActionForward(url);
					forward.setPath(url);
					forward.setRedirect(true);

					return forward;

				} catch (Exception e) {
					return mapping.findForward("fail1");
				}
			}

} 


else if (method.equals("updatepassword1")) {

			{
				try {
					String id = request.getParameter("id");
					user = userDAO.queryId(new Integer(id));

					context.setAttribute("user", user);

					String url = "updatepassword1.jsp";
					forward = new ActionForward(url);
					forward.setPath(url);
					forward.setRedirect(true);

					return forward;

				} catch (Exception e) {
					return mapping.findForward("fail1");
				}
			}

} 
//管理员审核注册人员功能
else if(method.equals("shenhe")){
	System.out.println("shenhe=================");
	try {
		String url=null;
		boolean f = false;
		userDAO.shenhe(new Integer(UserForm.getId()));
//		if(f)
		
		
		url = "user.do?method=query";
		forward = new ActionForward(url);
		forward.setPath(url);
		forward.setRedirect(true);


		return forward;


	} catch (Exception e) {
		return mapping.findForward("fail1");
	}
}

else if (method.equals("insert")) {
			try {
				
				String url = null;
				String jmpassword = MD5Password(UserForm.getPassword());
				user.setUsername(UserForm.getUsername());

				user.setPassword(jmpassword);

				user.setUserdept(UserForm.getUserdept());
				user.setUserclasify(UserForm.getUserclasify());
				user.setName(UserForm.getName());
				user.setPost(UserForm.getPost());
				user.setLevel(UserForm.getLevel());
				user.setTel(UserForm.getTel());
				user.setAddr(UserForm.getAddr());
				if (UserForm.getUserdept().equals("数学与计算机学院")) {

					user.setDeptnum("1");
					user.setUnitnum("1");
				} else if (UserForm.getUserdept().equals("会计学院")) {
					user.setDeptnum("2");
					user.setUnitnum("2");
				} else if (UserForm.getUserdept().equals("工商管理学院")) {
					user.setDeptnum("3");
					user.setUnitnum("3");
				} else if (UserForm.getUserdept().equals("财税与公共管理学院")) {
					user.setDeptnum("4");
					user.setUnitnum("4");
				} else if (UserForm.getUserdept().equals("金融学院")) {
					user.setDeptnum("5");
					user.setUnitnum("5");
				} else if (UserForm.getUserdept().equals("经济学院")) {
					user.setDeptnum("6");
					user.setUnitnum("6");
				} else if (UserForm.getUserdept().equals("文学与艺术传媒学院")) {
					user.setDeptnum("7");
					user.setUnitnum("7");
				} else if (UserForm.getUserdept().equals("机械工程学院")) {
					user.setDeptnum("8");
					user.setUnitnum("8");
				} else if (UserForm.getUserdept().equals("外国语学院")) {
					user.setDeptnum("9");
					user.setUnitnum("9");
				} else if (UserForm.getUserdept().equals("建筑工程学院")) {
					user.setDeptnum("10");
					user.setUnitnum("10");
				} else if (UserForm.getUserdept().equals("电气工程学院")) {
					user.setDeptnum("11");
					user.setUnitnum("11");
				} else if (UserForm.getUserdept().equals("法学院")) {
					user.setDeptnum("12");
					user.setUnitnum("12");
				} else if (UserForm.getUserdept().equals("校领导")) {
					user.setDeptnum("13");
					user.setUnitnum("13");
				}
				if (UserForm.getPost().equals("教授")) {
					user.setPostnum("1");
				} else if (UserForm.getPost().equals("副教授")) {
					user.setPostnum("2");
				} else if (UserForm.getPost().equals("讲师")) {
					user.setPostnum("3");
				} else if (UserForm.getPost().equals("助教")) {
					user.setPostnum("4");
				}
				userDAO.insert(user);
				context.setAttribute("status", "addsuccess");
				url = "user.do?method=query";
				forward = new ActionForward(url);
				forward.setPath(url);
				forward.setRedirect(true);

				return forward;

			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} 


else if (method.equals("detele")) {
			try {
				String url = null;
				String id = request.getParameter("id");

				userDAO.delete(new Integer(id));

				url = "user.do?method=query";
				forward = new ActionForward(url);
				forward.setPath(url);
				forward.setRedirect(true);

				return forward;

			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} else if (method.equals("query1")) {
			try {
				String id = request.getParameter("id");
				user = userDAO.queryId(new Integer(id));

				context.setAttribute("user", user);
				return mapping.findForward("updateuser");
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} else if (method.equals("query2")) {
			try {
				String id = request.getParameter("id");
				user = userDAO.queryId(new Integer(id));

				context.setAttribute("user", user);

				return mapping.findForward("updateuser1");
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} else if (method.equals("update0")) {
			try {
				String url = null;
				boolean f = false;

				f = userDAO.update(new Integer(UserForm.getId()),
						UserForm.getTel(), UserForm.getPost(),
						UserForm.getAddr(), UserForm.getUserclasify());
				if (f) {
					user = userDAO.queryId(new Integer(UserForm.getId()));
					context.setAttribute("user", user);
				}
				context.setAttribute("status", "updatesuccess");
				url = "user.do?method=query&&id=" + UserForm.getId() + "";
				forward = new ActionForward(url);
				forward.setPath(url);
				forward.setRedirect(true);

				return forward;

			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} else if (method.equals("update1")) {
			try {
				String url = null;
				boolean f = false;

				f = userDAO.update(new Integer(UserForm.getId()),
						UserForm.getTel(), UserForm.getPost(),
						UserForm.getAddr());
				if (f) {
					user = userDAO.queryId(new Integer(UserForm.getId()));
					context.setAttribute("user", user);
				}
				context.setAttribute("status", "updatesuccess");
				url = "user.do?method=query00&&id=" + UserForm.getId() + "";
				forward = new ActionForward(url);
				forward.setPath(url);
				forward.setRedirect(true);

				return forward;

			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		}
		return null;
	}
}