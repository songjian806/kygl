package com.keyan.struts.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.keyan.hibernate.dao.ProjectcgDao;
import com.keyan.hibernate.dao.ThesisDao;
import com.keyan.hibernate.dao.UnitDAO;
import com.keyan.hibernate.dao.UserDAO;
import com.keyan.hibernate.dao.WorkDao;
import com.keyan.hibernate.dao.ZhuanliDao;
import com.keyan.hibernate.form.Keyanuser;
import com.keyan.hibernate.form.Unit;

public class HomeAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(false);
		Date date = new Date();
		int nian = date.getYear() + 1900;
		Keyanuser user = (Keyanuser) request.getSession().getAttribute(
				"keyanuser");
		ThesisDao thesisDao = new ThesisDao();
		ProjectcgDao projectcgDao = new ProjectcgDao();
		WorkDao workDao = new WorkDao();
		ZhuanliDao zhuanliDao = new ZhuanliDao();
		List list = new ArrayList();
		List list1 = new ArrayList();
		Integer thesisnum = thesisDao.findByUserNian(nian);
		Integer worknum = workDao.findByUserNian(nian);
		Integer projectcgnum = ProjectcgDao.findByUserNian(nian);
		Integer zhuanlinum = ZhuanliDao.findByUserNian(nian);
		UserDAO userDAO = new UserDAO();
		Keyanuser keyanuser = new Keyanuser();
		list.add(thesisnum);
		list.add(worknum);
		list.add(projectcgnum);
		list.add(projectcgnum);
		session.setAttribute("list1", list);
		session.setAttribute("keyanuser", user);		
		UnitDAO unitDAO = new UnitDAO();
		List unitlist = unitDAO.findAll();
		for (int i = 0; i < unitlist.size(); i++) {

			Unit unit = (Unit) unitlist.get(i);
			Integer number1 = thesisDao.queryByUserdept(unit.getUnitname(),
					nian);
			Integer number2 = workDao.queryByUserdept(unit.getUnitname(), nian);
			Integer number3 = projectcgDao.queryByUserdept(unit.getUnitname(),
					nian);
			Integer number4 = zhuanliDao.queryByUserdept(unit.getUnitname(),
					nian);
			list1.add(number1);
			list1.add(number2);
			list1.add(number3);
			list1.add(number4);
		}
		session.setAttribute("unitlist", list1);
		return mapping.findForward("home");

	}

}
