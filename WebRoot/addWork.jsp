<%@ page import="com.keyan.hibernate.form.Keyanuser" %>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<jsp:useBean id="JSONRPCBridge" scope="session"
	class="com.metaparadigm.jsonrpc.JSONRPCBridge" />

<jsp:useBean id="ajax" class="com.keyan.ajax.servlet.AjaxBean"></jsp:useBean>

<%
	JSONRPCBridge.registerObject("ajax", ajax);
%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<link rel="shortcut icon" href="acces/img/favicon.html">
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
<script type="text/javascript" src="js/calendar.js"></script>
<script>
	var CalendarWebControl = new atCalendarControl();
</script>

<link rel="stylesheet" type="text/css" href="data/calendar.css">
<script type="text/javascript" src="data/calendar.js"></script>

</head>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
<script type="text/javascript" src="js/jsonrpc.js"></script>
<script type="text/javascript">
	jsonrpc = new JSONRpcClient("JSON-RPC");
function yzTitle()
{
  var id = workForm.WTitle.value;
 
	var result = jsonrpc.ajax.yanzhengWork(id);
	
    if(result==false)
    {
     alert("该论著已经存在！");
     workForm.WTitle.value="";
     workForm.WTitle.focus();
    }
}


function chongzhi(){
   workForm.WTitle.value="";
   workForm.WPublisher.value="";
   workForm.WIsbnid.value="";
   workForm.WOthers.value="";
    workForm.WSecond.value="";
     workForm.WThird.value="";
}
</script>
<script type="text/javascript">
	function onsubmit1()
{

if(workForm.WTitle.value=='')
{
  alert("论著名称不能为空");
  return false;
}
else if(workForm.WPublisher.value=='')
{
  alert("出版社不能为空");
  return false;
}
else if(workForm.WIsbnid.value=='')
{
  alert("ISBN号不能为空");
  return false;
}

return true;

}
</script>
<%
	String name = null;
	String level = null;
	Keyanuser keyanuser = (Keyanuser) session.getAttribute("keyanuser");
	name = keyanuser.getName();
	level = keyanuser.getLevel();
%>

<%
	String name1 = (String) session.getAttribute("username");
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
							<li class="active"><a class="" href="work.do?method=query3">论著管理</a></li>
							<%} %>
							<%if (keyanuser.getUserclasify().equals("1")) { %>
							<li class="active"><a class="" href="work.do?method=query32">论著管理</a></li>
							<%} %>
							<%if (keyanuser.getUserclasify().equals("0")) { %>
							<li class="active"><a class="" href="work.do?method=query31">论著管理</a></li>
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
						  <li><a href="thesis.jsp"> 论著管理</a></li>
						  <li class="active">添加论著</li>

					  </ul>
					  <!--breadcrumbs end -->
				  </div>
			  </div>

            <div class="row">
              <div class="col-lg-12">
			   <section class="panel">
                <header class="panel-heading"><strong> 添加论著</strong> </header>
				<div class="panel-body">
				<div class=" form">
				    <form class="cmxform form-horizontal tasi-form" action="work.do?method=insert" method="post" enctype="multipart/form-data" onsubmit="return onsubmit1()">
 				        <div class="form-group ">
								<label for="inputEmail1" class="col-lg-2 control-label">主编</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="<%=name1 %>" name="WName" readonly="true"> 
								</div>
							
								<label class="control-label col-lg-2 col-lg-offset-1">职称</label>
								<div class="col-lg-3">
									<select class="form-control m-bot10" name="WPost">
										<option value="教授">教授</option>
										<option value="副教授">副教授</option>
										<option value="讲师">讲师</option>
										<option value="助教">助教</option>

									</select>
								</div>
							</div>
						
						 <div class="form-group ">
								<label class="control-label col-lg-2"  >所在单位</label>
								<div class="col-lg-3">
									<select class="form-control m-bot10" name="WUnit">
										<option value="数计学院">数计学院</option>
										<option value="校领导">校领导</option>
										<option value="会计学院">会计学院</option>
									</select>
								</div>
							   <label  class="col-lg-2 control-label col-lg-offset-1">论著（教材）名称
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" placeholder="请输入论著（教材）名称" name="WTitle" onblur="yzTitle()">
								</div>
							</div>
						
						 <div class="form-group ">
								<label  class="col-lg-2 control-label">出版社
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" placeholder="请输入出版社" name="WPublisher">
								</div>
						<label  class="col-lg-2 control-label col-lg-offset-1">ISBN书号</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" placeholder="请输入ISBN书号" name="WIsbnid">
								</div>
						</div>
						 <div class="form-group ">
								<label  class="col-lg-2 control-label">第二作者
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" placeholder="请输入第二作者" name="WSecond">
								</div>
							 <label class="col-lg-2 control-label col-lg-offset-1">第二作者学工号
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" placeholder="请输入第二作者学工号" name="WSecondnum">
								</div>
							
						</div>
						 <div class="form-group ">
								<label class="col-lg-2 control-label">第三作者
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" placeholder="请输入第三作者" name="WThird">
								</div>
							 <label  class="col-lg-2 control-label col-lg-offset-1">第三作者学工号
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" placeholder="请输入第三作者学工号" name="WThirdnum">
								
							</div>
						</div>
						<div class="form-group ">
								<label  class="col-lg-2 control-label">其他参编人员
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" placeholder="请输其他参编人员(请按顺序填写,用“、”隔开)" name="WOthers">
							     </div>
								<label class="col-lg-2 control-label col-lg-offset-1">其他参编人员学工号
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" placeholder="请输其他参编人员学工号(请按顺序填写,用“、”隔开)" name="WOthersnum">
								</div>
							
						</div>
						<div class="form-group ">
								<label  class="col-lg-2 control-label">审核状态</label>
								<div class="col-lg-3">
									<span type="text" class="form-control" 
										 readonly="true">未审核 </span>
								</div>
							
								<label class="col-lg-2 control-label col-lg-offset-1">发表时间</label>
								<div class="col-lg-3">
									<input id="dp2" type="text" value="请选择发表时间" size="16"
										class="form-control">
								</div>
							
						</div>
					     <div class="form-group ">
								<label class="control-label col-lg-2">备注（等级）</label>
								<div class="col-lg-3">
									<select class="form-control m-bot10" name="WRemarks">
										<option value="学术专利">学术专利</option>
										<option value="教育部推荐教材">教育部推荐教材</option>
										<option value="其他著作或教材">其他著作或教材</option>
										<option value="工具书">工具书</option>
										
									</select>
								</div>
							
						
								<label for="inputEmail1" class="col-lg-2 control-label col-lg-offset-1">文件上传(可省略)
								</label>
								<div class="col-lg-3">
									<input type="file" id="exampleInputFile" name="file">
								</div>
							
						</div>
						 <div class="form-group ">
								<div class="col-lg-offset-5 col-lg-6">
									<button type="submit" class="btn btn-success" value="添加">添加</button>
									<button type="reset" class="btn btn-default" value="重置">重置</button>
								</div>
							</div>
							</div>
						</div>
					<form>
				</div>

			</section>
</div>
</div>
		</section>
		
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

