<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ page import="com.keyan.hibernate.dao.*" %>
<%@ page import="com.keyan.hibernate.form.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>铜陵学院科研管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"
          media="screen"/>
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet"/>
    <script type="text/javascript">
        function yesno() {
            if (confirm("你真的要退出吗?")) {
                return true;
            } else return false;
        }
    </script>
</head>
<%
    String name = null;
    String level = null;
    List list1 = new ArrayList();
    List list2 = new ArrayList();
    list1 = (List) session.getAttribute("list1");
    list2 = (List) session.getAttribute("unitlist");
    Keyanuser keyanuser = (Keyanuser) session.getAttribute("keyanuser");
    name = keyanuser.getName();
    level = keyanuser.getLevel();
%>

<body>
<%
    String name1 = (String) session.getAttribute("username");
    InfoDAO infoDAO = new InfoDAO();
    int i = infoDAO.queryto1(name1);
%>
<section id="container" class="">
    <!--header start-->
    <%@include file="top.jsp" %>
    <!--header end-->
    <!--sidebar start-->
    <aside>
        <%if (!keyanuser.getUserclasify().equals("3")) { %>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu">
                <li class="active">
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
        </div>
        <%} %>

    </aside>
    <!--sidebar end-->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!--state overview start-->
            <div class="row state-overview">
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol terques">
                            <i class="icon-user"></i>
                        </div>
                        <div class="value">
                            <h1><%=list1.get(0) %>
                            </h1>
                            <h4>论文总数</h4>
                        </div>
                    </section>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol red">
                            <i class="icon-tags"></i>
                        </div>
                        <div class="value">
                            <h1><%=list1.get(1) %>
                            </h1>
                            <h4>论著总数</h4>
                        </div>
                    </section>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol yellow">
                            <i class="icon-shopping-cart"></i>
                        </div>
                        <div class="value">
                            <h1><%=list1.get(2) %>
                            </h1>
                            <h4>项目总数</h4>
                        </div>
                    </section>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol blue">
                            <i class="icon-bar-chart"></i>
                        </div>
                        <div class="value">
                            <h1><%=list1.get(3) %>
                            </h1>
                            <h4>专利总数</h4>
                        </div>
                    </section>
                </div>
            </div>
            <!--state overview end-->

            <div class="tab-pane" id="chartjs">
                <div class="row">
                    <div class="col-lg-12">
                        <section class="bar-chart panel">
                            <header class="panel-heading">
                                各院系详细信息展示
                            </header>
                            <div class="panel-body text-center">
                                <canvas id="bar" height="500" width="1700%"></canvas>
                            </div>
                            <ction>
                    </div>
                </div>
            </div>


        </section>
    </section>
    <!--main content end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="js/jquery.sparkline.js" type="text/javascript"></script>
<script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/jquery.customSelect.min.js"></script>
<script src="assets/chart-master/Chart.js"></script>

<!--common script for all pages-->
<script src="js/common-scripts.js"></script>

<!--script for this page-->
<script src="js/sparkline-chart.js"></script>
<script src="js/easy-pie-chart.js"></script>

<script>

    //owl carousel

    $(document).ready(function () {
        $("#owl-demo").owlCarousel({
            navigation: true,
            slideSpeed: 300,
            paginationSpeed: 400,
            singleItem: true

        });
    });

    //custom select box

    $(function () {
        $('select.styled').customSelect();
    });

    var Script = function () {
        var barChartData = {
            labels: [
                "数学与计算机学院",
                "会计学院",
                "工商管理学院",
                "财税与公共管理学院",
                "金融学院",
                "经济学院",
                "文学与艺术传媒学院",
                "机械工程学院",
                "外国语学院",
                "建筑工程学院",
                "电气工程学院",
                "法学院"
            ],

            datasets: [

                {
                    label: "论文数",
                    fillColor: "rgba(108,202,201,1)",
                    data: [<%=list2.get(0)%>, <%=list2.get(4)%>, <%=list2.get(8)%>, <%=list2.get(12)%>, <%=list2.get(16)%>, <%=list2.get(20)%>, <%=list2.get(24)%>, <%=list2.get(28)%>, <%=list2.get(32)%>, <%=list2.get(36)%>, <%=list2.get(40)%>, <%=list2.get(44)%>]
                },

                {
                    label: "论著数",
                    fillColor: "rgba(255,108,96,1)",
                    data: [<%=list2.get(1)%>, <%=list2.get(5)%>, <%=list2.get(9)%>, <%=list2.get(13)%>, <%=list2.get(17)%>, <%=list2.get(21)%>, <%=list2.get(25)%>, <%=list2.get(29)%>, <%=list2.get(33)%>, <%=list2.get(37)%>, <%=list2.get(41)%>, <%=list2.get(45)%>]
                },

                {
                    label: "项目数",
                    fillColor: "rgba(248,211,71,1)",
                    data: [<%=list2.get(2)%>, <%=list2.get(6)%>, <%=list2.get(10)%>, <%=list2.get(14)%>, <%=list2.get(18)%>, <%=list2.get(22)%>, <%=list2.get(26)%>, <%=list2.get(30)%>, <%=list2.get(34)%>, <%=list2.get(38)%>, <%=list2.get(42)%>, <%=list2.get(46)%>]
                },
                {
                    label: "专利数",
                    fillColor: "rgba(87,200,242,1)",
                    data: [<%=list2.get(3)%>, <%=list2.get(7)%>, <%=list2.get(11)%>, <%=list2.get(15)%>, <%=list2.get(19)%>, <%=list2.get(23)%>, <%=list2.get(27)%>, <%=list2.get(31)%>, <%=list2.get(35)%>, <%=list2.get(39)%>, <%=list2.get(43)%>, <%=list2.get(47)%>]
                },
            ]
        };

        new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
    }();

</script>

</body>
</html>

