<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page  import="com.keyan.hibernate.form.*"%>
<%@ page  import="com.keyan.hibernate.dao.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 			  
    <%
     String name=null;
     String level=null;
     Keyanuser keyanuser=(Keyanuser)session.getAttribute("keyanuser");
     name=keyanuser.getName();
     level=keyanuser.getLevel();
   %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="new/img/favicon.html">

    <title>科研管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

  </head>
	
  <% Pici pici=(Pici)getServletContext().getAttribute("pici"); 
  %>
  <%
       //Pppeople pppeople=(Pppeople)getServletContext().getAttribute("pppeople");
        List list2=new ArrayList();
		//Pppeople pppeople=new Pppeople();
		     list2=(List)getServletContext().getAttribute("list3");
		      session.removeAttribute("xlsList2");
			 session.setAttribute("xlsList2",list2);        
       %>
		
  <body>

  <section id="container" class="">
  
      <!--header start-->
      <%@ include file="top.jsp" %>
      <!--header end-->
      
      <!--sidebar start-->
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
                  <li class="sub-menu active">
                      <a href="javascript:;" class="">
                          <i class="icon-book"></i>
                          <span>项目管理</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">
                          <li class="active"><a class="" href="project1.do?method=query">项目申报</a></li>
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
                  <li class="sub-menu">
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
      <!--sidebar end-->
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          <div class="row">
                  <div class="col-lg-12">
                      <!--breadcrumbs start -->
                      <ul class="breadcrumb">
                          <li><a href="index.jsp"><i class="icon-home"></i>首页</a></li>

                          <li>
                          <%if(keyanuser.getUserclasify().equals("2")) {%>
                          <a href="xmguanli.jsp">项目申报</a>
                          <%}else{ %>
                          <a href="xmguanli1.jsp">项目申报</a>
                          <%} %>
                          </li>
                          <li class="active">申报批次列表</li>
                          
                       </ul>
                      <!--breadcrumbs end -->
                  </div>
            </div>
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                          <strong>申报批次基本信息列表</strong>
                        
                          <button type="button" class="btn btn-success btn-sm pull-right" onclick="window.location.href='Shengxls4.do?method=ppici'"><i class="icon-cloud-download">导出excel</i></button>
                          <%if(keyanuser.getUserclasify().equals("2")) {%>
                          <button class="btn btn-info btn-sm pull-right" onclick="window.location.href='addpici.jsp'"><i class="icon-plus">新增批次</i></button><% }%>
                         
                          </header>
                          <table class="table table-striped table-bordered" id="sample_1">
                          <thead>
                               <tr>                         		  
                                  <th><div align="center">批次名称</div></th>
                                  <th><div align="center">批次状态</div></th>
                                  <th><div align="center">申报数量</div></th>
                                  <th><div align="center">通过数量</div></th>
                                  <th><div align="center">开始日期</div></th>
                                  <th><div align="center">结束日期</div></th>
                                  <%if(keyanuser.getUserclasify().equals("0")) {%>
                                  <th style="width:8%"><div align="center">基本操作</div></th>
                                  <%} %>
                                  <%if(keyanuser.getUserclasify().equals("2")) {%>
                                   <th style="width:12%"><div align="center">基本操作</div></th>
                                    <%} %>
                              </tr>
                           </thead>
                          <tbody>
                <%
                   if(list2!=null)
                  {
                 Project1Dao project1Dao=new Project1Dao();
                 for(int j=0;j<list2.size();j++)
                 {
      
                 pici=(Pici)list2.get(j);
                 List pList1=project1Dao.findallpici1(pici.getPcname());
                 List pList2=project1Dao.findallpici2(pici.getPcname());
                 //pppeople=(Pppeople)list.get(i);
       %>
     <tr class="odd gradeX">                         		 
      <td align="center"><%=pici.getPcname() %></td>
      <td align="center"><%=pici.getPcstate() %></td>
      <td align="center"><%=pList1.size()  %></td>
      <td align="center"><%=pList2.size()  %></td>
      <td align="center"><%=pici.getPcstar() %></td>
      <td align="center"><%=pici.getPcfinish() %></td>
      <td align="center">
      <%if(pici.getPcstate().equals("申报中")&keyanuser.getUserclasify().equals("0")) {%>
       <button class="btn btn-success btn-xs" onclick="javascript:window.location.href='Piciform.do?method=queryId&&id=<%=pici.getId().toString()%> '"><i class="icon-signin ">进入申报</i></button>
		<%}else {%>
		<button class="btn btn-default btn-xs"><i class="icon-signin ">进入申报</i></button>
		<%}%>
	 <%if(keyanuser.getUserclasify().equals("2")){ %>
		<a href="Piciform.do?method=update&&id=<%=pici.getId().toString()%>">
		<button class="btn btn-info btn-xs"><i class="icon-pencil ">编辑</i></button>
		</a>						
		<a href="Piciform.do?method=delete&&id=<%=pici.getId().toString()%>"onclick="return yesno()">
		<button class="btn btn-danger btn-xs"><i class="icon-trash ">删除</i></button>
		</a>
		<%} %>
          </td>
         </tr>
        <%} }%> 
         </tbody>
         </table>
         </section>
         </div>
         </div>
          <!-- page end-->
         </section>
      </section>
      <!--main content end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>


    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

    <!--script for this page only-->
    <script src="js/dynamic-table.js"></script>


  </body>
</html>
