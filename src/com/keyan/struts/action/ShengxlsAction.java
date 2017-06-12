/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.keyan.struts.action;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.keyan.tool.POIExcel;

/**
 * MyEclipse Struts Creation date: 09-26-2010
 * 
 * XDoclet definition:
 * 
 * @struts.action parameter="method" validate="true"
 */
public class ShengxlsAction extends Action {
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
		String method = request.getParameter("method");
		HttpSession session = request.getSession();

		response.setContentType("application/vnd.ms-excel");

		POIExcel poiExcel = new POIExcel();

		if (method.equals("work")) {
			List list = (List) session.getAttribute("xlsList");
			try {
				response.setHeader(
						"Content-Disposition",
						"attachment; filename="
								+ URLEncoder.encode("论著.xls", "UTF-8"));
				poiExcel.exportExcel(list, "user", response.getOutputStream(),
						method);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (method.equals("count")) {
			List list = (List) session.getAttribute("count");
			try {
				poiExcel.exportExcel(list, "user", response.getOutputStream(),
						method);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}