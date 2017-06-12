<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.keyan.hibernate.form.*" import="com.keyan.hibernate.dao.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>

<%
String name=null;
String level=null;
Keyanuser keyanuser=(Keyanuser)session.getAttribute("keyanuser");
name=keyanuser.getName();
level=keyanuser.getLevel();
 %>

<%

		Keyanuser loginUser = (Keyanuser) session.getAttribute("keyanuser");
		Keyanuser keyanUser = (Keyanuser) session.getAttribute("searchuser");
		//Keyanuser searchuser = (Keyanuser) session.getAttribute("searchuser");
		List projectList = (List) session.getAttribute("projectList");
		List thesisList = (List) session.getAttribute("thesisList");
		List workList = (List) session.getAttribute("workList");
		List zhuanliList = (List) session.getAttribute("zhuanliList");
		String nian = (String)session.getAttribute("nian");
		session.removeAttribute("projectList");
		session.removeAttribute("thesisList");
		session.removeAttribute("workList");
		session.removeAttribute("zhuanliList");
		session.removeAttribute("nian");
		session.removeAttribute("searchuser");
		float totalscore = 0;
	%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <link rel="shortcut icon" href="img/favicon.html">

    <title>个人考核业绩查询</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
	
	</head>
	
	<body>
	
	 <section id="container" class="">
	<!--header start-->
      <%@ include file="top.jsp"%>
      <!--header end-->
		 <aside>
			 <%if (!keyanuser.getUserclasify().equals("3")) { %>
			 <div id="sidebar" class="nav-collapse ">
				 <!-- sidebar menu start-->
				 <ul class="sidebar-menu">
					 <li>
						 <a class="" href="home.do?">
							 <i class="icon-home"></i>
							 <span>首页</span>
						 </a>
					 </li>
					 <li class="sub-menu">
						 <a href="javascript:;" class="">
							 <i class="icon-book"></i>
							 <span>项目管理</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">
							 <li><a class="" href="project1.do?method=query">项目申报</a></li>
							 <li><a class="" href="project1.do?method=query111">项目立项</a></li>
							 <li><a class="" href="project1.do?method=query112">项目中检</a></li>
							 <li><a class="" href="project1.do?method=query114">项目延期</a></li>
							 <li><a class="" href="project1.do?method=query113">项目结项</a></li>
							 <li><a class="" href="project1.do?method=query115">项目终止</a></li>
						 </ul>
					 </li>
					 <li class="sub-menu">
						 <a href="javascript:;" class="">
							 <i class="icon-cogs"></i>
							 <span>成果管理</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">

							 <%if (keyanuser.getUserclasify().equals("2")) { %>
							 <li><a class="" href="thesis.do?method=query">论文管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("1")) { %>
							 <li><a class="" href="thesis.do?method=query32">论文管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("0")) { %>
							 <li><a class="" href="thesis.do?method=query31">论文管理</a></li>
							 <%} %>

							 <%if (keyanuser.getUserclasify().equals("2")) { %>
							 <li><a class="" href="work.do?method=query3">论著管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("1")) { %>
							 <li><a class="" href="work.do?method=query32">论著管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("0")) { %>
							 <li><a class="" href="work.do?method=query31">论著管理</a></li>
							 <%} %>

							 <%if (keyanuser.getUserclasify().equals("2")) { %>
							 <li><a class="" href="projectcg.do?method=query4">项目管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("1")) { %>
							 <li><a class="" href="projectcg.do?method=query32">项目管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("0")) { %>
							 <li><a class="" href="projectcg.do?method=query31">项目管理</a></li>
							 <%} %>

							 <%if (keyanuser.getUserclasify().equals("2")) { %>
							 <li><a class="" href="zhuanli.do?method=query5">专利管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("1")) { %>
							 <li><a class="" href="zhuanli.do?method=query32">专利管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("0")) { %>
							 <li><a class="" href="zhuanli.do?method=query31">专利管理</a></li>
							 <%} %>


						 </ul>
					 </li>
					 <li class="sub-menu active">
						 <a href="javascript:;" class="">
							 <i class="icon-tasks"></i>
							 <span>业绩考核</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">

							 <li class="active"><a class="" href="geSearch.do?method=query">个人业绩查询</a></li>

							 <li><a class="" href="geSearch.do?method=queryThree">近三年业绩查询</a></li>

							 <%if (keyanuser.getUserclasify().equals("1")) { %>
							 <li><a class="" href="geSearch.do?method=yuanxichaxun">院系业绩查询</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("2")) { %>
							 <li><a class="" href="geSearch.do?method=yuanxichaxun1">院系业绩查询</a></li>
							 <%} %>

						 </ul>
					 </li>

					 <li class="sub-menu ">
						 <a href="javascript:;" class="">
							 <i class="icon-th"></i>
							 <span>经费管理</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">
							 <%if (keyanuser.getUserclasify().equals("0")) { %>
							 <li class=""><a class="" href="mode.do?method=query117">经费管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("1")) { %>
							 <li class=""><a class="" href="mode.do?method=query118">经费管理</a></li>
							 <%} %>
							 <%if (keyanuser.getUserclasify().equals("2")) { %>
							 <li class=""><a class="" href="mode.do?method=query119">经费管理</a></li>
							 <%} %>
						 </ul>
					 </li>

					 <li class="sub-menu">
						 <a href="javascript:;" class="">
							 <i class="icon-th"></i>
							 <span>综合管理</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">


							 <%if (keyanuser.getUserclasify().equals("0")) { %>
							 <li><a class="" href="info.do?method=query1">消息管理</a></li>
							 <%} %>


							 <li><a class="" href="gg.do?method=query">公告管理</a></li>

							 <li><a class="" href="http://tlxyxb.tlu.edu.cn/">科研动态</a></li>

						 </ul>
					 </li>
					 <li class="sub-menu">
						 <a href="javascript:;" class="">
							 <i class="icon-question-sign"></i>
							 <span>系统帮助</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">
							 <li><a class="" href="help.jsp">用户手册</a></li>
							 <li><a class="" href="rules.jsp">规章制度</a></li>
						 </ul>
					 </li>
					 <li class="sub-menu ">
						 <a href="javascript:;" class="">
							 <i class="icon-user"></i>
							 <span>个人管理</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">
							 <li ><a class="" href="user.do?method=query00&&id=<%=keyanuser.getId().toString() %>">个人信息查看</a></li>


						 </ul>
					 </li>
				 </ul>
				 <!-- sidebar menu end-->
			 </div>
			 <%} %>

			 <!--   系统管理员侧边栏 -->
			 <%if (keyanuser.getUserclasify().equals("3")) { %>

			 <div id="sidebar" class="nav-collapse ">
				 <!-- sidebar menu start-->
				 <ul class="sidebar-menu">
					 <li class="sub-menu">
						 <a href="javascript:;" class="">
							 <i class="icon-book"></i>
							 <span>系统管理</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">
							 <li><a class="" href="user.do?method=query">用户信息</a></li>
							 <li><a class="" href="adduser.jsp">添加用户</a></li>
							 <li><a class="" href="user.do?method=updatepassword">修改密码</a></li>

						 </ul>
					 </li>

					 <li class="sub-menu">
						 <a href="javascript:;" class="">
							 <i class="icon-envelope"></i>
							 <span>系统帮助</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">
							 <li><a class="" href="help.jsp">用户手册</a></li>
							 <li><a class="" href="rules.jsp">规章制度</a></li>
						 </ul>
					 </li>


					 <li class="sub-menu">
						 <a href="javascript:;" class="">
							 <i class="icon-tasks"></i>
							 <span>个人管理</span>
							 <span class="arrow"></span>
						 </a>
						 <ul class="sub">

							 <li><a class="" href="user.do?method=query00&&id=<%=keyanuser.getId().toString() %>">个人信息查看</a></li>


						 </ul>
					 </li>

				 </ul>
				 <!-- sidebar menu end-->
			 </div>
			 <%} %>

		 </aside>
	<section id="main-content">
          <section class="wrapper">
          <section class="panel">
          
		<form action="geSearch.do?method=query" method="post" name="searchForm">
			<header class="panel-heading summary-head">
                              <h3>  
							  
							  <div class="form-group ">
							        <div class="col-lg-1 pull-right">
									  
                                          <select class="form-control" name="nian1">
                                              <option>2017</option>
                                              <option>2018</option>
                                              <option>2019</option>
                                              <option>2020</option>
                                              <option>2021</option>
                                              <option>2022</option>
                                              <option>2023</option>
                                              <option>2024</option>
                                              <option>2025</option>
											  
                                          </select>
									</div>
									<button type="submit" class="btn btn-info pull-right">查询</button>
							</div>
							<%=nian %>个人科研业绩考核查询	  
							</h3>
                          </header>
			    
		</form>
		
		<%
		List userlist = (List) session.getAttribute("userlist");
		session.removeAttribute("userlist");
		if(userlist==null&&keyanUser!=null){
		if (keyanUser != null && keyanUser.getName() != null) {
		%>
        
		<%nian = nian==null?"":nian+"年度"; %>
		
		
		<div class="panel-body">
                         <ul class="summary-list">
                                  <li>
                                      <a>
                                        <i class=" icon-user text-primary">姓名</i>
                                          <strong><%=keyanUser.getName()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class="icon-info text-info">教工号</i>
                                          <strong><%=keyanUser.getUsername()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class=" icon-inbox text-muted">单位</i>
                                          <strong><%=keyanUser.getUserdept()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class="icon-tags text-success">职称</i>
                                          <strong><%=keyanUser.getPost()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class="icon-check-sign text-danger">成绩</i>
                                          <td>
					     <div align="center">
						<span id="totalscore"></span>
					         </div>
				         </td>
                                      </a>
                                  </li>
								  <li>
                                      <a>
                                        <i class="icon-trophy text-danger">任务分值</i>
                                         <td>
					<div align="center">
						<span id="needscore">
						<%
						PostDAO postDAO=new PostDAO();
						
					    Post post=postDAO.findByPostnum(keyanUser.getPostnum());
						 if(post!=null)
						 {
						 out.print(post.getTask());
						 }
						%>
						
						
						</span>
					</div>
				</td>
               </a>
             </li>
			</ul>
           </div>
		<%} %>
	</section>
		
		<!-- 论文列表开始 -->
		<%if(thesisList!=null){ %>
		<section>
		 <div class="panel panel-primary">
               <div class="panel-body">
		
			<div class="text-center">
                                 <h4><strong>论文得分情况</strong></h4>
             </div>
             <table class="table table-striped table-hover table-bordered">
             
			<tr>
                                  
                                  <th > <div align="center">论文题目</div></th>
                                  <th class="hidden-phone"><div align="center">成果级别</div></th>
                                  <th class=""><div align="center">第一作者</div></th>
                                  <th class=""><div align="center">第二作者</div></th>
								  <th class=""><div align="center">第三作者</div></th>
								  <th class=""><div align="center">其他参与者</div></th>
								  <th class=""><div align="center">本人得分</div></th>
                                 
                              </tr>
			<%
			Iterator thesisit = thesisList.iterator();
			float thesisscore = 0;
				
			while(thesisit.hasNext()){
			float score = 0;
			
			Thesis thesis = (Thesis) thesisit.next();
			String []thesisnumber=thesis.getTusernum().split(",");
			thesis.setPoint(new PointDAO().findByAchnum(thesis.getAchnum()).getPoint());
			//如果是只有一个作者
			if(thesis.getTMembers().intValue()==1 && 
				thesis.getTName().equals(keyanUser.getName()) ) 
				//分数就是他的分数
				score += thesis.getPoint();
				//如果有两个作者
			else if(thesis.getTMembers().intValue()==2){
			//7-3
			//如果第一作者是他
				if(thesisnumber[0].equals(keyanUser.getUsername())) 
				//分数乘于0.7
				{score += thesis.getPoint() * 0.7;}
				//如果第二作者是他分数乘于0.3
				else if(thesisnumber[1].equals(keyanUser.getUsername())) score += thesis.getPoint() * 0.3;
				
			}else if(thesis.getTMembers().intValue()==3){
			//7-2-1
				if(thesisnumber[0].equals(keyanUser.getUsername())) score += thesis.getPoint() * 0.7;
				else if(thesisnumber[1].equals(keyanUser.getUsername())) score += thesis.getPoint() * 0.2;
				else if(thesisnumber[2].equals(keyanUser.getUsername())) score += thesis.getPoint() * 0.1;
				
			}else if(thesis.getTMembers().intValue()>=4){
				if(thesisnumber[0].equals(keyanUser.getUsername())) score += thesis.getPoint() * 0.6;
				else if(thesisnumber[1].equals(keyanUser.getUsername())) score += thesis.getPoint() * 0.2;
				else if(thesisnumber[2].equals(keyanUser.getUsername())) score += thesis.getPoint() * 0.1;
				else score += (thesis.getPoint() * 0.1)/(thesis.getTMembers().intValue()-3);
			}
			
			
			thesisscore += score;
			 %>
		 <tr>
                  <td align="center"><%=thesis.getTTitle() %></td>
                  <td align="center"><%=new PointDAO().findByAchnum(thesis.getAchnum()).getAchName() %></td>
                  <td align="center"><%=thesis.getTName() %></td>
                  <td align="center"><%=(thesis.getSecond()!=null||!"".equals(thesis.getSecond().replace(" ", ""))) ?thesis.getSecond():"无"  %></td>
				  <td align="center"><%=thesis.getThird()!=null?thesis.getThird():"无" %></td>
                  <td align="center"><%=thesis.getTOthers()!=null?thesis.getTOthers():"无" %></td>
                  <td align="center"><%=score %></td>
                                 
        </tr>
			<%}totalscore += thesisscore;%>
			<div class="row">
                              <div class="col-lg-4 invoice-block pull-left">
                                  <ul class="unstyled amounts pull-left">
                                      <li><strong>总计论文 :</strong><%=thesisList.size() %>个
&nbsp;&nbsp;&nbsp;&nbsp;
									  <strong> 总计得分 :</strong><%=thesisscore %>分
									  </li>
                                  </ul>
                              </div>
                          </div>
			</table>
			
			</div>
                </div>
                </section>
			<%} %>
		<!-- 论文列表结束 -->
		
		
		
		<!-- 著作列表开始 -->	
			<%if(workList!=null){ %>
		<section>
           <div class="panel panel-primary">
              <div class="panel-body">
		          <div class="text-center">
                    <h4><strong>著作得分情况</strong></h4>
                  </div>
			<table class="table table-striped table-hover table-bordered">
			  
			  <tr>
                                  
                  <th><div align="center">ISBN编号</div></th>
                  <th class="hidden-phone"><div align="center">题目</div></th>
                  <th class=""><div align="center">成果级别</div></th>
                  <th class=""><div align="center">第一作者</div></th>
                  <th class=""><div align="center">第二作者</div></th>
				  <th class=""><div align="center">第三作者</div></th>
				  <th class=""><div align="center">其他参与者</div></th>
				  <th class=""><div align="center">本人得分</div></th>
             </tr>
			<%
			Iterator workit = workList.iterator();
			float workscore = 0;
			while(workit.hasNext()){
			float score = 0;
			Work work = (Work) workit.next();
			String []worknumber=work.getWusernum().split(",");
			work.setPoint(new PointDAO().findByAchnum(work.getAchnum()).getPoint());
			if(work.getWMembers().intValue()==1&&work.getWName().equals(keyanUser.getName())) score += work.getPoint();
			else if(work.getWMembers().intValue()==2){
			//7-3
				if(worknumber[0].equals(keyanUser.getUsername())) score += work.getPoint() * 0.7;
				else if(worknumber[1].equals(keyanUser.getUsername())) score += work.getPoint() * 0.3;
				
			}else if(work.getWMembers().intValue()==3){
			//7-2-1
				if(worknumber[0].equals(keyanUser.getUsername())) score += work.getPoint() * 0.7;
				else if(worknumber[1].equals(keyanUser.getUsername())) score += work.getPoint() * 0.2;
				else if(worknumber[2].equals(keyanUser.getUsername())) score += work.getPoint() * 0.1;
				
			}else if(work.getWMembers().intValue()>=4){
				if(worknumber[0].equals(keyanUser.getUsername())) score += work.getPoint() * 0.6;
				else if(worknumber[1].equals(keyanUser.getUsername())) score += work.getPoint() * 0.2;
				else if(worknumber[2].equals(keyanUser.getUsername())) score += work.getPoint() * 0.1;
				else score += (work.getPoint() * 0.1)/(work.getWMembers().intValue()-3);
			}
			
			
			workscore += score;
			 %>
			 <tr>
				<td align="center"><%=work.getWIsbnid() %></td>
				<td align="center"><%=work.getWTitle() %></td>
				<td align="center"><%=new PointDAO().findByAchnum(work.getAchnum()).getAchName() %></td>
				<td align="center"><%=work.getWName() %></td>
				<td align="center"><%=work.getSecond()!=null?work.getSecond():"无" %></td>
				<td align="center"><%=work.getThird()!=null?work.getThird():"无" %></td>
				<td align="center"><%=work.getWOthers()!=null?work.getWOthers():"无" %></td>
				<td align="center"><%=score %></td>
			</tr>
			<%}totalscore += workscore;%>
			<div class="row">
                              <div class="col-lg-4 invoice-block pull-left">
                                  <ul class="unstyled amounts pull-left">
                                      <li><strong>总计著作 :</strong> <%=workList.size() %>个
									  &nbsp;&nbsp;&nbsp;&nbsp;
									  <strong>总计得分 :</strong><%=workscore %>分
									  </li>
                                  </ul>
                              </div>
              </div>
			</table>
			</div>
           </div>
          </section>
			<%} %>
			<!-- 著作列表结束 -->
			
			
			<!-- 专利列表开始 -->	
			<%if(zhuanliList!=null){ %>
		<section>
                  <div class="panel panel-primary">
                   
                      <div class="panel-body">
                          
                          <div class="text-center">
                                 <h4><strong>专利得分情况</strong></h4>
                              </div>
                <table class="table table-striped table-hover table-bordered">
			 <tr>
                                  
                                  <th><div align="center">专利编号</div></th>
                                  <th class="hidden-phone"><div align="center">题目</div></th>
                                  <th class="hidden-phone"><div align="center">成果级别</div></th>
                                  <th class=""><div align="center">第一作者</div></th>
                                  <th class=""><div align="center">第二作者</div></th>
								  <th class=""><div align="center">第三作者</div></th>
								  <th class=""><div align="center">其他参与者</div></th>
								  <th class=""><div align="center">本人得分</div></th>
                              </tr>
			<%
			Iterator zhuanliit = zhuanliList.iterator();
			float zhuanliscore = 0;
			while(zhuanliit.hasNext()){
			float score = 0;
			Zhuanli zhuanli = (Zhuanli) zhuanliit.next();
			String []znumber=zhuanli.getZusernum().split(",");
			zhuanli.setPoint(new PointDAO().findByAchnum(zhuanli.getAchnum()).getPoint());
			if(zhuanli.getZMembers().intValue()==1&&zhuanli.getZName().equals(keyanUser.getName())) score += zhuanli.getPoint();
			else if(zhuanli.getZMembers().intValue()==2){
			//7-3
				if(znumber[0].equals(keyanUser.getUsername())) score += zhuanli.getPoint() * 0.7;
				else if(znumber[1].equals(keyanUser.getUsername())) score += zhuanli.getPoint() * 0.3;
				
			}else if(zhuanli.getZMembers().intValue()==3){
			//7-2-1
				if(znumber[0].equals(keyanUser.getUsername())) score += zhuanli.getPoint() * 0.7;
				else if(znumber[1].equals(keyanUser.getUsername())) score += zhuanli.getPoint() * 0.2;
				else if(znumber[2].equals(keyanUser.getUsername())) score += zhuanli.getPoint() * 0.1;
				
			}else if(zhuanli.getZMembers().intValue()>=4){
				if(znumber[0].equals(keyanUser.getUsername())) score += zhuanli.getPoint() * 0.6;
				else if(znumber[1].equals(keyanUser.getUsername())) score += zhuanli.getPoint() * 0.2;
				else if(znumber[2].equals(keyanUser.getUsername())) score += zhuanli.getPoint() * 0.1;
				else score += (zhuanli.getPoint() * 0.1)/(zhuanli.getZMembers().intValue()-3);
			}
			
			
			zhuanliscore += score;
			 %>
			 <tr>
				<td align="center">
					<%=zhuanli.getZId() %>
				</td>
				<td align="center">
					<%=zhuanli.getZTitle() %>
				</td>
				<td align="center">
					<%=new PointDAO().findByAchnum(zhuanli.getAchnum()).getAchName() %>
				</td>
				<td align="center">
					<%=zhuanli.getZName() %>
				</td>
				<td align="center">
					<%=zhuanli.getSecond()!=null?zhuanli.getSecond():"无" %>
				</td>
				<td align="center">
					<%=zhuanli.getThird()!=null?zhuanli.getThird():"无" %>
				</td>
				<td align="center">
					<%=zhuanli.getZOthers()!=null?zhuanli.getZOthers():"无" %>
				</td>
				<td align="center">
					<%=score %>
				</td>
			</tr>
			<%}totalscore += zhuanliscore;%>
			
							  <div class="row">
                              <div class="col-lg-4 invoice-block pull-left">
                                  <ul class="unstyled amounts pull-left">
                                      <li><strong>总计专利 :</strong> <%=zhuanliList.size() %>个
									  &nbsp;&nbsp;&nbsp;&nbsp;
									  <strong>总计得分:</strong> <%=zhuanliscore %>分
									  </li>
                                  </ul>
                              </div>
                          </div>
			</table>
			
			</div>
            </div>
              </section>
			<%} %>
			<!-- 专利列表结束 -->
			
			
			<!-- 项目列表开始 -->	
			<%if(projectList!=null){ %>
		
			   <section>
                  <div class="panel panel-primary">
                      <!--<div class="panel-heading navyblue"> INVOICE</div>-->
                      <div class="panel-body">
                          
                          <div class="text-center">
                                 <h4><strong>项目得分情况</strong></h4>
                              </div>
                          <table class="table table-striped table-hover table-bordered">
		<tr>
                                  
                                  <th> <div align="center">项目编号</div></th>
                                  <th class="hidden-phone"><div align="center">题目</div></th>
                                  <th class="hidden-phone"><div align="center">成果级别</div></th>
                                  <th class=""><div align="center">第一作者</div></th>
                                  <th class=""><div align="center">第二作者</div></th>
								  <th class=""><div align="center">第三作者</div></th>
								  <th class=""><div align="center">其他参与者</div></th>
								  <th class=""><div align="center">本人得分</div></th>
                              </tr>
			<%
			Iterator projectit = projectList.iterator();
			float projectscore = 0;
			while(projectit.hasNext()){
			float score = 0;
			Projectcg project = (Projectcg) projectit.next();
			String[] pnumber=project.getPusernum().split(",");
			project.setPoint(new PointDAO().findByAchnum(project.getAchnum()).getPoint());
			if(project.getPMembers().intValue()==1&&project.getPName().equals(keyanUser.getName())) score += project.getPoint();
			else if(project.getPMembers().intValue()==2){
			//7-3
				if(pnumber[0].equals(keyanUser.getUsername())) score += project.getPoint() * 0.7;
				else if(pnumber[1].equals(keyanUser.getUsername())) score += project.getPoint() * 0.3;
				
			}else if(project.getPMembers().intValue()==3){
			//7-2-1
				if(pnumber[0].equals(keyanUser.getUsername())) score += project.getPoint() * 0.7;
				else if(pnumber[1].equals(keyanUser.getUsername())) score += project.getPoint() * 0.2;
				else if(pnumber[0].equals(keyanUser.getUsername())) score += project.getPoint() * 0.1;
				
			}else if(project.getPMembers().intValue()>=4){
				if(pnumber[0].equals(keyanUser.getUsername())) score += project.getPoint() * 0.6;
				else if(pnumber[1].equals(keyanUser.getUsername())) score += project.getPoint() * 0.2;
				else if(pnumber[2].equals(keyanUser.getUsername())) score += project.getPoint() * 0.1;
				else score += (project.getPoint() * 0.1)/(project.getPMembers().intValue()-3);
			}
			
			
			projectscore += score;
			 %>
			 <tr>
				<td align="center">
					<%=project.getPId() %>
				</td>
				<td align="center">
					<%=project.getPTitle() %>
				</td>
				<td align="center">
					<%=new PointDAO().findByAchnum(project.getAchnum()).getAchName() %>
				</td>
				<td align="center">
					<%=project.getPName() %>
				</td>
				<td align="center">
					<%=project.getSecond()!=null?project.getSecond():"无" %>
				</td>
				<td align="center">
					<%=project.getThird()!=null?project.getThird():"无" %>
				</td>
				<td align="center">
					<%=project.getPOthers()!=null?project.getPOthers():"无" %>
				</td>
				<td align="center">
					<%=score %>
				</td>
			</tr>
			<%}totalscore += projectscore;%>
			<div class="row">
                              <div class="col-lg-4 invoice-block pull-left">
                                  <ul class="unstyled amounts pull-left">
                                      <li><strong>总计项目 :</strong><%=projectList.size() %>个
									  &nbsp;&nbsp;&nbsp;&nbsp;
									  <strong>总计得分 :</strong><%=projectscore %>分
									  </li>
                                  </ul>
                              </div>
                          </div>
			</table>
			
			</div>
                  </div>
              </section>
			<%} %>
			<!-- 项目列表结束 -->
			
			
			<script type="text/javascript">
			if(<%=totalscore%><document.all.needscore.innerText) document.all.totalscore.innerHTML = "<span style='color:red'><b><%=totalscore %></b></span>"
			else document.all.totalscore.innerHTML = '<%=totalscore %>';
			
function highlight(key) {
var rng = document.body.createTextRange();
while (rng.findText(key)) rng.pasteHTML(rng.text.fontcolor('red'));
}
highlight("<%=keyanUser.getName() %>")

document.all.username.innerText = '<%=keyanUser.getName() %>';
			</script>
<%}else if(userlist!=null&&userlist.size()>0){ %>
<table width="90%" align="center">
<tr bgcolor="d3eaef" class="STYLE6" height="30">
<td width="20%"><span class="STYLE10">教工号</span></td>
<td width="20%"><span class="STYLE10">姓名</span></td>
<td width="20%"><span class="STYLE10">院系</span></td>
<td width="20%"><span class="STYLE10">职称</span></td>
<td><span class="STYLE10">操作</span></td>
</tr>
<% 
Iterator userit = userlist.iterator();
Keyanuser user = null;
while(userit.hasNext()){
user = (Keyanuser) userit.next();
%>
<tr>
<td bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=user.getUsername() %></div></td>
<td bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=user.getName() %></div></td>
<td bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=new UnitDAO().findByUnitnum(user.getUnitnum()).getUnitname() %></div></td>
<td bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=new PostDAO().findByPostnum(user.getPostnum()).getPostname() %></div></td>
<td bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href="javascript:show('<%=user.getUsername() %>')">查看</a></div></td>
</tr>
<%}}else{ %>
<table width="90%" align="center">
<tr height="50" valign="baseline">
<td colspan="5"><span style="color: red;font-size: 18px;margin-left: 30px;">不存在该教师或当前用户权限不允许查看！</span> </td>
</tr>
<%} %>
</table>
<script type="text/javascript">
function show(zgnum){
document.all.zgnum.value = zgnum;
document.all.searchForm.submit();
}
</script>

  </section>
 </section>
</section>
<!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>
	</body>
</html>