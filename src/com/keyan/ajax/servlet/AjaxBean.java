package com.keyan.ajax.servlet;



import java.util.ArrayList;
import java.util.List;

import com.keyan.hibernate.dao.PiciDao;
import com.keyan.hibernate.dao.Project1Dao;
import com.keyan.hibernate.dao.ProjectcgDao;
import com.keyan.hibernate.dao.ThesisDao;
import com.keyan.hibernate.dao.UserDAO;
import com.keyan.hibernate.dao.WorkDao;
import com.keyan.hibernate.dao.ZhuanliDao;

/** 供JSON-RPC组件远程调用的AjaxBean */
public class AjaxBean extends BaseLog {
	/**取得用户分类列表*/
	public boolean upadte(String id,String password,String tel,String post,String addr,String userclasify)
	{
		UserDAO userDAO=new UserDAO();
	
		boolean f;
		f= userDAO.update(new Integer(id),password,tel,post,addr,userclasify);
		
		return f;
	}
	//验证
	public boolean yanzheng(String name)
	{
		UserDAO userDAO=new UserDAO();
		List  user=new ArrayList();	
		user = userDAO.queryName(name);	
		boolean f;
		
		if((user.size()==0))
		{
			f=true;
		}
		else{
			f=false;
		}
		
		return f;
	}
	public boolean yanzhengpici(String pcname)
	{
		PiciDao piciDao=new PiciDao();
		List  project1=new ArrayList();
		project1 = piciDao.queryByname(pcname);
		boolean f;
		
		if((project1.size()==0))
		{
			f=true;
		}
		else{
			f=false;
		}
		
		return f;
	}
	public boolean yanzhengproject1(String name)
	{
		Project1Dao project1Dao=new Project1Dao();
		List  project11=new ArrayList();
		project11 = project1Dao.findall88(name); 
		boolean f;
		
		if((project11.size()==0))
		{
			f=true;
		}
		else{
			f=false;
		}
		
		return f;
	}
	
	public boolean yanzhengWork(String name)
	{
		WorkDao workDAO=new WorkDao();
		List  work=new ArrayList();	
		work = workDAO.queryByName2(name);	
		boolean f;		
		if((work.size()==0))
		{
			f=true;
		}
		else{
			f=false;
		}		
		return f;
	}
	public boolean yanzhengThesis(String name)
	{
		ThesisDao thesisDAO=new ThesisDao();
		List  thesis=new ArrayList();	
		thesis=thesisDAO.queryByName2(name);		
		boolean f;	
		if((thesis.size()==0))
		{
			f=true;
		}
		else{
			f=false;
		}		
		return f;
	}
	public boolean yanzhengProjectcg(String name)
	{
		ProjectcgDao projectcgDAO=new ProjectcgDao();
		List  projectcg=new ArrayList();	
		projectcg = projectcgDAO.queryByName2(name);	
		boolean f;		
		if((projectcg.size()==0))
		{
			f=true;
		}
		else{
			f=false;
		}		
		return f;
	}
	public boolean yanzhengZhuanli(String name)
	{
		ZhuanliDao zhuanliDAO=new ZhuanliDao();
		List  zhuanli=new ArrayList();	
		zhuanli= zhuanliDAO.queryByName2(name);	
		boolean f;	
		if((zhuanli.size()==0))
		{
			f=true;
		}
		else{
			f=false;
		}		
		return f;
	}
}