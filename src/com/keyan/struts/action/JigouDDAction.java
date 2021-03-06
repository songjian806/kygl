/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.keyan.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.keyan.hibernate.form.Depttable;
import com.keyan.hibernate.form.DepttableDAO;

/**
 * MyEclipse Struts Creation date: 03-28-2011
 * 
 * XDoclet definition:
 * 
 * @struts.action parameter="method" validate="true"
 */
public class JigouDDAction extends Action {
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
		// TODO Auto-generated method stub

		String method = (String) request.getParameter("method");
		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward();
		DepttableDAO depttableDAO = new DepttableDAO();
		Depttable depttable = new Depttable();
		if (method.equals("deleteDept")) {
			request.removeAttribute("deptList");

			String id = request.getParameter("id");

			depttable = depttableDAO.findById(new Integer(id));
			depttableDAO.delete(depttable);
			for (int i = 0; i <= 100000; i++)
				;
			String url = "/jigou.do?method=querydept";
			forward = new ActionForward(url);
			forward.setPath(url);
			forward.setRedirect(false);

			return forward;
		}
		return null;
	}
}