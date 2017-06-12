<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.keyan.hibernate.form.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ page  import="com.keyan.hibernate.dao.*"%>

<html lang="en">
  <head>
<%	Project1 project1=(Project1)getServletContext().getAttribute("project1");
		%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>科研管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-colorpicker/css/colorpicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker.css" />

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
	
  </head>
	
	
	<script type="text/javascript">
function yesno() { 
if(confirm("你真的要删除吗?")){
 return true;
}else return false;
} 
</script>
	<script type="text/javascript">
function yesno1() { 
if(confirm("你确定要审批吗?")){
 return true;
}else return false;
} 
</script>
	<%
		String status = (String) getServletContext().getAttribute("status");
		if (status != null) {
			if (status.equals("updatesuccess")) {
				out
						.println("<script type=\"text/javascript\">alert('修改成功');</script>");
			} else if (status.equals("addsuccess")) {
				out
						.println("<script type=\"text/javascript\">alert('添加成功');</script>");
			} else {
				out
						.println("<script type=\"text/javascript\">alert('修改失败');</script>");
			}
			getServletContext().removeAttribute("status");
		}

		Keyanuser keyanuser = new Keyanuser();
		keyanuser = (Keyanuser) session.getAttribute("keyanuser");
		String name=null;
        String level=null;
        name=keyanuser.getName();
        level=keyanuser.getLevel();
	%>
	<script type="text/javascript">
function showSearch(){
document.all.searchDiv.style.visibility=document.all.searchDiv.style.visibility=='hidden'?"visible":"hidden";
}
</script>
<script>
function open1(){

window.open("hh.html","_blank","fullscreen=0,toolbar=0,location=0,menubar=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1,width=680,height=480,top=200");

}
</script>
		
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

                  <li class="sub-menu active ">
                      <a href="javascript:;" class="">
                          <i class="icon-th"></i>
                          <span>经费管理</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">
                          <%if (keyanuser.getUserclasify().equals("0")) { %>
                          <li class="active"><a class="" href="mode.do?method=query117">经费管理</a></li>
                          <%} %>
                          <%if (keyanuser.getUserclasify().equals("1")) { %>
                          <li class="active"><a class="" href="mode.do?method=query118">经费管理</a></li>
                          <%} %>
                          <%if (keyanuser.getUserclasify().equals("2")) { %>
                          <li class="active"><a class="" href="mode.do?method=query119">经费管理</a></li>
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
                          <li><a class="" href="info.do?method=query1">任务信息查看</a></li>

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
              <!-- page start-->
           <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                           <strong> 修改申报</strong>
                          </header>
                          <div class="panel-body">
                              <form class="form-horizontal tasi-form" action="project1.do?method=update1" method="post" enctype="multipart/form-data" onsubmit="return onsubmit1()">
                                  <input type="hidden" class="form-control" name="pid" value="<%=project1.getPid().toString()%>">
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">项目名称</label>
                                      <div class="col-lg-3">
                                          <input type="text" class="form-control" name="pname" readOnly="true" value="<%=project1.getPname()%>">
                                      </div>
                                   
                                      <label class="col-lg-2 control-label col-lg-offset-1">项目批次</label>
                                      <div class="col-lg-3">
                                          <input type="text" class="form-control" name="pnum" readOnly="true" value="<%=project1.getPnum()%>">                                         
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">项目来源</label>
                                      <div class="col-lg-3">
                                           <input type="text" class="form-control" name="pccome" value="<%=project1.getPcome()%>">
                                      </div>
                                   
                                      <label class="col-lg-2 control-label col-lg-offset-1">项目分类</label>
                                      <div class="col-lg-3">
                                           <select class="form-control m-bot10" name="pclassify" value="<%=project1.getPclassify()%>">
                                              <option>重点项目</option>
                                              <option>一般项目</option>
                                              <option>青年项目</option>
                                              <option>自筹项目</option>
                                              <option>横向课题</option>
                                          </select>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">项目负责人</label>
                                      <div class="col-lg-3">
                                          <input class="form-control" id="focusedInput" type="text" name="pcontrol" value="<%=project1.getPcontrol()%>" >
                                      </div>
                                   
                                     
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">申报院系</label>
                                      <div class="col-lg-3">
                                           <input type="text"  size="16" class="form-control" name="pdept" value="<%=project1.getPdept()%>">
                                      </div>
                                   
                                      <label class="col-lg-2 control-label col-lg-offset-1">成果形式</label>
                                      <div class="col-lg-3">
                                           <select class="form-control m-bot10" name="pclassify" value="<%=project1.getPform()%>">
                                              <option>论文</option>
                                              <option>论著</option>
                                              <option>项目</option>
                                              <option>专利</option>
                                          </select>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">院系审批</label>
                                      <div class="col-lg-3">
                                           <input type="text" readonly="true"  class="form-control" name="pstate1" value="<%=project1.getPstate1() %>">
                                      </div>
                                   
                                      <label class="col-lg-2 control-label col-lg-offset-1">学校审批</label>
                                      <div class="col-lg-3">
                                           <input  type="text"readonly="true"  class="form-control" name="pstate2" value="<%=project1.getPstate2() %>">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">开始日期</label>
                                      <div class="col-lg-3">
                                          <input id="dp2" type="text"  size="16" class="form-control" name="pstar" value="<%=project1.getPstar().toString()%>">
                                      </div>
                                   
                                      <label class="col-lg-2 control-label col-lg-offset-1">预计完成时间</label>
                                      <div class="col-lg-3">
                                          <input id="dp3" type="text"  size="16" class="form-control" name="pfinish" value="<%=project1.getPfinish().toString()%>">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">备注</label>
                                      <div class="col-lg-3">
                                          <input type="text" class="form-control" name="premark" value="<%=project1.getPremark() %>">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                  <div class="col-lg-offset-5">
                                  <button type="submit" class="btn btn-info">修改</button>
                                  </div>
                                  </div>
                                  
                              </form>
                          </div>
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

    <script src="js/jquery-ui-1.9.2.custom.min.js"></script>

    <!--custom switch-->
    <script src="js/bootstrap-switch.js"></script>
    <!--custom tagsinput-->
    <script src="js/jquery.tagsinput.js"></script>
    <!--custom checkbox & radio-->
    <script type="text/javascript" src="js/ga.js"></script>

    <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>


  <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

  <!--script for this page-->
  <script src="js/form-component.js"></script>

  </body>
</html>
