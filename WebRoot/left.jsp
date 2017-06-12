<%@ page language="java" pageEncoding="utf-8" %>
<%@ page import="com.keyan.hibernate.dao.*" %>
<%@ page import="com.keyan.hibernate.form.*" %>

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