<%@ page import="com.keyan.hibernate.form.Keyanuser" %>
<%@ page import="com.keyan.hibernate.form.Projectcg" %>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<link rel="shortcut icon" href="img/favicon.html">
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="assets/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap-colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap-daterangepicker/daterangepicker.css" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />

<title>项目信息修改</title>


<link rel="stylesheet" type="text/css" href="data/calendar.css">
<script type="text/javascript" src="data/calendar.js"></script>

</head>
<script type="text/javascript" src="js/jsonrpc.js"></script>



<%
		Projectcg projectcg=(Projectcg)getServletContext().getAttribute("projectcg");%>
	 
	 <%
	String name1=(String)session.getAttribute("username");
	
 %>
<%
String name=null;
String level=null;
Keyanuser keyanuser=(Keyanuser)session.getAttribute("keyanuser");
name=keyanuser.getName();
level=keyanuser.getLevel();
 %>



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
					<li class="sub-menu active">
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
							<li class="active"><a class="" href="projectcg.do?method=query4">项目管理</a></li>
							<%} %>
							<%if (keyanuser.getUserclasify().equals("1")) { %>
							<li class="active"><a class="" href="projectcg.do?method=query32">项目管理</a></li>
							<%} %>
							<%if (keyanuser.getUserclasify().equals("0")) { %>
							<li class="active"><a class="" href="projectcg.do?method=query31">项目管理</a></li>
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
<section id="main-content">
          <section class="wrapper">
              <!-- page start-->
             
              <div class="row">
                  <div class="col-lg-12">
			<section class="panel">
               <header class="panel-heading">修改项目</header>
				<div class="panel-body">
				<div class=" form">
					<form class="cmxform form-horizontal tasi-form" action="projectcg.do?method=update" method="post" >
 					   <input  name="id" type="hidden" value="<%=projectcg.getId().toString() %>"/> 
 						  <div class="form-group ">
							<label for="inputEmail1" class="col-lg-2 control-label">作者</label>
								<div class="col-lg-3">
								    <input type="text" class="form-control" value="<%=name1 %>" name="PName" readonly="true">
								</div>
							    <label class="control-label col-lg-2 col-lg-offset-1" >职称</label>
								<div class="col-lg-3">
								    <input type="text" class="form-control" value="<%=projectcg.getPPost() %>" name="PPost" readonly="true">
							    </div>
							
						</div>
						
						<div class="form-group ">
								<label class="control-label col-lg-2" for="inputSuccess">所在单位</label>
								<div class="col-lg-3">
								     <input type="text" class="form-control" value="<%=projectcg.getPDept() %>" name="PDept" readonly="true">
								</div>
							<label class="col-lg-2 control-label col-lg-offset-1">项目名称</label>
								<div class="col-lg-3">
									<input type="text" class="form-control"  value="<%=projectcg.getPTitle() %>" name="PTitle" onblur="yzTitle()">
								</div>
							
						</div>
						
						<div class="form-group ">
								<label  class="col-lg-2 control-label">项目鉴定或颁奖单位名称</label>
								<div class="col-lg-3">
									<input type="text" class="form-control " value="<%=projectcg.getPUnit() %>" name="PUnit">
								</div>
							<label  class="col-lg-2 control-label col-lg-offset-1">项目鉴定编号、获奖证书编号
								</label>
								<div class="col-lg-3">
								    <input type="text" class="form-control" value="<%=projectcg.getPId() %>" name="PId">
								</div>
						</div>
						
						 <div class="form-group ">
								<label class="col-lg-2 control-label">第二作者</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=projectcg.getSecond() %>" name="PSecond">
								</div>
						<label for="inputEmail1" class="col-lg-2 control-label col-lg-offset-1">第二作者学工号 </label>
								<div class="col-lg-3">
									<input type="text" class="form-control" name="PSecondnum">
								</div>
						 </div>
						<div class="form-group ">
								<label for="inputEmail1" class="col-lg-2 control-label">第三作者 </label>
								<div class="col-lg-3">
									<input type="text" class="form-control"  value="<%=projectcg.getThird() %>" name="PThird">
								</div>
							<label for="inputEmail1" class="col-lg-2 control-label col-lg-offset-1">第三作者学工号
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control"  name="PThirdnum">
								</div>
						</div>
						<div class="form-group ">
								<label for="inputEmail1" class="col-lg-2 control-label">其他参编人员 </label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=projectcg.getPOthers() %>" name="POthers">
								</div>
							   <label for="inputEmail1" class="col-lg-2 control-label col-lg-offset-1">其他参编人员学工号 </label>
								<div class="col-lg-3">
									<input type="text" class="form-control" name="POthersnum">
								</div>
						</div>
						<div class="form-group ">
								<label class="col-lg-2 control-label">项目鉴定时间、成果颁奖时间</label>
								<div class="col-lg-3">
								     <input type="text" class="form-control" value="<%=projectcg.getPTime().toString() %>" name="PTime" readonly="true">
								</div>
						   <label  class="col-lg-2 control-label col-lg-offset-1">审核状态</label>
								<div class="col-lg-3 ">
								     <input type="text" class="form-control" value="<%=projectcg.getPScore() %>" name="PScore" readonly="true">
								</div>
						</div>
						<div class="form-group ">
								<label class="control-label col-lg-2" for="inputSuccess">备注（等级）</label>
								<div class="col-lg-3">
									<select class="form-control m-bot10" name="PRemarks" value="<%=projectcg.getPRemarks() %>">
										<option value="国家级奖励一等奖">国家级奖励一等奖</option>
										<option value="省级奖励一等奖">省级奖励一等奖</option>
										<option value="地级优秀教学成果一等奖">地级优秀教学成果一等奖</option>
										<option value="校级科研成果奖励一等奖">校级科研成果奖励一等奖</option>
									</select>
								</div>
						</div>
					    <div class="form-group ">
							<div class="col-lg-offset-5 col-lg-6">
							  <button type="submit" class="btn btn-info" value="修改">修改</button>
							</div>
						
						</div>
					<form>
				</div>
             </div>
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

	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="js/bootstrap-switch.js"></script>
	<!--custom tagsinput-->
	<script src="js/jquery.tagsinput.js"></script>
	<!--custom checkbox & radio-->
	<script type="text/javascript" src="js/ga.js"></script>

	<script type="text/javascript"
		src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>


	<!--common script for all pages-->
	<script src="js/common-scripts.js"></script>

	<!--script for this page-->
	<script src="js/form-component.js"></script>


</body>
</html>

