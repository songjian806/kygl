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

import com.keyan.hibernate.dao.Shenpi21Dao;
import com.keyan.struts.form.Xmgl1Form;

/**
 * MyEclipse Struts Creation date: 09-25-2016
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/xmgl1" name="xmgl1Form" parameter="method"
 *                scope="request" validate="true"
 */
public class Xmgl1Action extends Action {
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
		Xmgl1Form xmgl1Form = (Xmgl1Form) form;// TODO Auto-generated method
												// stub
		String method = request.getParameter("method");
		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward();
		ServletContext context = this.servlet.getServletContext();
		Shenpi21Dao managerdao = new Shenpi21Dao();

		List colleageList = new ArrayList();
		if (method.equals("query6")) {
			colleageList = managerdao.query();

			context.setAttribute("colleageList", colleageList);

			return mapping.findForward("xmgl1");
		} else if (method.equals("delete")) {
			String id = request.getParameter("id");
			managerdao.deleteById(new Integer(id));

			String url = "xmgl1.do?method=query6";
			forward = new ActionForward(url);
			forward.setPath(url);
			forward.setRedirect(true);

			return forward;
		} else if (method.equals("shenpi")) {
			String id = request.getParameter("id");
			managerdao.shenpi(id);

			String url = "xmgl1.do?method=query6";
			forward = new ActionForward(url);
			forward.setPath(url);
			forward.setRedirect(true);

			return forward;
		}
		return null;
	}
}