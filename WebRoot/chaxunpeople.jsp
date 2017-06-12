<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page  import="com.keyan.hibernate.form.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en">
  <head>
	
	<jsp:useBean id="pagination" class="com.keyan.tool.MyPagination"
		scope="session"></jsp:useBean>
  <% String name=null;
     String level=null;
     Keyanuser keyanuser=(Keyanuser)session.getAttribute("keyanuser");
     name=keyanuser.getName();
     level=keyanuser.getLevel();
              
             List list2=new ArrayList();
             
             String str = (String) request.getParameter("Page");
		     Gg tbManager=new Gg();
		     int Page = 1;
  
                if (str == null) {
          
				  list2=(List)getServletContext().getAttribute("list2");
				  session.removeAttribute("xlsList");
			 session.setAttribute("xlsList",list2);
			
				int pagesize = 100000; //指定每页显示的记录数
				if(list2!=null)
				{
				list2 = pagination.getInitPage(list2, Page,pagesize); //初始化分页信息
				}
			} else {
				Page = pagination.getPage(str);
				list2 = pagination.getAppointPage(Page); //获取指定页的数据
			}
   %>
    <base href="<%=basePath%>">
	
	
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
    

  </head>
<% Pppeople pppeople=(Pppeople)getServletContext().getAttribute("pppeople"); %>
    <% String  id=(String)getServletContext().getAttribute("id");
    Project1 project1=( Project1)getServletContext().getAttribute("project1"); %>
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
                  <li class="sub-menu active">
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
                  <li class="sub-menu ">
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
                          <li ><a class="" href="zhuanli.do?method=query32">专利管理</a></li>
                          <%} %>
                          <%if (keyanuser.getUserclasify().equals("0")) { %>
                          <li ><a class="" href="zhuanli.do?method=query31">专利管理</a></li>
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

      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                          <strong>项目成员信息列表</strong>
                          <button class="btn btn-info btn-sm pull-right" onclick="window.location.href='Shengxls4.do?method=chaxunpeople'"><i class="icon-cloud-download">导出Excel</i></button>
                          <%if(keyanuser.getUserclasify().equals("2")) {%>
                          <button class="btn btn-success btn-sm pull-right" onclick="window.location.href='Pppeopleform.do?method=insert1&pid=<%=id %>'"><i class="icon-plus">新增</i></button>
                          <% }
                          if(keyanuser.getUserclasify().equals("0") & keyanuser.getUsername().equals(project1.getUsernum())){%>
                           <button class="btn btn-success btn-sm pull-right" onclick="window.location.href='Pppeopleform.do?method=insert1&pid=<%=id %>'"><i class="icon-plus">新增</i></button>
                         <%  
                          
                          }%>
                          </header>
                          <table class="table table-striped table-bordered" id="sample_1">
                          <thead>
								  <tr>                         		  
                                  <th><div align="center">署名顺序</div></th>
                                  <th><div align="center">成员姓名</div></th>
                                   <th><div align="center">成员学号</div></th>
                                  <th><div align="center">所在单位</div></th>
                                  <th><div align="center">贡献率</div></th>
                                  <th><div align="center">成员类型</div></th>
                                  <th style="width:10%"><div align="center">操作</div></th>
                              </tr>
                           </thead>
                          <tbody>
  <%
     if(list2!=null)
      {
      
      for(int j=0;j<list2.size();j++)
      {
      
       pppeople=(Pppeople)list2.get(j);
       //pppeople=(Pppeople)list.get(i);
      %>
                          
                          	<tr class="odd gradeX">                         		 
                                  <td align="center"><%=pppeople.getPpnum() %></td>
                                  <td align="center"><%=pppeople.getPpname() %></td>
                                  <td align="center"><%=pppeople.getPpusernum() %></td>
                                  <td align="center"><%=pppeople.getPpdept() %></td>
                                  <td align="center"><%=pppeople.getPpwork() %></td>
                                  <td align="center"><%=pppeople.getPptype() %></td>
                                  <td align="center">                                 
                                  	<a href="Pppeopleform.do?method=update&id=<%=pppeople.getPpid().toString()%>"><button class="btn btn-info btn-xs"><i class="icon-pencil">编辑</i></button></a>						
								<%if(1<list2.size()){ %>
									<a href="Pppeopleform.do?method=delete&id=<%=pppeople.getPpid().toString()%>&pid=<%=pppeople.getPid().toString()%>"onclick="return yesno()"><button class="btn btn-danger btn-xs"><i class="icon-trash">删除</i></button></a> <% }else{%>                                
                                <button class="btn btn-danger btn-xs"><i class="icon-trash">删除</i></button></a>
                                <%} %> </td>                                 
                             </tr>
                          <%} }%> 
                          </tbody>
                          </table>
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
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>


    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

    <!--script for this page only-->
    <script src="js/dynamic-table.js"></script>


  </body>
</html>
