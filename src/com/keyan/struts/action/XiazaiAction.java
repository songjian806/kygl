package com.keyan.struts.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.keyan.hibernate.dao.Project1Dao;
import com.keyan.hibernate.form.Project1;

/**
 * MyEclipse Struts Creation date: 10-18-2016
 * 
 * XDoclet definition:
 * 
 * @struts.action parameter="method" validate="true"
 * @struts.action-forward name="fail" path="/fail.jsp" redirect="true"
 */
public class XiazaiAction extends Action {
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

		String filePath = this.getServlet().getServletContext()
				.getRealPath("/");
		String method = request.getParameter("method");
		if (method.equals("help")) {
			String id = filePath + "file//帮助文档.doc";
			File file = new File(id);
			response.setContentType("application/octet-stream");
			String file_name = null;
			try {
				file_name = new String(file.getName().getBytes(), "ISO-8859-1");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			response.setHeader("Content-disposition", "attachment; filename="
					+ file_name);

			try {
				BufferedInputStream buffInput = new BufferedInputStream(new

				FileInputStream(id));
				BufferedOutputStream buffout = new BufferedOutputStream

				(response.getOutputStream());
				int length = -1;
				byte[] buff = new byte[1024];
				while ((length = buffInput.read(buff)) != -1) {
					buffout.write(buff, 0, length);
				}
				buffout.flush();
				buffInput.close();
				buffout.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (method.equals("project1")) {
			String pid = request.getParameter("id");
			Project1 project1 = new Project1();
			Project1Dao proDAO = new Project1Dao();
			project1 = proDAO.queryId(new Integer(pid));

			String id = project1.getPadjuct();
			File file = new File(id);
			response.setContentType("application/octet-stream");
			String file_name = null;
			try {
				file_name = new String(file.getName().getBytes(), "ISO-8859-1");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			response.setHeader("Content-disposition", "attachment; filename="
					+ file_name);

			try {
				BufferedInputStream buffInput = new BufferedInputStream(new

				FileInputStream(id));
				BufferedOutputStream buffout = new BufferedOutputStream

				(response.getOutputStream());
				int length = -1;
				byte[] buff = new byte[1024];
				while ((length = buffInput.read(buff)) != -1) {
					buffout.write(buff, 0, length);
				}
				buffout.flush();
				buffInput.close();
				buffout.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return null;
	}

}
