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
        }else
            return false;
    }

    function onsubmit1()
    {

        if(Pppeopleform.ppname.value=='')
        {
            alert("成员姓名不能为空");
            return false;
        }
        else if(Pppeopleform.pptype.value=='')
        {
            alert("成员类型不能为空");
            return false;
        }
        else if(Pppeopleform.ppdept.value=='')
        {
            alert("成员所在单位不能为空");
            return false;
        }

        return true;

    }
</script>


<html lang="en">
<head>
    <meta charset="utf-8">
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
</head>

<body>
<section id="container" class="">
    <!--header start-->
    <%@ include file="top.jsp" %>
    <!--header end-->
    <!--sidebar start-->
    <aside>
        <%@ include file="left.jsp" %>
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
                           	 新增成员基本信息
                        </header>
                        <div class="panel-body">
                            <div class=" form">
                                <form class="cmxform form-horizontal tasi-form" method="post" action="Pppeopleform.do?method=insert" enctype="multipart/form-data" onsubmit="return onsubmit1()">
                                    <div class="form-group ">
                                        <label for="cname" class="control-label col-lg-2">对应项目ID</label>
                                        <div class="col-lg-3">
                                            <%String  pid=(String)getServletContext().getAttribute("pid1"); %>
                                            <input class=" form-control"   name="pid" value="<%=pid %>" minlength="2" type="text" required  readonly="true"/>
                                        </div>
                                        <label for="cemail" class="control-label col-lg-2 col-lg-offset-1">教工号</label>
                                        <div class="col-lg-3">
                                            <input class="form-control "  name="ppusernum" required />
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="cemail" class="control-label col-lg-2">成员姓名</label>
                                        <div class="col-lg-3">
                                            <input class="form-control "  name="ppname" required />
                                        </div>
                                        <label for="ccomment" class="control-label col-lg-2 col-lg-offset-1">成员类型</label>
                                        <div class="col-lg-3">
                                            <select class="form-control m-bot10" name="pptype">
                                                <option value="教授">教授</option>
                                                <option value="副教授">副教授</option>
                                                <option value="讲师">讲师</option>
                                                <option value="助教">助教</option>
                                                <option value="学生">学生</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="ccomment" class="control-label col-lg-2">所在单位</label>
                                        <div class="col-lg-3">
                                            <input class="form-control " name="ppdept" />
                                        </div>
                                        <label for="ccomment" class="control-label col-lg-2 col-lg-offset-1">贡献率</label>
                                        <div class="col-lg-3">
                                            <input class="form-control "  name="ppwork" />
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="ccomment" class="control-label col-lg-2">署名顺序</label>
                                        <div class="col-lg-3">
                                            <input class="form-control "  name="ppnum" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-5 col-lg-7">
                                            <button class="btn btn-danger" type="submit">添加</button>
                                            <button class="btn btn-default" type="reset">重置</button>
                                            <button class="btn btn-danger" type="button" onclick="window.location.href='Pppeopleform.do?method=query&id=<%=pid%>'">返回</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
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
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<!--common script for all pages-->
<script src="js/common-scripts.js"></script>
<!--script for this page-->
<script src="js/form-validation-script.js"></script>
</body>
</html>
