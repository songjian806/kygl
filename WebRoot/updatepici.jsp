<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.keyan.hibernate.form.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ page  import="com.keyan.hibernate.dao.*"%>
<html lang="en">
  <head>
	<%	Pici pici=(Pici)getServletContext().getAttribute("pici");
		%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
    <meta name="author" content="Mosaddek">
     
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

	%>
	<%
     String name=null;
     String level=null;
     Keyanuser keyanuser=(Keyanuser)session.getAttribute("keyanuser");
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
                           <strong> 修改批次</strong>
                          </header>
                          <div class="panel-body">
                              <div class=" form">
                                  <form class="cmxform form-horizontal tasi-form" method="post" action="Piciform.do?method=update1" >
                                      <input class="form-control "  name="id" type="hidden" value="<%=pici.getId().toString() %>" />
                                      <div class="form-group ">
                                          <label for="cname" class="control-label col-lg-2">申报批次</label>
                                          <div class="col-lg-3">
                                              <input class=" form-control"   name="pcname" value="<%=pici.getPcname() %>" minlength="2" type="text" required/>
                                          </div>
                                       
                                          <label for="cemail" class="control-label col-lg-2 col-lg-offset-1">项目来源</label>
                                          <div class="col-lg-3">
                                              <input class="form-control "  name="pccome" value="<%=pici.getPccome() %>" required />
                                          </div>
                                      </div>                                  
                                      <div class="form-group ">
                                          <label for="ccomment" class="control-label col-lg-2">项目分类</label>
                                          <div class="col-lg-3">
                                              <select class="form-control m-bot10" name="pcclasify" value="<%=pici.getPcclasify() %>">
                                              <option value="重点项目">重点项目</option>
                                              <option value="一般项目">一般项目</option> 
                                              <option value="青年项目">青年项目</option>
                                              <option value="自筹项目">自筹项目</option> 
                                              <option value="横向课题">横向课题</option>                                            
                                          </select>
                                          </div>
                                       
                                          <label for="ccomment" class="control-label col-lg-2 col-lg-offset-1">批次描述</label>
                                          <div class="col-lg-3">
                                               <input class="form-control " name="pcremark" value="<%=pici.getPcremark() %>"/>
                                          </div>
                                      </div>
                                       <div class="form-group ">
                                          <label class="control-label col-lg-2">开始日期</label>
                                          <div class="col-lg-3">
                                               <input id="dp2" type="text" value="<%=pici.getPcstar() %>" class="form-control" name="pcstar">
                                          </div>
                                       
                                          <label class="control-label col-lg-2 col-lg-offset-1">结束时间</label>
                                          <div class="col-lg-3">
                                               <input id="dp3" type="text" value="<%=pici.getPcfinish() %>" class="form-control" name="pcfinish">
                                          </div>
                                      </div>
                                       <div class="form-group ">
                                          <label for="ccomment" class="control-label col-lg-2">批次状态</label>
                                          <div class="col-lg-3">
                                              <select class="form-control m-bot10" name="pcstate" value="<%=pici.getPcclasify() %>">
                                              <option value="申报中">申报中</option>
                                              <option value="已停止">已停止</option>                                                                                       
                                          </select>
                                          </div>
                                      </div>
                                     
                                      <div class="form-group">
                                          <div class="col-lg-offset-5 col-lg-7">
                                              <button class="btn btn-success" type="submit">修改</button>
                                       
                                          </div>
                                      </div>
                                  </form>
                              </div>

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
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script src="js/jquery-ui-1.9.2.custom.min.js"></script>
    
    <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>

    <script src="js/common-scripts.js"></script>
    <!--script for this page-->
   <script src="js/form-validation-script.js"></script>
   <script src="js/bootstrap-switch.js"></script>
   <script src="js/jquery.tagsinput.js"></script>
  <script type="text/javascript" src="js/ga.js"></script>
   <script src="js/form-component.js"></script>
 
  </body>
</html>
