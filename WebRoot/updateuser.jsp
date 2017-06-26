<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.keyan.hibernate.form.*"%>
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
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>用户信息修改</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

  </head>
<%
  Keyanuser keyanuser1=new Keyanuser(); 
  keyanuser1=(Keyanuser)getServletContext().getAttribute("user");
%>
  <body>
  <section id="container" class="">
     
      <!--header start-->
      <%@ include file="top.jsp"%>
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
                  <li class="sub-menu ">
                      <a href="javascript:;" class="">
                          <i class="icon-cogs"></i>
                          <span>成果管理</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">

                          <%if (keyanuser.getUserclasify().equals("2")) { %>
                          <li ><a class="" href="thesis.do?method=query">论文管理</a></li>
                          <%} %>
                          <%if (keyanuser.getUserclasify().equals("1")) { %>
                          <li ><a class="" href="thesis.do?method=query32">论文管理</a></li>
                          <%} %>
                          <%if (keyanuser.getUserclasify().equals("0")) { %>
                          <li ><a class="" href="thesis.do?method=query31">论文管理</a></li>
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
                  <li class="sub-menu active">
                      <a href="javascript:;" class="">
                          <i class="icon-user"></i>
                          <span>个人管理</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">
                          <li class="active"><a class="" href="user.do?method=query00&&id=<%=keyanuser.getId().toString() %>">个人信息查看</a></li>


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
      
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                 <aside class="profile-nav col-lg-3">
                      <section class="panel">
                          <div class="user-heading round">
                              <a href="#">
                                  <img src="img/profile-avatar.jpg" alt="">
                              </a>
                              <h1><%=keyanuser1.getUsername() %></h1>
                              <p><%=keyanuser1.getLevel() %></p>
                          </div>

                          <ul class="nav nav-pills nav-stacked">
                              <li><a href="updateuser.jsp"> <i class="icon-user"></i>用户信息修改</a></li>
                              
                          </ul>

                      </section>
                  </aside>
        <aside class="profile-info col-lg-9">
  
            <section class="panel">
                          <div class="bio-graph-heading">
                              <h2><%=keyanuser1.getUsername() %>信息修改</h2>
                          </div>
                          <div class="panel-body bio-graph-info">
                              
                              <form class="form-horizontal" role="form" action="user.do?method=update0" method="post" >
                                  <input hidden name="id" value="<%=keyanuser1.getId().toString() %>"/>
                                  <div class="form-group">
                                      <label  class="col-lg-2 control-label">用户名</label>
                                      <div class="col-lg-6">
                                          <input type="text" class="form-control" id="f-name"  value="<%=keyanuser1.getUsername() %>">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label  class="col-lg-2 control-label">姓名</label>
                                      <div class="col-lg-6">
                                          <input type="text" class="form-control" id="l-name"   value="<%=keyanuser1.getName() %>">
                                      </div>
                                  </div>
                                  
                                   <div class="form-group">
                                      <label  class="col-lg-2 control-label">权限</label>
                                      <div class="col-lg-6">
                                          <select class="form-control m-bot10" name="userclasify" placeholder="<%=keyanuser1.getUserclasify() %>">
                                              <option value="0">科研人员</option>
                                              <option value="1">系科研秘书</option>
                                              <option value="2">校科研秘书</option>
                                              <option value="3">系统管理员</option>
                                          </select>
                                      </div>
                                  </div>
                                  
                                  <div class="form-group">
                                      <label  class="col-lg-2 control-label">所在单位</label>
                                      <div class="col-lg-6">
                                          <input type="text" class="form-control" id="c-name"  placeholder=" <%=keyanuser1.getUserdept() %>">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label  class="col-lg-2 control-label">角色</label>
                                      <div class="col-lg-6">
                                          <input type="text" class="form-control" id="b-day"  placeholder="<%=keyanuser1.getLevel() %>">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label  class="col-lg-2 control-label">职称</label>
                                      <div class="col-lg-6">
                                          <input type="text" class="form-control" name="post" id="occupation" value="<%=keyanuser1.getPost() %>">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label  class="col-lg-2 control-label">联系电话</label>
                                      <div class="col-lg-6">
                                          <input type="text" class="form-control" id="email" name="tel" value="<%=keyanuser1.getTel()%>">
                                      </div>
                                  </div>
                                 
								  <div class="form-group">
                                      <label  class="col-lg-2 control-label">居住地址</label>
                                      <div class="col-lg-10">
                                          <input type="text" class="form-control" id="mobile" name="addr" value="<%=keyanuser1.getAddr() %>">
                                      </div>
                                  </div>

                                  <div class="form-group">
                                      <div class="col-lg-offset-2 col-lg-10">
                                          <button type="submit" class="btn btn-success">提交</button>
                                          <button type="reset" class="btn btn-default">重置</button>
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </section>
                      
                      
                       <section>
                          <div class="panel panel-primary">
                              <div class="panel-heading"> 更改用户密码</div>
                              <div class="panel-body">
                                  <form class="form-horizontal" role="form" action="user.do?method=updatepassword2" method="post">
                                     <input hidden name="id" value="<%=keyanuser1.getId().toString() %>"/>
                                      <div class="form-group">
                                          <label  class="col-lg-2 control-label">新密码</label>
                                          <div class="col-lg-6">
                                              <input type="password" class="form-control" id="n-pwd" name="password">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label  class="col-lg-2 control-label">确认密码</label>
                                          <div class="col-lg-6">
                                              <input type="password" class="form-control" id="rt-pwd" name="password">
                                          </div>
                                      </div>


                                      <div class="form-group">
                                          <div class="col-lg-offset-2 col-lg-10">
                                              <button type="submit" class="btn btn-info">确认修改</button>
                                              <button type="reset" class="btn btn-default">重置</button>
                                          </div>
                                      </div>
                                  </form>
                              </div>
                          </div>
                      </section>
  
           </aside>
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
    <script src="assets/jquery-knob/js/jquery.knob.js"></script>

    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>
  </body>
</html>
