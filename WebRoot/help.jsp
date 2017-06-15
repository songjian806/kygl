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
                <li class="sub-menu active">
                    <a href="javascript:;" class="">
                        <i class="icon-question-sign"></i>
                        <span>系统帮助</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="active" href="help.jsp">用户手册</a></li>
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

                <li class="sub-menu active">
                    <a href="javascript:;" class="">
                        <i class="icon-envelope"></i>
                        <span>系统帮助</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="active" href="help.jsp">用户手册</a></li>
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
                        <li><a href="#">系统帮助</a></li>
                        <li class="active">用户手册</li>

                    </ul>
                    <!--breadcrumbs end -->
                </div>
            </div>
            <!-- page start-->
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;&nbsp;&nbsp; 一、科研管理</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 、组织教师学习（集中或自学）教育教学的理论，充分认识知识经济时代下的教育思想，促使教师教育观念的转变、知识的更新，提高教师自身素质。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 、组织各种形式的培训班、研讨会，加强对教育模式的探索与实践，学生学法的调查与指导，推进素质教育，培养创新能力。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 、进一步加强科研工作，组织教改实验与教研课题研究，做到目的明确、计划周密、措施具体，有检查、交流、总结或论文。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4 、负责教育教学论文的征集、评选、交流和编印，每年出版一套优秀论文集。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 、加强对新课程改革的研究，重点放在有关信息交流、课程安排，命题阅卷等方面上。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 、建立并健全教师的业务考核管理制度，及时向学校提供对教师的年度考核、学科学术带头人的评选、职称评定等有关数据与意见 , 供学校领导参考。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7 、负责与省内外教研部门，各中学等对口学校建立信息交流，促进本校教研活动的开展。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8 、合理安排教师的外出进修，业务培训等工作及经费的审核工作。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9. 组织管理 各学科组规划和学科组建设 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10 、 负责校内青年教师岗前培训和业务指导等项工作。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11 、组织重大课题的选项、立项和结项工作。承担省市县级教育科研课题、确定并完成校级教科研课题，并进行过程管理。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12 、组织协调各教研组开发校本课程。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13 、完成学校交给的各项临时性任务。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; 附：教研组长岗位职责 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 、组织本组教师学习素质教育的理论和经验，认真贯彻“加强基础，培养能力，发展智力”的教学指导原则，树立正确的教育，教学思想。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 、讨论并贯彻教学大纲对各年级段的知识和能力要求，使教师了解本学科的总体目标和分期任务。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 、针对本学科教学的特点，积极开展教学改革，有计划地组织本组教师开展听课、说课、评课活动，及时总结交流。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4 、组织本组教师经常分析学生的学习情况，研究和改建教学方法，考试后做好质量分析工作，提出改进意见和弥补学生知识能力缺陷的措施。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 、根据教学实际和教学教研热点、重点，确定教研组和个人的教研课题，积极开展教研活动，促进课堂教学。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 、开学初制订好本组教研活动计划，学期结束时做好工作总结，计划与总结上交教科处。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7 、积极组织各备课组开展培优补差、第二课堂活动，集中优势加强力度抓好学科竞赛。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8 、加强与上级有关对口部门的联系，与兄弟学校建立交流网络，及时了解本学科各年级段的教学情况，取长补短，改进工作。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9 、配合学校做好教师进修安排及职称评定工作。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10 、认真组织好集体教研活动，并作出书面记录。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; 三、课题立项 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 、根据学校教育教学工作的实际和未来发展的需要，及时申报省、市、县级教科研课题，同期开展的市级以上课题不少于 5 项。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 、每学期（年）初，各学科组要根据学科教学活动，确定本学科的学期（年）教科研课题，并详细填写《铜陵学院教科研课题立项登记表》。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 、县级及以上课题的研究工作由教科处负责组织实施，每学期末要形成阶段性研究成果，并向校长办公会进行汇报。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4 、各学科组开展的校级课题，在教科处指导下，由各课题主持人具体负责组织实施。每学期进行一次中期汇报，学期末以适当形式进行验收。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 、课题完成情况作为优秀学科组、先进教师评选的重要参考依据。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 、教科处负责教科研课题档案资料的收集、整理工作保密和存档工作。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; 附：《桐柏一高中教育科研课题管理办法》 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; 一、 管理体制 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 、 学校教育科学研究领导小组负责教育科研课题的领导、协调工作。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 、 学校教务教科处负责学校教育科研课题的阶段性检查和结题管理工作。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 、 各教育科研课题组负责本课题的研究工作。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; 二、 课题选择及申报 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 、 内容：课题选择突出必要性、实践性、科学性、可行性原则。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 、 选题方式：学校课题主要采取课题命定和自选课题、推荐课题的方式决定。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 、 人员要求：课题申报人应具有高、中级专业技术职务（职称），课题申报人应是课题负责人，下设数名主研人员和参研人员。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4 、 时间：每学年开学第一学月为校级科研课题的申报时间，校级以上的科研课题按上级文件、通知精神办理。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 、 课题申报人在申报课题时，需提交课题方案、《铜陵学院教育科研课题（项目、问题）申请书》。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; 三、 课题审批 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 由学校教务教科处对申报的科研课题进行初审后，交学校教育科学研究小组审批。校级以上课题由学校教育科学研究小组初审后上报上级相关部门审批。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; 四、 课题的过程管理 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 、 课题组按研究方案进行研究，并根据实际及时调整研究方案。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 、 课题组应建立课题的学习、研讨档案，并作好详细记载，档案要完整、归类。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 、 各课题组每月至少进行一次集体研究，总结前期研究内容，提出研究过程中存在的问题，布置下一个月研究的主要内容和方法。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4 、 课题组每学年召开一次课题研讨会，向教务教科处提交书面总结，并展示有关详细的研究材料。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 、 认真做好资料的收集、整理工作，随时迎接上级有关部门进行的课题阶段性成果检查。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; 五、 课题的结题鉴定 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 、 结题条件： </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 1 ） 按计划完成课题研究，原定研究目标已实现 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 2 ） 课题研究主体报告已完成 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 3 ） 反映课题研究过程和研究成果的资料已整理齐全 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 4 ） 课题年度考核合格 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2 、 结题流程：课题组向学校教务教科处提出书面结题申请，并附以下材料：</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 1 ）课题研究方案。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 2 ）课题研究主体报告。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 3 ）课题研究工作报告。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 4 ）反映课题研究过程的主要资料。由学校教务教科处组织校级课题的评审鉴定，对课题提出客观公正、全面的意见并写评审鉴定意见。校级以上的课题，由学校教务教科处初审后报送上级相关部门评审。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp; 六、 教育科研课题的检查和考核 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 、 考核对象：正在进行研究尚未通过结题鉴定的校级和学校承担的各级课题 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2 、 检查和考核办法： </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 1 ） 每学期最后一个月由教务教科处组织检查，检查按自我检查、资料检查、现场考核相结合的方式进行。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 2 ） 在检查和考核过程中，课题组应提交以下材料： </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A 、 本学期课题研究计划 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B 、 每月进行的集体研究情况记载 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C 、 本学期研究工作总结（含课题研究进展及研究大事记） </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D 、 本学期有关研究成果（调查报告、阶段报告、论文、经验总结、教育个案、发表交流获奖等）目录及相关证明的原件、重大活动情况简报或综述、其它资料，并将其复印件交教务教科处存档。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3 、 评奖及奖金发放办法奖励和处罚 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 1 ） 学校根据课题结题时的评审结果给予课题组一定的精神和物质上的奖励（见附件《关于课题研究的评奖及奖金发放办法》）。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 2 ） 在每学期末的检查中，凡有不合格的课题，将取消主研人员的资格，课题项目根据情况决定是否保留，若决定保留课题将改选主研人员。 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 3 ） 在课题研究过程中，凡有无故不参与课题研究会议、不参与课题研究、不提供研究成果等不利于课题研究者，在学年度评审时，由课题组负责人提交书面报告交教务教科处审批，并及时作好人员的增补工作。 <BR></P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; 七、 教育科研课题档案管理 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 、 教务教科处为每个课题分别建档，其中的内容主要由课题组提供，由教务教科处组织人员进行整理、归类。</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 、 各科研课题档案中应包含的主要内容 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 1 ） 课题申请书；课题方案；课题申请批复；课题开题报告；每学期检查和考核时提交的材料 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A 、 本学期课题研究计划</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%">&nbsp;<BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B 、 每月进行的集体研究情况记载 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C 、 本学期研究工作总结（含课题研究进展及研究大事记） </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D 、 本学期有关研究成果（调查报告、阶段报告、论文、经验总结、教育个案、发表、交流、获奖等）目录及相关证明、重大活动情况简报或综述、其它资料的复印件 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 2 ） 各种课题会议记录 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 3 ） 每学期学校检查时的评审意见 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 4 ） 研究人员的变动情况记载 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 5 ） 结题申请书、结题的主题报告及专题报告 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 6 ） 结题时学校或上级相关部门出具的评审结果书 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 、科研课题档案的保管期限，类别、序号、归档文件材料名称、保管期限、依据性材料 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 1 ）与课题相关的著作、专著、文稿、学报等理论资料 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 2 ）与课题相关的政策、规定、文件等政策性资料、并注明具体出处 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 3 ）与课题相关的调查报告、实验材料、具体数据、群众反映等实践性材料 短期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4、计划性材料
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 1 ）研究方案、立项申请、审批手续、课题议定书、任命书、合同书、协议书等 永久 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 2 ）阶段研究计划、开题报告、可行性论证有关资料 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5、基础性材料
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 1 ）研究者名单及基本情况（学历、年龄、职称、教学水平与科研能力等） 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 2 ）被研究者（实验对象）基本情况有资料 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 3 ）反映研究条件的有关资料（设备条件、经费、人员投入、领导和群众支持程度） 短期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6、过程性材料
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 1 ）课题研究大事记、反映课题活动的媒体报道 永久</P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 2 ）研究中进行的调查、检测全过程的资料 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 3 ）各种会议记录（研讨会、报告会），专题培训讲座题目、提纲 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 4 ）研究课（研究活动）的方案、实录、效果分析等资料 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 5 ）个案、观察记录、典型事件记录 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 6 ）家长意见、社会反映等反馈性资料 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 7 ）心得体会、随笔等 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 8 ）研制的调查工具和检测工具 永久 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7、实效性材料
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 1 ）科研成果评价、专著、论文发表、获奖证书、奖品、奖牌等 永久 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 2 ）说明研究个体、群体变化的资料 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8、总结性材料
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ 1 ）研究报告、工作报告、实验报告 永久 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 2 ）结题申请、验收、鉴定评审会议记录、验收或鉴定结论 永久 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 3 ）阶段总结、阶段成果报告 永久 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （ 4 ）个人经验总结、论文、专著 长期 </P>
            <P style="FONT-SIZE: 10.5pt; MARGIN: 0px; LINE-HEIGHT: 200%"><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 音像资料 反映研究工作的各种照片、声像材料 长期 </P></SPAN></td> <br>



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































