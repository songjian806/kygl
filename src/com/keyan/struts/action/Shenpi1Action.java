/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.keyan.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.keyan.struts.form.Shenpi1From;
import com.keyan.hibernate.dao.ShenpiDao;
import com.keyan.hibernate.form.*;

/**
 * MyEclipse Struts Creation date: 09-09-2010
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/shenpi1" name="shenpi1From" input="/shenpi1.jsp"
 *                parameter="method" scope="request" validate="true"
 */
public class Shenpi1Action extends Action {
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
		Shenpi1From shenpi1From = (Shenpi1From) form;// TODO Auto-generated
														// method stub
		String pname = shenpi1From.getPname();
		String pcomes = shenpi1From.getPcomes();
		String ptype = shenpi1From.getPtype();
		String ppeople = shenpi1From.getPpeople();
		String pdept = shenpi1From.getPdept();
		String pothers = shenpi1From.getPothers();
		String psource = shenpi1From.getPsource();
		ActionForward forward = new ActionForward();
		Project project = new Project();
		ShenpiDao shenpidao = new ShenpiDao();

		project.setPcomes(pcomes);
		project.setPdept(pdept);
		project.setPname(pname);
		project.setPothers(pothers);
		project.setPpeople(ppeople);
		project.setPsource(psource);
		project.setPtype(ptype);
		project.setPsp1("0");
		if (shenpidao.insert(project)) {

			String url = "xmgl.do?method=query";
			forward = new ActionForward(url);
			forward.setPath(url);
			forward.setRedirect(true);

			return forward;
		}

		return null;
	}
}