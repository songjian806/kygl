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

import com.keyan.hibernate.dao.UserDAO;
import com.keyan.hibernate.form.Keyanuser;
import com.keyan.struts.form.UserForm;
/*
 * 注册功能
 * author：zhangzhen
 */
public class RegisterAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("-----------ceshi-----------");
		UserAction userAction=new UserAction();
		String method = (String) request.getParameter("method");
		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward();
		ServletContext context = this.servlet.getServletContext();
		List list = new ArrayList();
		UserDAO userDAO = new UserDAO();
		UserForm UserForm = (UserForm) form;// TODO Auto-generated method stub
		
		Keyanuser user = new Keyanuser();
		if(method.equals("zhuce")){
			
			
			return mapping.findForward("register");
		}
		try {
			
			System.out.println("_____1________");
			String url = null;
			String jmpassword = userAction.MD5Password(UserForm.getPassword());
			user.setUsername(UserForm.getUsername());

			user.setPassword(jmpassword);

			user.setUserdept(UserForm.getUserdept());
			user.setUserclasify(UserForm.getUserclasify());
			user.setName(UserForm.getName());
			user.setPostnum(UserForm.getPostnum());
			user.setLevel(UserForm.getLevel());
			user.setTel(UserForm.getTel());
			user.setAddr(UserForm.getAddr());
			user.setChecked(UserForm.getChecked());
		
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
			if (UserForm.getPostnum().equals("1")) {
				user.setPost("教授");
			} else if (UserForm.getPostnum().equals("2")) {
				user.setPost("副教授");
			} else if (UserForm.getPostnum().equals("3")) {
				user.setPost("讲师");
			} else if (UserForm.getPostnum().equals("4")) {
				user.setPost("助教");
			}
			userDAO.insert(user);
			context.setAttribute("status", "addsuccess");
			
			return mapping.findForward("login");
		} catch (Exception e) {
			return mapping.findForward("fail1");
		}
				
		
	}
	

}
