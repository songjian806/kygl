<%@ page import="com.keyan.hibernate.form.Keyanuser" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge"/>
<jsp:useBean id="ajax" class="com.keyan.ajax.servlet.AjaxBean"></jsp:useBean>

<%
    JSONRPCBridge.registerObject("ajax", ajax);
%>
<%
    String name = null;
    String level = null;
    Keyanuser keyanuser = (Keyanuser) session.getAttribute("keyanuser");
    name = keyanuser.getName();
    level = keyanuser.getLevel();
%>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>添加经费申请</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script>
        var CalendarWebControl = new atCalendarControl();
    </script>
</head>

<script type="text/javascript" src="js/jsonrpc.js"></script>
<script type="text/javascript">
    jsonrpc = new JSONRpcClient("JSON-RPC");


    function yzTitle() {
        var id = modeForm.xmname.value;

        var result = jsonrpc.ajax.yanzhengmode(id);

        if (result == false) {
            alert("项目已经已申请经费！");
            modeForm.xmname.value = "";
            modeForm.xmname.focus();
        }
    }
    function chongzhi() {
        modeForm.xmname.value = "";
        modeForm.renyuan.value = "";

        modeForm.xmjingfei.value = "";
        modeForm.beizhu.value = "";
        modeForm.fenlei.value = "";
    }
</script>
<script type="text/javascript">
    function onsubmit1() {

        if (modeForm.xmname.value == '') {
            alert("项目名称不能为空");
            return false;
        }

        else if (modeForm.xmjingfei.value == '') {
            alert("经费不能为空");
            return false;
        }
        else if (modeForm.bokuanzt.value == '') {
            alert("拨款不能为空");
            return false;
        }
        else if (modeForm.renyuan.value == '') {
            alert("其他完成人员不能为空");
            return false;
        }
        else if (modeForm.fenlei.value == '') {
            alert("分类不能为空");
            return false;
        }
        return true;

    }


</script>


<body>

<section id="container" class="">
    <!--header start-->
    <%@ include file="top.jsp" %>
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
                        <li><a class="" href="user.do?method=query00&&id=<%=keyanuser.getId().toString() %>">个人信息查看</a>
                        </li>


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

                        <li><a class="" href="user.do?method=query00&&id=<%=keyanuser.getId().toString() %>">个人信息查看</a>
                        </li>


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
                    <section class="panel">
                        <header class="panel-heading"><strong> 添加经费申请</strong></header>
                        <div class="panel-body">
                            <div class=" form">

                                <form class="cmxform form-horizontal tasi-form" action="mode.do?method=insert"
                                      method="post" enctype="multipart/form-data" onsubmit="return onsubmit1()">

                                    <div class="form-group ">
                                        <label for="inputEmail1" class="col-lg-2 control-label">负责人</label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" value="<%=name %>" name="jf_name"
                                                   readonly="true">
                                        </div>

                                        <label class="col-lg-2 control-label col-lg-offset-1">负责人学工号</label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control"
                                                   value="<%=keyanuser.getUsername() %>" name="musernum">
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-lg-2 control-label">项目名称</label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" name="xmname">
                                        </div>

                                        <label for="inputEmail1"
                                               class="col-lg-2 control-label col-lg-offset-1">经费</label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" name="xmjingfei">
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label class="control-label col-lg-2">学院</label>
                                        <div class="col-lg-3">
                                            <select class="form-control m-bot10" name="pici">
                                                <option value="数计学院">数计学院</option>
                                                <option value="校领导">校领导</option>
                                                <option value="会计学院">会计学院</option>

                                            </select>
                                        </div>

                                        <label for="inputEmail1" class="col-lg-2 control-label col-lg-offset-1">备注
                                        </label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" name="beizhu">
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="inputEmail1" class="col-lg-2 control-label">分类
                                        </label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" name="fenlei">
                                        </div>

                                        <label for="inputEmail1" class="col-lg-2 control-label col-lg-offset-1">审核状态
                                        </label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" value="未审核" readonly="true">
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label class="control-label col-lg-2" for="inputSuccess">是否拨款</label>
                                        <div class="col-lg-3">
                                            <select class="form-control m-bot10" name="bokuanzt">
                                                <option value="是">是</option>
                                                <option value="否">否</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="form-group ">
                                        <div class="col-lg-offset-5 col-lg-7">
                                            <button type="submit" class="btn btn-success">添加</button>
                                            <button type="reset" class="btn btn-default">重置</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
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
<script type="text/javascript" src="js/jquery.validate.min.js"></script>


<!--common script for all pages-->
<script src="js/common-scripts.js"></script>

<!--script for this page-->
<script src="js/form-validation-script.js"></script>
</body>
</html>
