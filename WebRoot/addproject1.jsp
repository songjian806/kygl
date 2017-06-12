<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page  import="com.keyan.hibernate.form.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge"/>

<jsp:useBean id="ajax" class="com.keyan.ajax.servlet.AjaxBean"></jsp:useBean>

<%
	JSONRPCBridge.registerObject("ajax",ajax);
%>
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
  <%	Pici pici=(Pici)getServletContext().getAttribute("pici");
		%>
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

  </head>
  <script type="text/javascript">
jsonrpc = new JSONRpcClient("JSON-RPC");


function yzTitle1()
{
  var id = project1form.pname.value;
  
	var result = jsonrpc.ajax.yanzhengproject1(id);
	
    if(result==false)
    {
     alert("该项目已经存在！");
    project1form.pname.value="";
     piciform.pcname.focus();
    }
}
function open1(){

window.open("chyuan.html","_blank","fullscreen=0,toolbar=0,location=100,menubar=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1,width=680,height=480,top=200");

}
function herff()
{
alert(project1form);
project1form.submit();
}

function onsubmit1()
{

if(project1form.pname.value=='')
{
  alert("项目名称不能为空");
  return false;
}
else if(project1form.pcontrol.value=='')
{
  alert("项目负责人不能为空");
  return false;
}
else if(project1form.pdept.value=='')
{
  alert("申报院系不能为空");
  return false;
}
else if(project1form.pstar.value=='')
{
  alert("项目开始时间不能为空");
  return false;
}
else if(project1form.pfinish.value=='')
{
  alert("项目结束时间不能为空");
  return false;
}
return true;

}
</script>

  <body>

  <section id="container" class="">
      <!--header start-->
      <%@ include file="top.jsp" %>
      <!--header end-->
      <!--sidebar start-->
      <aside>
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
                          <li><a href="Piciform.do?method=query">申报批次列表</a></li>
                          <li class="active">申报基本信息列表</li>
                 
                       </ul>
                      <!--breadcrumbs end -->
                  </div>
            </div>
              <!-- page start-->
             
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                                                                     申报基本信息表
                          </header>
                          <div class="panel-body">
                              <div class=" form">
                                  <form class="cmxform form-horizontal tasi-form" method="post" action="project1.do?method=insert" enctype="multipart/form-data" onsubmit="return onsubmit1()">
                                      <div class="form-group ">
                                          <label for="cname" class="control-label col-lg-2">项目批次</label>
                                          <div class="col-lg-3">
                                              <input readonly="true" class=" form-control" id="cname"  name="pnum" value="<%=pici.getPcname()  %>" minlength="2" type="text" required />
                                          </div>
                                          <label for="cemail" class="control-label col-lg-2 col-lg-offset-1">项目名称</label>
                                          <div class="col-lg-3">
                                              <input class="form-control "  name="pname" required />
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="curl" class="control-label col-lg-2">项目来源</label>
                                          <div class="col-lg-3">
                                              <input class="form-control "  name="pcome" value="<%=pici.getPccome() %>" />
                                          </div>
                                          
                                          <label for="ccomment" class="control-label col-lg-2 col-lg-offset-1">项目分类</label>
                                          <div class="col-lg-3">
                                           <select class="form-control m-bot10" name="pclassify">
                                              <option value="重点项目">重点项目</option>
                                              <option value="一般项目">一般项目</option> 
                                              <option value="青年项目">青年项目</option>
                                              <option value="自筹项目">自筹项目</option> 
                                              <option value="横向课题">横向课题</option>                                            
                                          </select>
                                          </div>
                                      </div>
                                      
                                       <div class="form-group ">
                                          <label for="ccomment" class="control-label col-lg-2">项目负责人</label>
                                          <div class="col-lg-3">
                                               <input class="form-control " name="pcontrol" value="<%=keyanuser.getName() %>" />
                                          </div>
                                          <label for="ccomment" class="control-label col-lg-2 col-lg-offset-1">申报院系</label>
                                          <div class="col-lg-3">
                                               <input class="form-control "  name="pdept" value="<%=keyanuser.getUserdept() %>" />
                                          </div>
                                      </div>
                                      
                                     <div class="form-group">
                                      <label class="col-lg-2 control-label">开始日期</label>
                                      <div class="col-lg-3">
                                          <input id="dp2" type="text" value="3-09-2017"  class="form-control" name="pstar">
                                          
                                      </div>
                                      <label class="col-lg-2 control-label col-lg-offset-1">预计完成时间</label>
                                          <div class="col-lg-3">
                                               <input id="dp3" type="text" value="3-21-2017" size="16" class="form-control" name="pfinish">
                                          </div>
                                     </div>
                                     
                                       <div class="form-group ">
                                          <label class="control-label col-lg-2">成果形式</label>
                                          <div class="col-lg-3">
                                              <select class="form-control m-bot10" name="pform">
                                              <option value="论文">论文</option>
                                              <option value="论著">论著</option> 
                                              <option value="项目">项目</option>
                                              <option value="专利">专利</option>                                             
                                          </select>
                                          </div>
                                          <label class="control-label col-lg-2 col-lg-offset-1">文件上传</label>
                                        <div class="col-lg-3">
                                            <input type="file" id="exampleInputFile" name="padjuct">
                                        </div>
                                      </div>
                                      
                                       <div class="form-group ">
                                          <label class="control-label col-lg-2">备注</label>
                                          <div class="col-lg-3">
                                               <input class="form-control "  name="premark" />
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <div class="col-lg-offset-5 col-lg-7">
                                              <button class="btn btn-danger" type="submit">下一步</button>
                                              <button class="btn btn-default" type="reset">重置</button>
                                             
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
	<script type="text/javascript" src="acces/assets/ckeditor/ckeditor.js"></script>


	<!--common script for all pages-->
	<script src="js/common-scripts.js"></script>

	<!--script for this page-->
	<script src="js/form-component.js"></script>
  </body>
</html>
