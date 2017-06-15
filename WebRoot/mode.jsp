<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page  import="com.keyan.hibernate.form.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>

<jsp:useBean id="pagination" class="com.keyan.tool.MyPagination"
scope="session"></jsp:useBean>
		
		<%
String name=null;
String level=null;
Keyanuser keyanuser=(Keyanuser)session.getAttribute("keyanuser");
name=keyanuser.getName();
level=keyanuser.getLevel();
 %>
 
 <%
              
             List list1=new ArrayList();
             
             String str = (String) request.getParameter("Page");
		     Gg tbManager=new Gg();
		     int Page = 1;
  
                if (str == null) {
          
				  list1=(List)getServletContext().getAttribute("list");
				 session.setAttribute("xlsList",list1);
			
				int pagesize = 1000000; //指定每页显示的记录数
				if(list1!=null)
				{
				list1 = pagination.getInitPage(list1, Page,pagesize); //初始化分页信息
				}
			} else {
				Page = pagination.getPage(str);
				list1 = pagination.getAppointPage(Page); //获取指定页的数据
			}
   %>
   
   <%
			String status = (String) getServletContext().getAttribute("status");
			if (status != null) {
				if (status.equals("updatesuccess")) {
					out.println("<script type=\"text/javascript\">alert('修改成功');</script>");
				} else if (status.equals("addsuccess")) {
					out.println("<script type=\"text/javascript\">alert('添加成功');</script>");
				} else {
					out.println("<script type=\"text/javascript\">alert('修改失败');</script>");
				}
				getServletContext().removeAttribute("status");
			}

		%>
		
		<%
              
             List list=new ArrayList();
            Mode mode=new Mode();
		     list=(List)getServletContext().getAttribute("list");
			 session.setAttribute("xlsList",list);
%>
 
<html lang="en">
<head>
    

    <title>科研管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

