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
   <jsp:useBean id="pagination" class="com.keyan.tool.MyPagination"
		scope="session"></jsp:useBean>
  <%
              
             List list1=new ArrayList();
               List list2=new ArrayList();
             String str = (String) request.getParameter("Page");
		     Gg tbManager=new Gg();
		     int Page = 1;
  
                if (str == null) {
            list2=(List)getServletContext().getAttribute("list2");
				  list1=(List)getServletContext().getAttribute("list");
				 session.setAttribute("xlsList",list1);
			
				int pagesize = 150000; //指定每页显示的记录数
				if(list1!=null)
				{
				list1 = pagination.getInitPage(list1, Page,pagesize); //初始化分页信息
				}
			} else {
				Page = pagination.getPage(str);
				list1 = pagination.getAppointPage(Page); //获取指定页的数据
			}
   %>
    <base href="<%=basePath%>">

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
function yesno2() { 
if(confirm("你确定要立项吗?")){
 return true;
}else return false;
} 
</script>
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
<script type="text/javascript">
function showSearch(){
document.all.searchDiv.style.visibility=document.all.searchDiv.style.visibility=='hidden'?"visible":"hidden";
}
</script>
<script>
function open1(){

window.open("chyuan.html","_blank","fullscreen=0,toolbar=0,location=0,menubar=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1,width=280,height=180,top=200");

}
</script>
  </head>
	
  <% Project1 project1=new Project1(); %>
  
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
                          <li class="active"><a class="" href="project1.do?method=query112">项目中检</a></li>
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
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                          <strong>中检信息列表</strong>                         
                          <button type="button" class="btn btn-primary" onclick="window.location.href='Shengxls4.do?method=project'">导出Excel</button>                                        
                          </header>
                          <table class="table table-striped table-bordered" id="sample_1">
                          <thead>
								  <tr>                         		  
                                  <th><div align="center">项目名称</div></th>
                                  <th><div align="center">项目批次</div></th>
                                  <th><div align="center">项目成员</div></th>
                                  <th><div align="center">负责人</div></th>
				  <th><div align="center">负责人学工号</div></th>
                                  <th><div align="center">审核状态</div></th>
                                  <th style="width:10%"><div align="center">基本操作</div></th>
                                  <%if(keyanuser.getUserclasify().equals("1")||keyanuser.getUserclasify().equals("2")) {%>
                                  <th style="width:12%"><div align="center">审核</div></th>
                                  <%}else{ %>
                                  <th style="width:12%"><div align="center">申请</div></th>
                                  <%}  %>
                              </tr>
                           </thead>
                          <tbody>
                          
              <%
      if(list1!=null)
      {
      
      for(int i=0;i<list1.size();i++)
      {
      
       project1=(Project1)list1.get(i);
       //pppeople=(Pppeople)list.get(i);
        String id1=project1.getPid().toString();
      %>
                          
                          	<tr class="odd gradeX">                         		 
                                  <td align="center"><%=project1.getPname()  %></td>
                                  <td align="center"><%=project1.getPnum() %></td>
                                  <td align="center"><a href="Pppeopleform.do?method=query&&id=<%=project1.getPid().toString()%>">
                                      <%=list2.get(i) %></a></td>
                                  <td align="center"><%=project1.getPcontrol() %></td>
				  <td align="center"><%=project1.getUsernum() %></td>
                                  <td align="center">
                                  <% if(project1.getPstate3().equals("中检1")){
          out.print("系审通过");
       }else if(project1.getPstate3().equals("中检2")){
        out.print("校审通过");} 
        else if(project1.getPstate3().equals("立项2")){
        out.print("未审批");
        %>
      <%} %>
                                  </td>
                                  
                                  <td align="center">
                                  
                                 			<%
															if(project1.getPadjuct()!=null)
															{
															 %>
															<a href="xiazai.do?method=project1&&id=<%=project1.getPid().toString()%>"><button class="btn btn-success btn-xs"><i class="icon-download-alt">下载</i></button></a>
			                                           <%}else{
			                                           %><button class="btn btn-deefault btn-xs"><i class="icon-download-alt">下载</i></button><%
			                                           } %>
			                                         
			                                            <!--文件上传开始-->
			                                            <a href="javascript:void(-1)" onclick="uploadfile(<%=id1 %>)"><button class="btn btn-info btn-xs"><i class="icon-upload-alt">上传</i></button></a>
			                                            <script type="text/javascript">
			                                            
			                                            function uploadfile(i){
			                                            document.getElementById("upload"+i).style.display="";
			                                            
			                                            }
			                                             function uploadfile1(i){
			                                            document.getElementById("upload"+i).style.display='none';
			                                            
			                                            }
			                                            </script>
			                                            
			                                            <div id="upload<%=id1 %>" style="display:none;z-index: 200;position: absolute;width: 200px;left: 200px;background-color: blue " >
			                                            <html:form action="project1.do?method=upload1" enctype="multipart/form-data">
			                                            <html:hidden property="pid" value="<%=id1 %>"/>
			                                            <html:file property="padjuct" ></html:file>
			                                           <html:submit value="上传"></html:submit> <input type="button" id="btn" value="隐藏" onclick="uploadfile1(<%=id1 %>)"/>
			                                            </html:form>
			                                            </div>
                                  </td>
                                  
                                  
                                  <td align="center"><%if(keyanuser.getUserclasify().equals("0")&& project1.getPstate3().equals("中检2")) { %>
															   
														<a href="project1.do?method=insert1121&&id=<%=project1.getPid().toString()%>"
															onclick="return yesno1()"><button class="btn btn-success btn-xs"><i class="icon-off">结项申请</i></button></a>
														<a href="project1.do?method=insert1122&&id=<%=project1.getPid().toString()%>"
															onclick="return yesno2()"><button class="btn btn-info btn-xs"><i class="icon-time">延期申请</i></button></a>	
															<%} else if(keyanuser.getUserclasify().equals("0") && !project1.getPstate3().equals("中检2")){%>
															<button class="btn btn-default btn-xs"><i class="icon-external-link">结项申请</i></button>
															<a href="project1.do?method=insert1122&&id=<%=project1.getPid().toString()%>"
															onclick="return yesno2()"><button class="btn btn-info btn-xs"><i class="icon-time">延期申请</i></button></a>
															
															<%} if(keyanuser.getUserclasify().equals("1")){ 
															if(project1.getPstate3().equals("中检2")){%>
														 <button class="btn btn-default btn-xs"><i class="icon-ok">通过</i></button>
														 <button class="btn btn-default btn-xs"><i class="icon-remove">不通过</i></button>
														 <%}
															else if(project1.getPstate3().equals("中检1")){
															%>
															<a href="project1.do?method=insert1121&&id=<%=project1.getPid().toString()%>"
															onclick="return yesno1()"><button class="btn btn-success btn-xs"><i class="icon-ok">通过</i></button></a>
															<button class="btn btn-default btn-xs"><i class="icon-remove">不通过</i></button>
															<%} 
															else if(project1.getPstate3().equals("立项2")){%>
														<a href="project1.do?method=insert1121&&id=<%=project1.getPid().toString()%>"
															onclick="return yesno1()"><button class="btn btn-success btn-xs"><i class="icon-ok">通过</i></button></a>	
														<a href="project1.do?method=insert1122&&id=<%=project1.getPid().toString()%>"
														onclick="return yesno2()"><button class="btn btn-danger btn-xs"><i class="icon-remove">不通过</i></button></a>	
														
															<%} }
															if(keyanuser.getUserclasify().equals("2")) {%>
															<a href="project1.do?method=insert1121&&id=<%=project1.getPid().toString()%>"
															onclick="return yesno1()"><button class="btn btn-success btn-xs"><i class="icon-ok">通过</i></button></a>
															<% if(project1.getPstate3().equals("中检2")) {%>
															<button class="btn btn-default btn-xs"><i class="icon-remove">不通过</i></button>
															<% 
															} else {%>
														<a href="project1.do?method=insert1122&&id=<%=project1.getPid().toString()%>"
														onclick="return yesno2()"><button class="btn btn-danger btn-xs"><i class="icon-remove">不通过</i></button></a>	
															<%} }%>
                                  </td>
                                   <%} }%> 
                             </tr>
                         
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
