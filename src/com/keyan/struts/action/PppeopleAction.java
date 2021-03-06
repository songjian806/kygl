/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.keyan.struts.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.keyan.hibernate.dao.PppeopleDao;
import com.keyan.hibernate.dao.Project1Dao;
import com.keyan.hibernate.form.Pppeople;
import com.keyan.hibernate.form.Project1;
import com.keyan.struts.form.PppeopleForm;

/**
 * MyEclipse Struts Creation date: 03-05-2011
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/pppeople" name="Pppeople" input="/pppeople.jsp"
 *                parameter="method" scope="request" validate="true"
 */
public class PppeopleAction extends Action {
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
		PppeopleForm Pppeopleform = (PppeopleForm) form;// TODO Auto-generated
														// method stub
		String method = (String) request.getParameter("method");
		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward();
		ServletContext context = this.servlet.getServletContext();
		List list2 = new ArrayList();
		Pppeople pppeople = new Pppeople();
		if (method.equals("update1"))// 编辑后对数据进行更新
		{
			String filePath = null;
			String path = null;
			try {
				PppeopleDao pppeopleDao = new PppeopleDao();
				pppeople.setPpid(Pppeopleform.getPpid());
				pppeople.setPid(Pppeopleform.getPid());
				pppeople.setPpnum(Pppeopleform.getPpnum());
				pppeople.setPpname(Pppeopleform.getPpname());
				pppeople.setPpdept(Pppeopleform.getPpdept());
				pppeople.setPpwork(Pppeopleform.getPpwork());
				pppeople.setPptype(Pppeopleform.getPptype());
				pppeople.setPpusernum(Pppeopleform.getPpusernum());
				pppeopleDao.update1(pppeople);
				PppeopleDao pppeople2Dao = new PppeopleDao();
				list2 = pppeople2Dao.queryPid(Pppeopleform.getPid());
				context.setAttribute("list2", list2);
				return mapping.findForward("query");
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} else if (method.equals("query")) {
			PppeopleDao pppeopleDao = new PppeopleDao();
			System.out.println("-----li-----");
			String id = request.getParameter("id");
			System.out.println("-----li-----" + id);
			Project1Dao project1Dao = new Project1Dao();
			Project1 project = project1Dao.queryId(Integer.valueOf(id));
			pppeople = pppeopleDao.queryId(new Integer(id));
			context.setAttribute("pppeople", pppeople);
			context.setAttribute("id", id);
			context.setAttribute("project1", project);
			list2 = pppeopleDao.queryPid(new Integer(id));
			context.setAttribute("list2", list2);
			return mapping.findForward("query");
		} else if (method.equals("queryId")) {
			PppeopleDao pppeopleDao = new PppeopleDao();
			list2 = pppeopleDao.findall();
			context.setAttribute("list2", list2);
			return mapping.findForward("query");
		}

		else if (method.equals("insert1")) {
			String id = request.getParameter("pid");

			context.setAttribute("pid1", id);
			return mapping.findForward("add");
		} else if (method.equals("insert")) {
			String filePath = null;
			String path = null;
			try {
				String id = request.getParameter("id");
				Project1Dao project1Dao = new Project1Dao();
				PppeopleDao pppeopleDao = new PppeopleDao();
				pppeople.setPpid(Pppeopleform.getPpid());
				pppeople.setPid(Pppeopleform.getPid());
				pppeople.setPpnum(Pppeopleform.getPpnum());
				pppeople.setPpname(Pppeopleform.getPpname());
				pppeople.setPpdept(Pppeopleform.getPpdept());
				pppeople.setPpwork(Pppeopleform.getPpwork());
				pppeople.setPptype(Pppeopleform.getPptype());
				pppeople.setPpusernum(Pppeopleform.getPpusernum());
				pppeopleDao.insert(pppeople);
				project1Dao.update2(Pppeopleform.getPpname(), Pppeopleform
						.getPid().toString(), Pppeopleform.getPpusernum());
				return mapping.findForward("add");

			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} else if (method.equals("delete")) {
			try {
				PppeopleDao pppeopleDao = new PppeopleDao();
				String id = request.getParameter("id");
				String pid = request.getParameter("pid");
				pppeopleDao.delete(new Integer(id));

				PppeopleDao pppeople2Dao = new PppeopleDao();
				list2 = pppeople2Dao.queryPid(new Integer(pid));
				context.setAttribute("list2", list2);
				return mapping.findForward("query");
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		}

		else if (method.equals("update"))// 点击编辑时把当前的数据项放到project1中
		{
			try {
				PppeopleDao pppeopleDao = new PppeopleDao();
				String id = request.getParameter("id");
				pppeople = pppeopleDao.queryId(new Integer(id));
				context.setAttribute("pppeople", pppeople);
				return mapping.findForward("updatepeople");
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		}

		else if (method.equals("add")) // 点击新增时把当前的数据项放到pppeople中
		{
			try {
				PppeopleDao pppeopleDao = new PppeopleDao();
				String id = request.getParameter("id");
				pppeople = pppeopleDao.queryId(new Integer(id));
				context.setAttribute("pppeople", pppeople);
				return mapping.findForward("add");
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		}

		return null;
	}
}