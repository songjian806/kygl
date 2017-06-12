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

import com.keyan.hibernate.form.Depttable;
import com.keyan.hibernate.form.DepttableDAO;
import com.keyan.hibernate.form.Keshitable;
import com.keyan.hibernate.form.KeshitableDAO;
import com.keyan.struts.form.JigouForm;

/**
 * MyEclipse Struts Creation date: 03-28-2011
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/jigou" name="jigouForm" input="/form/jigou.jsp"
 *                parameter="method" scope="request" validate="true"
 * @struts.action-forward name="deptList" path="/deptList.jsp"
 */
public class JigouAction extends Action {
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
		JigouForm jigouForm = (JigouForm) form;// TODO Auto-generated method
												// stub

		String method = (String) request.getParameter("method");
		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward();
		ServletContext context = this.servlet.getServletContext();
		List deptList = new ArrayList();
		DepttableDAO depttableDAO = new DepttableDAO();
		Keshitable keshitable = new Keshitable();
		KeshitableDAO keshitableDAO = new KeshitableDAO();
		Depttable depttable = new Depttable();
		if (method.equals("querydept")) {

			deptList = depttableDAO.findAll();
			request.setAttribute("deptList", deptList);
			return mapping.findForward("deptList");
		} else if (method.equals("insertDept")) {
			depttable.setDeptName(jigouForm.getDeptName());
			depttable.setLeader(jigouForm.getLeader());

			depttable
					.setJiaoshoucount(new Integer(jigouForm.getJiaoshoucount()));
			depttable.setFujiaoshou(new Integer(jigouForm.getFujiaoshou()));
			depttable.setJiangshi(new Integer(jigouForm.getJiangshi()));
			depttable.setZhujiao(new Integer(jigouForm.getZhujiao()));
			depttable.setKeshi(new Integer(jigouForm.getKeshi()));
			depttable.setJigou(new Integer(jigouForm.getJigou()));
			depttableDAO.save(depttable);
			deptList = depttableDAO.findAll();
			request.setAttribute("deptList", deptList);
			return mapping.findForward("deptList");
		} else if (method.equals("deleteDept")) {

			String id = request.getParameter("id");

			keshitableDAO.delete1(new Integer(id));
			depttableDAO.delete(new Integer(id));

			deptList = depttableDAO.findAll();

			request.setAttribute("deptList", deptList);
			return mapping.findForward("deptList");
		}
		if (method.equals("querykeshi")) {

			deptList = keshitableDAO.findAll();
			request.setAttribute("deptList", deptList);
			return mapping.findForward("keshiList");
		} else if (method.equals("insertKeshi")) {
			keshitable.setKeshiName(jigouForm.getKeshiName());
			keshitable.setDeptId(new Integer(jigouForm.getDeptID()));
			keshitable.setType(new Integer(jigouForm.getType()));
			keshitableDAO.save(keshitable);
			deptList = keshitableDAO.findAll();
			request.setAttribute("deptList", deptList);
			return mapping.findForward("keshiList");
		} else if (method.equals("deleteKeshi")) {
			request.removeAttribute("deptList");

			String id = request.getParameter("id");

			keshitable = keshitableDAO.findById(new Integer(id));
			keshitableDAO.delete(keshitable);

			deptList = keshitableDAO.findAll();

			request.setAttribute("deptList", deptList);
			return mapping.findForward("keshiList");
		}
		return null;
	}
}