</head>
<body>

   <section id="container" class="">
      <!--header start-->
    <%@include file="top.jsp"%>
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

                   <li class="sub-menu active">
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
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          <div class="row">
                  <div class="col-lg-12">
                      <!--breadcrumbs start -->
                      <ul class="breadcrumb">
                          <li><a href="index.jsp"><i class="icon-home"></i>首页</a></li>
                          <li><a href="#">经费管理</a></li>
                          <li class="active">经费管理</li>
                        
                      </ul>
                      <!--breadcrumbs end -->
                  </div>
            </div>
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                          <strong>经费管理</strong>
                          <%if(keyanuser.getUserclasify().equals("0")) {%>
                          <button class="btn btn-sm btn-info pull-right" onclick="window.location.href='addMode.jsp'"><i class="icon-plus">新增</i></button>
                          <% }%>
                          </header>
                          <table class="table table-striped table-bordered" id="sample_1">
                          <thead>
                          	<tr>  
                          	      <th><div align="center"> 项目名</div></th>
                                  <th><div align="center"> 所属学院</div></th>
                                 
                                  <th><div align="center"> 负责人  </div></th>
                                  <th><div align="center"> 负责人学工号 </div></th>
                                  <th><div align="center"> 项目分类</div></th>
                                  <th> <div align="center">经费</div></th>
                                  <th><div align="center"> 时间</div></th>
                                  <th style="width:8%"><div align="center">拨款状态</div></th>
                                  <th><div align="center">审核状态</div></th>
                                  <th><div align="center"> 备注</div></th>
                                  <th style="width:10%"><div align="center"> 基本操作</div></th>
                            
                                  
                              </tr>
                           </thead>
                          <tbody>
                          
      <%
      if(list1!=null)
      {
      
      for(int i=0;i<list1.size();i++)
      {
      mode=(Mode)list1.get(i);
      %>
                          
                          	<tr class="odd gradeX">
                                  <td align="center"><%=mode.getXmname() %></td>
                                  <td align="center"><%=mode.getPici() %></td>
                               
                                    
                                  <td align="center"><%=mode.getJFName() %></td>
                                   <td align="center"><%=mode.getMusernum() %></td>
                                  <td align="center"><%=mode.getFenlei()%></td>
                                  <td align="center"><%=mode.getXmjingfei() %></td>
                                  <td align="center"><%=mode.getTime().toString().split(" ")[0] %></td>
                                  <td align="center">
                                  
                                  <%if(mode.getBokuanzt().equals("否")){ %>
                                 
                                  <span class="label label-danger">否</span>
                                  
                                  <%} else{%>
									<span class="label label-success">是</span>
								  <%}%>                                 
                                  </td>
                                  <td align="center"><%=mode.getJFScore()%></td>
                                  <td align="center"><%=mode.getBeizhu()%></td>
                                 
                                     <%if(keyanuser.getUserclasify().equals("0")){ %>
														 <td align="center">
															
															<%if(mode.getJFScore().equals("未审核")){ %>
																<a  href="mode.do?method=detele1&id=<%=mode.getId().toString()%>" onclick="return yesno()"><button class="btn btn-danger btn-xs"><i class="icon-trash ">删除</i></button></a>
																<%} 
																else
																{%>
																<button class="btn btn-default btn-xs"><i class="icon-trash ">删除</i></button>
																<%} 
																%>
																
																<%if(mode.getJFScore().equals("未审核")){ %>
																<a	href="mode.do?method=query1&id=<%=mode.getId().toString()%>"><button class="btn btn-info btn-xs"><i class="icon-pencil ">修改</i></button></a>
																<%} else{%>
																<button class="btn btn-default btn-xs"><i class="icon-trash ">修改</i></button>
																<%} %>
															
														</td>
														<%} %>
														 <%if(!keyanuser.getUserclasify().equals("0")){ %>
														 <% if(keyanuser.getUserclasify().equals("1")){ %>
														<td align="center">
															
															<%if(mode.getJFScore().equals("未审核")){ %>
																<a
																	href="mode.do?method=detele2&&id=<%=mode.getId().toString()%>" onclick="return yesno()"><button class="btn btn-danger btn-xs"><i class="icon-trash ">删除</i></button></a>
																	<%} else{%>
																<button class="btn btn-default btn-xs"><i class="icon-trash ">删除</i></button>
																<%} %>
																
																<%
															if (keyanuser.getUserclasify().equals("1")&&mode.getJFScore().equals("未审核")) {
														%>
														<a
															href="mode.do?method=update1&id=<%=mode.getId().toString()%>"
															onclick="return yesno1()"><button class="btn btn-success btn-xs"><i class="icon-ok ">审批</i></button></a>
														<%
															} else {
														%>
														
															<button class="btn btn-default btn-xs"><i class="icon-ok ">审批</i></button>
														<%
															}
														%>
															
														</td>
														<%} %>
														<% if(keyanuser.getUserclasify().equals("2")){ %>
														<td align="center">
															
															<%if(mode.getJFScore().equals("院审通过")){ %>
																<a
																	href="mode.do?method=detele3&id=<%=mode.getId().toString()%>" onclick="return yesno()"><button class="btn btn-danger btn-xs"><i class="icon-trash ">删除</i></button></a>
																	<%} else{%>
																<button class="btn btn-default btn-xs"><i class="icon-trash ">删除</i></button>
																<%} %>	
																<%
															if (keyanuser.getUserclasify().equals("2")&&mode.getJFScore().equals("院审通过")) {
														%>
														<a
															href="mode.do?method=update2&id=<%=mode.getId().toString()%>"
															onclick="return yesno1()"><button class="btn btn-success btn-xs"><i class="icon-ok ">审批</i></button></a>
														<%
															} else {%>
														
															<button class="btn btn-default btn-xs"><i class="icon-ok ">审批</i></button>
														<%}%>
														</td>
														<%} %>
														
														<%} %>
													</tr>
                                       </tr>
													<%
														}

														}
													%>
                                 
                            
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
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="js/owl.carousel.js" ></script>
    <script src="js/jquery.customSelect.min.js" ></script>
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>

    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="js/sparkline-chart.js"></script>
    <script src="js/easy-pie-chart.js"></script>
    <script src="js/dynamic-table.js"></script>

  <script>

      //owl carousel

      $(document).ready(function() {
          $("#owl-demo").owlCarousel({
              navigation : true,
              slideSpeed : 300,
              paginationSpeed : 400,
              singleItem : true

          });
      });

      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>
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
  </body>
</html>

