<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.keyan.hibernate.form.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>

   <jsp:useBean id="pagination" class="com.keyan.tool.MyPagination"
		scope="session"></jsp:useBean>
  <%
               
             List list=new ArrayList();
             String str = (String) request.getParameter("Page");
		    
		     int Page = 1;
  
             if (str == null) {
          
				  list=(List)getServletContext().getAttribute("list");
				
			
				int pagesize = 1000000; //指定每页显示的记录数
				if(list!=null)
				{
				list = pagination.getInitPage(list, Page,pagesize); //初始化分页信息
				}
			} else {
				Page = pagination.getPage(str);
				list = pagination.getAppointPage(Page); //获取指定页的数据
			}
   %>

		<%
String name=null;
String level=null;
Keyanuser keyanuser=(Keyanuser)session.getAttribute("keyanuser");
name=keyanuser.getName();
level=keyanuser.getLevel();
 %>
 
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
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>用户基本信息列表</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
	
<script type="text/javascript">
function yesno() { 
if(confirm("你真的要删除吗?")){
 return true;
}else return false;
} 
</script>

	<script type="text/javascript" src="js/jsonrpc.js"></script>
<script language="javascript">
	
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

  </head>

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
                          <li>用户基本信息</li>
                          <li> 用户基本信息管理</li>


                      </ul>
                      <!--breadcrumbs end -->
                  </div>
              </div>

          <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
   
                         <header class="panel-heading">
                          <strong>用户基本信息列表</strong>
                          </header>
                          <table class="table table-striped table-bordered" id="sample_1">
  
  
                            <thead>
                                <tr>
                          		  
                                  <th><div align="center">用户名</div></th>
                                  <th><div align="center">权限</div></th>
                                  <th><div align="center">角色</div></th>
                                  <th><div align="center">姓名</div></th>
                                  <th><div align="center">职称</div></th>
                                  <th><div align="center">所在单位</div></th>
                                 <th><div align="center">联系电话</div></th>
								 <th><div align="center">现居住地址</div></th>
								 <th style="width:10%"><div align="center">基本操作</div></th>
                                </tr>
                           </thead>
      
      <%
      if(list!=null)
      {
      
      for(int i=0;i<list.size();i++)
      {
  
       keyanuser=(Keyanuser)list.get(i);
      
      %>
     
                          	<tr class="odd gradeX">
                          		   
                                  <td align="center"><%=keyanuser.getUsername() %></td>
                                  <td align="center" class="hidden-phone"><%=keyanuser.getUserclasify()%></td>
                                  <td align="center"><%=keyanuser.getLevel() %></td>
                                  <td align="center"><%=keyanuser.getName() %>
								  </td>
                                  <td align="center">
                                  <%=keyanuser.getPost() %>
                                  </td>
								  <td align="center">
                                  <%=keyanuser.getUserdept() %>
                                  </td>
                                  <td align="center">
                                  <%=keyanuser.getTel() %>
                                  </td>
								  <td align="center">
								  <%=keyanuser.getAddr() %>
                                  </td>
                                  <td align="center">
                                      <button class="btn btn-danger btn-xs" onclick="javascript:window.location.href='user.do?method=detele&&id=<%=keyanuser.getId().toString() %>'"><i class="icon-trash">删除</i></button>
                                      <button class="btn btn-success btn-xs" onclick="javascript:window.location.href='user.do?method=query1&&id=<%=keyanuser.getId().toString() %>'"><i class="icon-pencil ">修改</i></button>
                                      <%if(keyanuser.getChecked().equals("0")){ %>
                                     <button class="btn btn-success btn-xs" onclick="javascript:window.location.href='user.do?method=shenhe&&id=<%=keyanuser.getId().toString() %>'"><i class="icon-ok"></i>审核</button>
                                      <%}else {%>
                                      <button class="btn btn-default btn-xs"><i class="icon-ok"></i>审核</button>
                                      <%} %>
                                      
                                  </td>
                             </tr>
                            <% } }%>
                         </table>
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
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>


    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

    <!--script for this page only-->
    <script src="js/dynamic-table.js"></script>

  </body>
</html>
