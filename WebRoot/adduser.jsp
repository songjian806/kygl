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

    <title>添加用户</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

<script type="text/javascript" src="js/jsonrpc.js"></script>
<script language="javascript">
	//构造商品分类下拉列表
	
jsonrpc = new JSONRpcClient("JSON-RPC");
	

function yzName()
{
  var id = managerForm.username.value;

	var result = jsonrpc.ajax.yanzheng(id);
	
    if(result==false)
    {
     alert("该用户已经存在!");
     managerForm.username.value="";
     managerForm.username.focus();
    }
}

</script>
<script type="text/javascript">
function chongzhi(){
   userForm.name.value="";
   userForm.post.value="";
   userForm.username.value="";
   userForm.password.value="";
   userForm.level.value="";
}
function onsubmit1()
{

if(userForm.username.value=='')
{
  alert("用户名不能为空");
  return false;
}
else if(userForm.password.value=='')
{
  alert("密码不能为空");
  return false;
}
else if(userForm.name.value=='')
{
  alert("姓名不能为空");
  return false;
}
else if(userForm.level.value=='')
{
  alert("角色不能为空");
  return false;
}
return true;

}
</script>
  </head>
   <jsp:useBean id="pagination" class="com.keyan.tool.MyPagination"
		scope="session"></jsp:useBean>
  <%
              
             List list=new ArrayList();
             String str = (String) request.getParameter("Page");
		    
		     int Page = 1;
  
             if (str == null) {
          
				  list=(List)getServletContext().getAttribute("list");
				
			
				int pagesize = 10; //指定每页显示的记录数
				if(list!=null)
				{
				list = pagination.getInitPage(list, Page,pagesize); //初始化分页信息
				}
			} else {
				Page = pagination.getPage(str);
				list = pagination.getAppointPage(Page); //获取指定页的数据
			}
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
                  <li class="sub-menu active">
                      <a href="javascript:;" class="">
                          <i class="icon-book"></i>
                          <span>系统管理</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="user.do?method=query">用户信息</a></li>
                          <li class="active"><a class="" href="user.do?method=adduser">添加用户</a></li>


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
              <!-- page start-->
             
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                          <strong>添加用户</strong>
                          </header>
                          <div class="panel-body">
                              <div class=" form">
                                  <form class="cmxform form-horizontal tasi-form" action="user.do?method=insert" method="post" onsubmit="return onsubmit1()">
                                      <div class="form-group ">
                                          <label for="cname" class="control-label col-lg-1">用户名</label>
                                          <div class="col-lg-4">
                                              <input class=" form-control" id="cname"  name="username" minlength="2" type="text" required />
                                          </div>
                                          <label for="cemail" class="control-label col-lg-1 col-lg-offset-1">密码</label>
                                          <div class="col-lg-4">
                                              <input class="form-control " type="password"  name="password" required />
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="curl" class="control-label col-lg-1">姓名：</label>
                                          <div class="col-lg-4">
                                              <input class="form-control "  name="name" required />
                                          </div>
										  <label for="ccomment" class="control-label col-lg-1 col-lg-offset-1">权限：</label>
                                          <div class="col-lg-4">
                                              <select class="form-control m-bot10" name="userclasify">
                                                 <option value="0">科研人员</option>
					                             <option value="1">系科研秘书</option>
					                             <option value="2">校科研秘书</option>
					                             <option value="3">系统管理员</option>
                                          </select>
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="ccomment" class="control-label col-lg-1">角色：</label>
                                          <div class="col-lg-4">
                                              <select class="form-control m-bot10" name="level">
                                               <option value="科研人员">科研人员</option>
					                             <option value="系科研秘书">系科研秘书</option>
					                             <option value="校科研秘书">校科研秘书</option>
					                             <option value="系统管理员">系统管理员</option>
                                          </select>
                                          </div>
										   <label for="ccomment" class="control-label col-lg-1 col-lg-offset-1">职称：</label>
                                          <div class="col-lg-4">
                                              <select class="form-control m-bot10" name="post">
                                               <option value="教授">教授</option>
					                           <option value="副教授">副教授</option>
					                           <option value="讲师">讲师</option>
					                           <option value="助教">助教</option>
                                          </select>
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="ccomment" class="control-label col-lg-1">所在单位：</label>
                                          <div class="col-lg-4">
                                              <select class="form-control m-bot10" name="userdept">
                                              <option value="数学与计算机学院">数学与计算机学院</option>
					                          <option value="会计学院">会计学院</option>
					                          <option value="工商管理学院">工商管理学院</option>
					                          <option value="财税与公共管理学院">财税与公共管理学院</option>
					                          <option value="金融学院">金融学院</option>
					                          <option value="经济学院">经济学院</option>
					                          <option value="文学与艺术传媒学院">文学与艺术传媒学院</option>
					                          <option value="机械工程学院">机械工程学院</option>
					                          <option value="外国语学院">外国语学院</option>
					                          <option value="建筑工程学院">建筑工程学院</option>
					                          <option value="电气工程学院">电气工程学院</option>
					                          <option value="法学院">法学院</option>
					                          <option value="校领导">校领导</option>
                                          </select>
                                          </div>
										   <label for="curl" class="control-label col-lg-1 col-lg-offset-1">联系电话：</label>
                                          <div class="col-lg-4">
                                              <input class="form-control " name="tel" />
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="curl" class="control-label col-lg-1">居住地址：</label>
                                          <div class="col-lg-10">
                                              <input class="form-control "  name="addr" />
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <div class="col-lg-offset-5 col-lg-7">
                                              <button class="btn btn-danger" type="submit">保存</button>
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
   <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script src="js/common-scripts.js"></script>
    <script src="js/form-validation-script.js"></script>
      
  </body>
</html>
