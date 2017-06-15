<%@ page import="com.keyan.hibernate.form.Keyanuser" %>
<%@ page import="com.keyan.hibernate.form.Thesis" %>
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

<title>JSP for TeacherForm form</title>


<link rel="stylesheet" type="text/css" href="data/calendar.css">
<script type="text/javascript" src="data/calendar.js"></script>

</head>
<script type="text/javascript" src="js/jsonrpc.js"></script>

<script type="text/javascript">
	jsonrpc = new JSONRpcClient("JSON-RPC");

	function yzTitle() {
		var id = thesisForm.t_title.value;

		var result = jsonrpc.ajax.yanzhengThesis(id);

		if (result == false) {
			alert("该论文已经存在！");
			thesisForm.t_title.value = "";
			thesisForm.t_title.focus();
		}
	}
	function chongzhi() {
		thesisForm.t_title.value = "";
		thesisForm.t_periodical.value = "";
		thesisForm.t_CNId.value = "";
		thesisForm.t_ISSNId.value = "";
		thesisForm.t_others.value = "";
		thesisForm.second.value = "";
		thesisForm.third.value = "";
	}
</script>
<script type="text/javascript">
	function onsubmit1() {

		if (thesisForm.t_title.value == '') {
			alert("论文名称不能为空");
			return false;
		} else if (thesisForm.t_periodical.value == '') {
			alert("发表期刊不能为空");
			return false;
		} else if (thesisForm.t_CNId.value == '') {
			alert("期刊CN号不能为空");
			return false;
		} else if (thesisForm.t_ISSNId.value == '') {
			alert("期刊ISSN不能为空");
			return false;
		}
		//else if(thesisForm.t_others.value=='')
		//{
		//  alert("其他完成人员不能为空");
		// return false;
		//}
		return true;

	}
</script>

<%
	Thesis thesis=(Thesis)getServletContext().getAttribute("thesis");
	 %>
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
							<li class="active"><a class="" href="thesis.do?method=query">论文管理</a></li>
							<%} %>
							<%if (keyanuser.getUserclasify().equals("1")) { %>
							<li class="active"><a class="" href="thesis.do?method=query32">论文管理</a></li>
							<%} %>
							<%if (keyanuser.getUserclasify().equals("0")) { %>
							<li class="active"><a class="" href="thesis.do?method=query31">论文管理</a></li>
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
		<section id="main-content">
          <section class="wrapper">

			  <div class="row">
				  <div class="col-lg-12">
					  <!--breadcrumbs start -->
					  <ul class="breadcrumb">
						  <li><a href="index.jsp"><i class="icon-home"></i>首页</a></li>
						  <li><a href="#">成果管理</a></li>
						  <li><a href="thesis.jsp"> 论文管理</a></li>
						  <li class="active">修改论文</li>

					  </ul>
					  <!--breadcrumbs end -->
				  </div>
			  </div>

            <div class="row">
              <div class="col-lg-12">
			   <section class="panel">
                <header class="panel-heading"><strong>论文修改</strong> </header>
				<div class="panel-body">
				<div class=" form">
				<form class="cmxform form-horizontal tasi-form" action="thesis.do?method=update" method="post"
						enctype="multipart/form-data" onsubmit="return onsubmit1()">
 						
 						<input  name="id" type="hidden" value="<%=thesis.getId().toString() %>"/> 
 						
						<div class="form-group ">
								<label class="col-lg-2 control-label">作者</label>
								<div class="col-lg-3">
								
								<input type="text" class="form-control" value="<%=name1 %>" name="t_name" readonly="true">
								</div>
						 
								<label class="control-label col-lg-2 col-lg-offset-1" >职称</label>
								<div class="col-lg-3">
								
								<input type="text" class="form-control" value="<%=thesis.getTPost() %>"
										name="t_post" readonly="true">
									 
								</div>
							</div>
						<div class="form-group ">
								<label class="control-label col-lg-2" >所在单位</label>
								<div class="col-lg-3">
								
								<input type="text" class="form-control" value="<%=thesis.getTUnit() %>"
										name="t_unit" readonly="true">
								</div>
							 
								<label class="col-lg-2 control-label col-lg-offset-1">论文名称
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=thesis.getTTitle() %>"
										name="t_title" onblur="yzTitle()">
								</div>
							</div>
						<div class="form-group ">
								<label class="col-lg-2 control-label">发表期刊
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=thesis.getTPeriodical() %>"
										name="t_periodical">
								</div>
						 
								<label class="col-lg-2 control-label col-lg-offset-1">期刊CN刊号
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=thesis.getTCnid() %>"
										name="t_CNId">
								</div>
							</div>
						<div class="form-group ">
								<label class="col-lg-2 control-label">期刊ISSN号
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=thesis.getTIssnid() %>"
										name="t_ISSNId">
								</div>
							 
								<label class="col-lg-2 control-label col-lg-offset-1">发表时间</label>
								<div class="col-lg-3">
								
								<input type="text" class="form-control" value="<%=thesis.getTTime().toString() %>"
										name="t_time" readonly="true">
								</div>
							</div>
					<div class="form-group ">
								<label  class="col-lg-2 control-label">第二作者
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=thesis.getSecond()%>"
										name="second">
								</div>
						 
								<label class="col-lg-2 control-label col-lg-offset-1">第二作者学工号
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" name="secondnum">
								</div>
							</div>
						<div class="form-group ">
								<label class="col-lg-2 control-label">第三作者
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=thesis.getThird() %>" name="third">
								</div>
							 
								<label class="col-lg-2 control-label col-lg-offset-1">第三作者学工号
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" name="thirdnum">
								</div>
							</div>
					<div class="form-group ">
								<label class="col-lg-2 control-label">其他人员
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=thesis.getTOthers() %>" name="t_others">
								</div>
						 
								<label class="col-lg-2 control-label col-lg-offset-1">其他人员学工号
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" name="t_othersnum">
								</div>
							</div>
					<div class="form-group ">
								<label class="control-label col-lg-2" >备注（是否核心）</label>
								<div class="col-lg-3">
									<select class="form-control m-bot10" name="t_remarks" value="<%=thesis.getTRemarks() %>">
										<option value="SCI、SSCI全文收录">SCI、SSCI全文收录</option>
										<option value="国家一级刊物">国家一级刊物</option>
										<option value="全国中文核心学术期刊">全国中文核心学术期刊</option>
										<option value="普通CN期刊">普通CN期刊</option>
										<option value="国家级报纸理论">国家级报纸理论</option>
										<option value="省级报纸理论、学术版">省级报纸理论、学术版</option>
									</select>
								</div>
						 
								<label class="col-lg-2 control-label col-lg-offset-1">审核状态</label>
								<div class="col-lg-3">
								
								<input type="text" class="form-control" value="<%=thesis.getTScore() %>"
										name="t_score" readonly="true">
								</div>
								</div>
						<div class="form-group ">
								<div class="col-lg-offset-5 col-lg-7">
									<button type="submit" class="btn btn-info" value="修改">修改</button>
								</div>
						</div>
						 
					
					</form>
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

