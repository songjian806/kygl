<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.keyan.hibernate.form.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>

<%
String name=null;
String level=null;
 List list=new ArrayList();
 List list1=new ArrayList();
 List list2=new ArrayList();
 List list3=new ArrayList();
Keyanuser keyanuser=(Keyanuser)session.getAttribute("keyanuser");
list=(List)getServletContext().getAttribute("list");
list1=(List)getServletContext().getAttribute("list2");
list2=(List)getServletContext().getAttribute("list3");
list3=(List)getServletContext().getAttribute("list4");
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

    <title>个人用户信息查看</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
	<link href="assets/morris.js-0.4.3/morris.css" rel="stylesheet" />

  </head>

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

                  <li class="sub-menu ">
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


      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

              <div class="row">
                  <div class="col-lg-12">
                      <!--breadcrumbs start -->
                      <ul class="breadcrumb">
                          <li><a href="index.jsp"><i class="icon-home"></i>首页</a></li>
                          <li>个人信息</li>
                          <li> 个人信息查看</li>


                      </ul>
                      <!--breadcrumbs end -->
                  </div>
              </div>

              <!-- page start-->
              <div class="row">
                  <aside class="profile-nav col-lg-3">
                      <section class="panel">
                          <div class="user-heading round">
                              <a>
                                  <img src="img/profile-avatar.jpg">
                              </a>
                              <h1><%=name %></h1>
                              <p><%=level %></p>
                          </div>

                          <ul class="nav nav-pills nav-stacked">
                              <li class="active"><a href="userList1.jsp"> <i class="icon-user"></i>个人信息</a></li>

                              <li><a href="user.do?method=query2&&id=<%=keyanuser.getId().toString() %>"> <i class="icon-edit"></i>修改个人信息</a></li>
                          </ul>

                      </section>
                  </aside>
                  <aside class="profile-info col-lg-9">
                      <section class="panel">
                          <div class="bio-graph-heading">
                              <h2>用户个人信息</h2>
                          </div>
                          <div class="panel-body bio-graph-info">
                              <h1>个人信息：</h1>
                              <div class="row">
                                  <div class="bio-row">
                                      <p><span>用户名</span>: <%=keyanuser.getUsername() %></p>
                                  </div>
                                  <div class="bio-row">
                                      <p><span>角      色</span>: <%=keyanuser.getLevel() %></p>
                                  </div>
                                  <div class="bio-row">
                                      <p><span>姓      名 </span>: <%=keyanuser.getName() %></p>
                                  </div>
                                  <div class="bio-row">
                                      <p><span>职      称</span>: <%=keyanuser.getPost() %></p>
                                  </div>
                                  <div class="bio-row">
                                      <p><span>所在单位</span>: <%=keyanuser.getUserdept() %></p>
                                  </div>
                                  <div class="bio-row">
                                      <p><span>联系电话</span>: <%=keyanuser.getTel() %></p>
                                  </div>
                                  <div class="bio-row">
                                      <p><span>居住地址</span>: <%=keyanuser.getAddr() %></p>
                                  </div>

                              </div>
                          </div>
                      </section>
                      <!-- 条形统计图-->
                      <div class="tab-content">
						<div class="tab-pane active" id="morris">
							<div class="row">

								<div class="col-lg-12">
									<section class="panel">
										<header class="panel-heading">
											本年个人成果统计图
										</header>
										<div class="panel-body">
											<div id="hero-bar" class="graph"></div>
										</div>
									</section>
								</div>
							</div>
						</div>
					</div>
                   <!-- 条形统计图-->
                  </aside>
              </div>

              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>
    <!-- js placed at the end of the document so the pages load faster -->




    <script src="assets/jquery-knob/js/jquery.knob.js"></script>

		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.scrollTo.min.js"></script>
		<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="assets/morris.js-0.4.3/morris.min.js" type="text/javascript"></script>
		<script src="assets/morris.js-0.4.3/raphael-min.js" type="text/javascript"></script>
		<script src="assets/chart-master/Chart.js"></script>
		<script src="js/jquery.sparkline.js" type="text/javascript"></script>

		<!--common script for all pages-->
		<script src="js/common-scripts.js"></script>

		<!-- script for this page only-->

		<script src="js/all-chartjs.js"></script>
		<script src="js/sparkline-chart.js"></script>




	<script type="text/javascript">
			var Script = function() {

				//morris chart

				$(function() {
					// data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type

					Morris.Bar({
						element: 'hero-bar',
						data: [
							{ device: '论文', 数量:<%= list.size() %>},
							{ device: '论著', 数量: <%= list1.size() %> },
							{ device: '项目', 数量: <%= list2.size() %>},
							{ device: '专利', 数量: <%= list3.size() %> }

						],
						xkey: 'device',
						ykeys: ['数量'],
						labels: ['数量'],
						barRatio: 0.4,
						xLabelAngle: 0.1,
						hideHover: 'auto',
						barColors: ['#6883a3']
					});

					$('.code-example').each(function(index, el) {
						eval($(el).text());
					});
				});

			}();
		</script>


  <script>

      //knob
      $(".knob").knob();

  </script>



  </body>
</html>
