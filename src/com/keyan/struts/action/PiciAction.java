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

import com.keyan.hibernate.dao.PiciDao;
import com.keyan.hibernate.form.Keyanuser;
import com.keyan.hibernate.form.Pici;
import com.keyan.struts.form.PiciForm;

/**
 * MyEclipse Struts Creation date: 03-10-2011
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/Piciform" name="piciform" input="/addpici.jsp"
 *                parameter="method" scope="request" validate="true"
 * @struts.action-forward name="success" path="/pici.jsp"
 */
public class PiciAction extends Action {
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
		PiciForm piciform = (PiciForm) form;// TODO Auto-generated method stub
		Keyanuser keyanuser = (Keyanuser) request.getSession().getAttribute(
				"keyanuser");
		String method = (String) request.getParameter("method");
		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward();
		ServletContext context = this.servlet.getServletContext();
		List list = new ArrayList();
		Pici pici = new Pici();
		if (method.equals("query")) {
			PiciDao piciDao = new PiciDao();
			list = piciDao.findall();
			context.setAttribute("list3", list);
			return mapping.findForward("query");
		} else if (method.equals("insert")) {
			String filePath = null;
			String path = null;
			try {
				PiciDao piciDao = new PiciDao();
				pici.setPcname(piciform.getPcname());
				pici.setPccome(piciform.getPccome());
				pici.setPcclasify(piciform.getPcclasify());
				pici.setPcremark(piciform.getPcremark());
				pici.setPcstar(piciform.getPcstar());
				pici.setPcfinish(piciform.getPcfinish());
				pici.setPcstate(piciform.getPcstate());
				piciDao.insert(pici);
				String url = "Piciform.do?method=query";
				forward.setPath(url);
				forward.setRedirect(true);
				return forward;
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} else if (method.equals("delete")) {
			try {
				PiciDao piciDao = new PiciDao();
				String id = request.getParameter("id");
				piciDao.delete(new Integer(id));
				PiciDao pici2Dao = new PiciDao();
				list = pici2Dao.findall();
				context.setAttribute("list3", list);				
				return mapping.findForward("query");
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		}

		else if (method.equals("update"))// 点击编辑时把当前的数据项放到project1中
		{
			try {
				PiciDao piciDao = new PiciDao();
				String id = request.getParameter("id");
				pici = piciDao.queryId(new Integer(id));
				context.setAttribute("pici", pici);				
				return mapping.findForward("update");
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} else if (method.equals("update1"))// 编辑后对数据进行更新
		{
			String filePath = null;
			String path = null;
			try {
				PiciDao piciDao = new PiciDao();
				pici.setId(piciform.getId());
				pici.setPcname(piciform.getPcname());
				pici.setPccome(piciform.getPccome());
				pici.setPcclasify(piciform.getPcclasify());
				pici.setPcremark(piciform.getPcremark());
				pici.setPcstar(piciform.getPcstar());
				pici.setPcfinish(piciform.getPcfinish());
				pici.setPcstate(piciform.getPcstate());
				piciDao.update1(pici);
				PiciDao pici2Dao = new PiciDao();
				list = pici2Dao.findall();
				context.setAttribute("list3", list);
				return mapping.findForward("query");
			} catch (Exception e) {
				return mapping.findForward("fail1");
			}
		} else if (method.equals("queryId")) {
			PiciDao piciDao = new PiciDao();
			String id = request.getParameter("id");
			pici = piciDao.queryId(new Integer(id));
			context.setAttribute("pici", pici);
			return mapping.findForward("addproject1");
		}
		return null;
	}
}