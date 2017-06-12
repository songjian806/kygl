<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.keyan.hibernate.form.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ page  import="com.keyan.hibernate.dao.*"%>
<html lang="en">
  <head>
	<%	Pppeople pppeople=(Pppeople)getServletContext().getAttribute("pppeople");
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

                      <li class="sub-menu active">
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
                                                                         修改成员信息
                          </header>
                          <div class="panel-body">
                              <div class=" form">
                                  <form class="cmxform form-horizontal tasi-form" method="post" action="Pppeopleform.do?method=update1" >
                                      <input class="form-control "  name="ppid" type="hidden" value="<%=pppeople.getPpid().toString() %>" />
                                      
                                      <div class="form-group ">
                                      
                                       <label for="cemail" class="control-label col-lg-1">对应项目ID</label>
                                          <div class="col-lg-4">
                                              <input class="form-control "  name="pid" value="<%=pppeople.getPid().toString() %>" readonly="true" />
                                          </div>
                                          <label for="cname" class="control-label col-lg-1 col-lg-offset-1">成员姓名</label>
                                          <div class="col-lg-4">
                                              <input class=" form-control"   name="ppname" value="<%=pppeople.getPpname() %>" minlength="2" type="text" required/>
                                          </div>
                                         
                                      </div>
                                        
                                       <div class="form-group ">
                                          <label for="ccomment" class="control-label col-lg-1">成员教工号</label>
                                          <div class="col-lg-4">
                                               <input class="form-control " name="ppusernum" value="<%=pppeople.getPpusernum() %>"/>
                                          </div>
                                          <label for="ccomment" class="control-label col-lg-1 col-lg-offset-1">成员类型</label>
                                          <div class="col-lg-4">
                                              <select class="form-control m-bot10" name="pptype" value="<%=pppeople.getPptype() %>">
                                              <option value="教授">教授</option>
                                              <option value="副教授">副教授</option> 
                                              <option value="讲师">讲师</option>
                                              <option value="助教">助教</option> 
                                              <option value="学生">学生</option>                                            
                                          </select>
                                          </div>
                                      </div>                               
                                     <div class="form-group ">
                                          <label for="ccomment" class="control-label col-lg-1">所在单位</label>
                                          <div class="col-lg-4">
                                               <input class="form-control " name="ppdept" value="<%=pppeople.getPpdept() %>"/>
                                          </div>
                                          <label for="ccomment" class="control-label col-lg-1 col-lg-offset-1">贡献率</label>
                                          <div class="col-lg-4">
                                               <input class="form-control " name="ppwork" value="<%=pppeople.getPpwork().toString() %>"/>
                                          </div>
                                      </div>                               
                                     
                                      
                                       <div class="form-group ">
                                         
                                          <label for="ccomment" class="control-label col-lg-1 ">署名顺序</label>
                                          <div class="col-lg-4">
                                              <input class="form-control " name="ppnum" value="<%=pppeople.getPpnum().toString() %>"/>
                                          </div>
                                      </div>
                                                                                                                
                                      <div class="form-group">
                                          <div class="col-lg-offset-5 col-lg-7">
                                              <button class="btn btn-danger" type="submit">修改</button>
                                              <button class="btn btn-danger" type="button" onclick="window.location.href='Pppeopleform.do?method=query&id=<%=pppeople.getPid().toString()%>'
                                                      ">返回</button>
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


    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>
    <!--script for this page-->
    <script src="js/form-validation-script.js"></script>
  </body>
</html>
