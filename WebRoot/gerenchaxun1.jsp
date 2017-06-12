<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.keyan.hibernate.form.*" import="com.keyan.hibernate.dao.*"%>
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

    <title>个人考核业绩查询</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
		
	</head>
	<%
			Keyanuser keyanUser = (Keyanuser) session.getAttribute("keyanuser");
		//Keyanuser searchuser = (Keyanuser) session.getAttribute("searchuser");
		List<Float> listscore = (List) session.getAttribute("listscore");
		List<Float> listscore1 = (List) session.getAttribute("listscore1");
		List<Float> listscore2 = (List) session.getAttribute("listscore2");
		//List zhuanliList = (List) session.getAttribute("zhuanliList");
		String nian = (String)session.getAttribute("nian");
		nian = nian==null?"":nian+"年度";
		session.removeAttribute("listscore");
		session.removeAttribute("listscore1");
		session.removeAttribute("listscore2");
		//session.removeAttribute("zhuanliList");
		session.removeAttribute("nian");
		float score=(float)listscore.get(0);
		float score1=(float)listscore1.get(0);
		float score2=(float)listscore2.get(0);
		Date d =new Date();
	int	date=d.getYear()+1900;
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
                    <li class="sub-menu active">
                        <a href="javascript:;" class="">
                            <i class="icon-tasks"></i>
                            <span>业绩考核</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub">

                            <li ><a class="" href="geSearch.do?method=query">个人业绩查询</a></li>

                            <li class="active"><a class="" href="geSearch.do?method=queryThree">近三年业绩查询</a></li>

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
      <section id="main-content">
          <section class="wrapper">
      
		<section class="panel">
			              
						  <header class="panel-heading tab-bg-dark-navy-blue">
                               <div align="center"><span class="wht-color"><h4><%=date %>个人考核业绩查询</h4></span></div>
						  </header>
				
						  
                          <div class="panel-body">
                              <ul class="summary-list">
                                  <li>
                                      <a>
                                        <i class=" icon-user text-primary">姓名</i>
                                          <strong><%=keyanUser.getName()%></strong>
                                      </a>
                                  </li>
                                  
                                  <li>
                                      <a>
                                          <i class=" icon-picture text-muted">单位</i>
                                          <strong><%=keyanUser.getUserdept()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class="icon-tags text-success">职称</i>
                                          <strong><%=keyanUser.getPost()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class="icon-microphone text-danger">成绩</i>
                                          <strong><%=listscore.get(0) %></strong>
                                      </a>
                                  </li>
								  <li>
                                      <a>
                                          <i class="icon-microphone text-danger">任务分值</i>
                                         <td height="20" bgcolor="d3eaef" class="STYLE6">
					<div align="center">
						<span class="STYLE10" id="needscore">
						<%
						PostDAO postDAO=new PostDAO();
						
					    Post post=postDAO.findByPostnum(keyanUser.getPostnum());
						 if(post!=null)
						 {
						 out.print(post.getTask());
						 }
						%>											
						</span>
					</div>
				</td>
                                      </a>
                                  </li>
								  <li>
                                      <a>
                                          <i class="icon-envelope text-info">完成情况</i>
                                          <td height="20" bgcolor="d3eaef" class="STYLE6">
					<div align="center">
						<span class="STYLE10" id="totalscore" style="color: red"><%
                        float cha=0;
                        cha=score-post.getTask();
                        out.print(cha);
                       %>
                       </span>
					</div>
				</td>	
                                      </a>
                                  </li>
								  
                              </ul>
                          </div>
                      </section>
		
		<section class="panel">
			              
						  <header class="panel-heading tab-bg-dark-navy-blue">
                               <div align="center"><span class="wht-color"><h4><%=date-1 %>个人考核业绩查询</h4></span></div>
						  </header>
				
						  
                          <div class="panel-body">
                              <ul class="summary-list">
                                  <li>
                                      <a>
                                        <i class=" icon-user text-primary">姓名</i>
                                          <strong><%=keyanUser.getName()%></strong>
                                      </a>
                                  </li>
                                  
                                  <li>
                                      <a>
                                          <i class=" icon-picture text-muted">单位</i>
                                          <strong><%=keyanUser.getUserdept()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class="icon-tags text-success">职称</i>
                                          <strong><%=keyanUser.getPost()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class="icon-microphone text-danger">成绩</i>
                                          <strong><%=listscore1.get(0) %></strong>
                                      </a>
                                  </li>
								  <li>
                                      <a>
                                          <i class="icon-microphone text-danger">任务分值</i>
                                         <td height="20" bgcolor="d3eaef" class="STYLE6">
					<div align="center">
						<span class="STYLE10" id="needscore">
						<%
						
						
					
						 if(post!=null)
						 {
						 out.print(post.getTask());
						 }
						%>											
						</span>
					</div>
				</td>
                                      </a>
                                  </li>
								  <li>
                                      <a>
                                          <i class="icon-envelope text-info">完成情况</i>
                                          <td height="20" bgcolor="d3eaef" class="STYLE6">
					<div align="center">
						<span class="STYLE10" id="totalscore" style="color: red"><%
                        float cha1=0;
                        cha1=score1-post.getTask();
                        out.print(cha1);
                       %>
                       </span>
					</div>
				</td>	
                                      </a>
                                  </li>
								  
                              </ul>
                          </div>
                      </section>
		
		
		<section class="panel">
			              
						  <header class="panel-heading tab-bg-dark-navy-blue">
                               <div align="center"><span class="wht-color"><h4><%=date-2 %>个人考核业绩查询</h4></span></div>
						  </header>
				
						  
                          <div class="panel-body">
                              <ul class="summary-list">
                                  <li>
                                      <a>
                                        <i class=" icon-user text-primary">姓名</i>
                                          <strong><%=keyanUser.getName()%></strong>
                                      </a>
                                  </li>
                                  
                                  <li>
                                      <a>
                                          <i class=" icon-picture text-muted">单位</i>
                                          <strong><%=keyanUser.getUserdept()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class="icon-tags text-success">职称</i>
                                          <strong><%=keyanUser.getPost()%></strong>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <i class="icon-microphone text-danger">成绩</i>
                                          <strong><%=listscore2.get(0) %></strong>
                                      </a>
                                  </li>
								  <li>
                                      <a>
                                          <i class="icon-microphone text-danger">任务分值</i>
                                         <td height="20" bgcolor="d3eaef" class="STYLE6">
					<div align="center">
						<span class="STYLE10" id="needscore">
						<%
						
					  
						 if(post!=null)
						 {
						 out.print(post.getTask());
						 }
						%>											
						</span>
					</div>
				</td>
                                      </a>
                                  </li>
								  <li>
                                      <a>
                                          <i class="icon-envelope text-info">完成情况</i>
                                          <td height="20" bgcolor="d3eaef" class="STYLE6">
					<div align="center">
						<span class="STYLE10" id="totalscore" style="color: red"><%
                        float cha2=0;
                        cha2=score2-post.getTask();
                        out.print(cha2);
                       %>
                       </span>
					</div>
				</td>	
                                      </a>
                                  </li>
								  
                              </ul>
                          </div>
                      </section>
		
		
		
		

           
</table>
<script type="text/javascript">
function show(zgnum){
document.all.zgnum.value = zgnum;
document.all.searchForm.submit();
}
</script>
</section>
</section>
</section>
<!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

	</body>
</html>