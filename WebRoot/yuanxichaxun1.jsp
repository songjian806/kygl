<%@page import="com.keyan.hibernate.form.Post"%>
<%@page import="com.keyan.hibernate.form.Depttable"%>
<%@page import="com.keyan.hibernate.dao.PostDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%@page import="com.keyan.hibernate.form.Keyanuser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String name=null;
String level=null;
Keyanuser keyanuser=(Keyanuser)session.getAttribute("keyanuser");
name=keyanuser.getName();
level=keyanuser.getLevel();
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>校业绩查询</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
<%
List list1=new ArrayList();
List list2=new ArrayList();
List list3=new ArrayList();
List list4=new ArrayList();
List list5=new ArrayList();
Post post=new Post();

list2=(List)getServletContext().getAttribute("postlist");
list3=(List)getServletContext().getAttribute("scorelist");
list1=(List)getServletContext().getAttribute("userlist");
list4=(List)getServletContext().getAttribute("listdepttable");
list5=(List)getServletContext().getAttribute("unitlist");
Keyanuser   user =(Keyanuser)getServletContext().getAttribute("loginkeyanuser");
Post jiaoshourw=(Post)list2.get(0);
Post fjiaoshourw=(Post)list2.get(1);
Post jiangshirw=(Post)list2.get(2);
Post zhujiaorw=(Post)list2.get(3);
 %>
 
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

                           <li><a class="" href="geSearch.do?method=query">个人业绩查询</a></li>

                           <li><a class="" href="geSearch.do?method=queryThree">近三年业绩查询</a></li>

                           <%if (keyanuser.getUserclasify().equals("1")) { %>
                           <li><a class="" href="geSearch.do?method=yuanxichaxun">院系业绩查询</a></li>
                           <%} %>
                           <%if (keyanuser.getUserclasify().equals("2")) { %>
                           <li class="active"><a class="" href="geSearch.do?method=yuanxichaxun1">院系业绩查询</a></li>
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
                   <li class="sub-menu">
                       <a href="javascript:;" class="">
                           <i class="icon-user"></i>
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
          <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              <strong>校业绩查询</strong>
                          </header>
     
   <table class="table table-striped table-bordered" id="sample_1">
		 <thead>
           <tr>
            <th><div align="center">系名</div></th>
            <th><div align="center">领导数</div></th>
            <th><div align="center">教授</div></th>
            <th><div align="center">副教授</div></th>
            <th><div align="center">讲师</div></th>
            <th><div align="center">助教</div></th>
            <th><div align="center">任务值</div></th>
			<th><div align="center">成绩</div></th>
		    <th style="width:12%"><div align="center">基本操作</div></th>
           </tr>
         </thead>
      <%     
        for(int i=0;i<list4.size();i++)
      {
     Depttable depttable=(Depttable)list4.get(i);
  
  float score=(float)depttable.getJiaoshoucount()*jiaoshourw.getTask()+depttable.getFujiaoshou()*fjiaoshourw.getTask()+
  jiangshirw.getTask()*depttable.getJiangshi()+depttable.getZhujiao()*zhujiaorw.getTask();
   
      
    %>
     
      <tr>
       
        <td align="center"><%=depttable.getDeptName()%></td>
        <td align="center"><%=depttable.getLeader()%></td>
        <td align="center"><%=depttable.getJiaoshoucount()%></td>
        <td align="center"><%=depttable.getFujiaoshou()%></td>
        <td align="center"><%= depttable.getJiangshi()%></td>
        <td align="center"><%=depttable.getZhujiao()%></td>
        <td align="center"><%=score%></td>
        <td align="center"><%=list3.get(i)%></td>
        <td align="center">
        <button class="btn btn-success btn-xs" onclick="javascript:window.location.href='geSearch.do?method=yuanxichaxun&&id=<%=depttable.getId().toString() %>'">
        <i class="icon-info-sign">查看</i>
        </button>
        </td>
      </tr>
      
      <%  } %>
      </table>
              </section>
            </div>
          </div>
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
