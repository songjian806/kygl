<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page  import="com.keyan.hibernate.form.*"%>
<%@ page import="com.keyan.hibernate.dao.*" %>
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
			String status = (String) getServletContext().getAttribute("status");
			if (status != null) {
				if (status.equals("updatesuccess")) {
					out.println("<script type=\"text/javascript\">alert('修改成功');</script>");
				} else if (status.equals("addsuccess")) {
					out.println("<script type=\"text/javascript\">alert('发送成功');</script>");
				} else {
					out.println("<script type=\"text/javascript\">alert('修改失败');</script>");
				}
				getServletContext().removeAttribute("status");
			}

			
	%>
		
 <%
              
             List list=new ArrayList();
             String str = (String) request.getParameter("Page");
             String flag=(String)getServletContext().getAttribute("flag");
		     Info tbManager=new Info();
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
  String nameFlag=(String)session.getAttribute("username");
  InfoDAO infoDAO=new InfoDAO();
  int count=infoDAO.queryto1(nameFlag);
   %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
   
    <title>邮件管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 
    <link href="assets/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" >
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
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
  
   <!--header start-->
      <%@ include file="top.jsp"%>
      <!--header end-->
      
    <aside>
      <%if(!keyanuser.getUserclasify().equals("3")){ %>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">
                  <li>
                      <a class="" href="index.jsp">
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
                      
                          <%if(keyanuser.getUserclasify().equals("2")){ %>
                          <li><a class="" href="thesis.do?method=query">论文管理</a></li><%} %>
                          <%if(keyanuser.getUserclasify().equals("1")){ %>
                          <li><a class="" href="thesis.do?method=query32">论文管理</a></li><%} %>
                          <%if(keyanuser.getUserclasify().equals("0")){ %>
                          <li><a class="" href="thesis.do?method=query31">论文管理</a></li><%} %>
                          
                          <%if(keyanuser.getUserclasify().equals("2")){ %>
                          <li><a class="" href="work.do?method=query3">论著管理</a></li><%} %>
                          <%if(keyanuser.getUserclasify().equals("1")){ %>
                          <li><a class="" href="work.do?method=query32">论著管理</a></li><%} %>
                          <%if(keyanuser.getUserclasify().equals("0")){ %>
                          <li><a class="" href="work.do?method=query31">论著管理</a></li><%} %>
                          
                          <%if(keyanuser.getUserclasify().equals("2")){ %>
                          <li><a class="" href="projectcg.do?method=query4">项目管理</a></li><%} %>
                          <%if(keyanuser.getUserclasify().equals("1")){ %>
                          <li><a class="" href="projectcg.do?method=query32">项目管理</a></li><%} %>
                          <%if(keyanuser.getUserclasify().equals("0")){ %>
                          <li><a class="" href="projectcg.do?method=query31">项目管理</a></li><%} %>
                          
                          <%if(keyanuser.getUserclasify().equals("2")){ %>
                          <li><a class="" href="zhuanli.do?method=query5">专利管理</a></li><%} %>
                          <%if(keyanuser.getUserclasify().equals("1")){ %>
                          <li><a class="" href="zhuanli.do?method=query32">专利管理</a></li><%} %>
                          <%if(keyanuser.getUserclasify().equals("0")){ %>
                          <li><a class="" href="zhuanli.do?method=query31">专利管理</a></li><%} %>
                          

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
                          
                          <%if(keyanuser.getUserclasify().equals("1")){ %>
                          <li><a class="" href="geSearch.do?method=yuanxichaxun">院系业绩查询</a></li><%} %> 
                          <%if(keyanuser.getUserclasify().equals("2")){ %>
                          <li><a class="" href="geSearch.do?method=yuanxichaxun1">院系业绩查询</a></li><%} %> 
                          
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

                          
                          <%if(keyanuser.getUserclasify().equals("0")){ %>
                          <li  class="active"><a class="" href="info.do?method=query1">消息管理</a></li><%} %>

                          
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
         <%if(keyanuser.getUserclasify().equals("3")){ %>
           
           <div id="sidebar"  class="nav-collapse ">
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
                          <li><a class="" href="user.do?method=adduser">添加用户</a></li>

                          
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
          </div> <%} %>
           
      </aside>  
  
   <section id="container" class="">
  	<section id="main-content">
          <section class="wrapper">

              <div class="row">
                  <div class="col-lg-12">
                      <!--breadcrumbs start -->
                      <ul class="breadcrumb">
                          <li><a href="index.jsp"><i class="icon-home"></i>首页</a></li>
                          <li>综合管理</li>
                          <li> 消息管理</li>


                      </ul>
                      <!--breadcrumbs end -->
                  </div>
              </div>

              <!--mail inbox start-->
              <div class="mail-box">
                  <aside class="sm-side">
                      <div class="user-head">
                          <a href="javascript:;" class="inbox-avatar">
                              <img src="img/mail-avatar.jpg" alt="">
                          </a>
                          <div class="user-name">
                              <h5><a href="#"><%=level%>-<%=name%></a></h5>
                          </div>
                          <a href="javascript:;" class="mail-dropdown pull-right">
                              <i class="icon-chevron-down"></i>
                          </a>
                      </div>
                      <div class="inbox-body">
                          <a class="btn btn-compose" data-toggle="modal" href="#myModal">
                             编写新邮件
                          </a>
                          <!-- Modal -->
                          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                              <div class="modal-dialog">
                                  <div class="modal-content">
                                      <div class="modal-header">
                                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                          <h4 class="modal-title">新邮件</h4>
                                      </div>
                                      <div class="modal-body">
                                          <form class="form-horizontal" role="form" action="info.do?method=insert" method="post" enctype="multipart/form-data" onsubmit="return onsubmit1()">
                                              <div class="form-group">
                                                  <label  class="col-lg-3 control-label">发件人</label>
                                                  <div class="col-lg-8">
                                                      <input name="infoform" type="text" class="form-control"  value="<%=name %>" readonly="true">
                                                  </div>
                                              </div>
                                              <div class="form-group">
                                                  <label  class="col-lg-3 control-label">收件人（学工号）</label>
                                                  <div class="col-lg-8">
                                                      <input name="infoto" type="text" class="form-control" id="cc" >
                                                  </div>
                                              </div>
                                             
                                              <div class="form-group">
                                                  <label class="col-lg-3 control-label">邮件内容</label>
                                                  <div class="col-lg-8">
                                                      <textarea name="context" id="" class="form-control" cols="30" rows="10" ></textarea>
                                                  </div>
                                              </div>

                                              <div class="form-group">
                                                  <div class="col-lg-offset-2 col-lg-10">
                                                      <span class="btn green fileinput-button">
                                                        <i class="icon-plus icon-white"></i>
                                                        <span>添加文件</span>
                                                        <input type="file" multiple=""  name="file">
                                                      </span>
                                                      <button type="submit" class="btn btn-send">发送</button>
                                                  </div>
                                              </div>
                                          </form>
                                      </div>
                                  </div><!-- /.modal-content -->
                              </div><!-- /.modal-dialog -->
                          </div><!-- /.modal -->
                      </div>
                      <ul class="inbox-nav inbox-divider">
                          <li class="active">
                          <%if (count>0){%>
                           <a href="info.do?method=query1"><i class="icon-inbox"></i> 收件箱 <span class="label label-danger pull-right"><%=count %></span></a>
                          <% }else{ %>
                          <a href="info.do?method=query1"><i class="icon-inbox"></i>  收件箱</a>
                          
                          <%} %>
                             
                          </li>
                          <li>
                              <a href="info.do?method=query2"><i class="icon-envelope-alt"></i> 发件箱</a>
                          </li>
                          
                      </ul>
                     

                      <div class="inbox-body text-center">
                          <div class="btn-group">
                              <a href="javascript:;" class="btn mini btn-primary">
                                  <i class="icon-plus"></i>
                              </a>
                          </div>
                          <div class="btn-group">
                              <a href="javascript:;" class="btn mini btn-success">
                                  <i class="icon-phone"></i>
                              </a>
                          </div>
                          <div class="btn-group">
                              <a href="javascript:;" class="btn mini btn-info">
                                  <i class="icon-cog"></i>
                              </a>
                          </div>
                      </div>

                  </aside>
                  <aside class="lg-side">
                       <div class="inbox-head">
                          <h3>收件箱</h3>
                      </div>
                      <section class="panel">
                          
                          <table class="table table-striped table-bordered" id="sample_1">
                         <thead>
                          <tr>
                              <th class="hidden-phone" style="width:20%"><div align="center" >发件人</div></th>
                              <th class="hidden-phone" ><div align="center">内容</div></th>
                              <th class="hidden-phone" style="width: 15%"><div align="center">日期</div></th>
                              <th class="hidden-phone" style="width: 15%"><div align="center">基本操作</div></th>
                              
                          </tr>
                          </thead>
                         
                          <tbody>
        <%
      if(list!=null)
      {
      
      for(int i=0;i<list.size();i++)
      {
      
       tbManager=(Info)list.get(i);
      
      %>
        
                          <tr class="odd gradeX">
			                  <td align="center"><%=tbManager.getInfoform() %></td>
                              <td align="center"><%=tbManager.getContext() %></td>
                              <td align="center" class="hidden-phone"><%=tbManager.getInfotime().toString().split(" ")[0]%></td>
                                <%if(flag.equals("query1")){ %>
                                <td align="center">
                            <a href="info.do?method=detele1&&id=<%=tbManager.getId().toString() %>" onclick="return yesno()"><button class="btn btn-danger btn-xs"><i class="icon-trash "></i>删除</button></a>
                               </td>
                               <%}if(flag.equals("query2")) {%>
                               <td align="center">
                            <a href="info.do?method=detele2&&id=<%=tbManager.getId().toString() %>" onclick="return yesno()"><button class="btn btn-danger btn-xs"><i class="icon-trash "></i>删除</button></a>  
                               </td> <%} %>
                          </tr>
                          <%}} %>
                             
                         </tbody>
                              
                          </table>
                          
                       </section>
                  </aside>
              </div>
              <!--mail inbox end-->
          </section>
      </section>
      </section>
   
  <!-- BEGIN:File Upload Plugin JS files-->
  <script src="assets/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
  <!-- The Templates plugin is included to render the upload/download listings -->
  <script src="assets/jquery-file-upload/js/vendor/tmpl.min.js"></script>
  <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
  <script src="assets/jquery-file-upload/js/vendor/load-image.min.js"></script>
  <!-- The Canvas to Blob plugin is included for image resizing functionality -->
  <script src="assets/jquery-file-upload/js/vendor/canvas-to-blob.min.js"></script>
  <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
  <script src="assets/jquery-file-upload/js/jquery.iframe-transport.js"></script>
  <!-- The basic File Upload plugin -->
  <script src="assets/jquery-file-upload/js/jquery.fileupload.js"></script>
  <!-- The File Upload file processing plugin -->
  <script src="assets/jquery-file-upload/js/jquery.fileupload-fp.js"></script>
  <!-- The File Upload user interface plugin -->
  <script src="assets/jquery-file-upload/js/jquery.fileupload-ui.js"></script>

  <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>
 <!--script for this page only-->
    <script src="js/dynamic-table.js"></script>
    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>
  </body>
</html>
