<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>铜陵学院科研管理系统登陆</title>

    <%
        String s1 = (String) getServletContext().getAttribute("info1");
    %>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet"/>

    <style>
        body{
            background: url("Image/beijing.jpg") no-repeat scroll center top  ;
        }

    </style>

</head>

<body  class="login-body">

<div class="container">
    <br><br><br><br><br><br><br>
    <form class="form-signin" action="login.do" method="post">
        <table>


            <div class="login-wrap">
                <div class="form-group">

                    <input type="text" class="form-control" name="username" placeholder="用户名" autofocus>
                </div>
                <div class="form-group">
                    <input type="password" id="pwd" class="form-control" name="password" placeholder="密码">
                </div>
                <div class="form-group">
                    <input style="width: 48%" type="text" id="code_input" class="form-control pull-left" name="yanzheng" placeholder="验证码">
                    <div class="pull-right" id="v_container" style="width:140px;height:38px;margin-bottom: 8px"></div>
                </div>
                <div class="form-group">
                    <select class="form-control input-sm m-bot15" name="clasify">
                        <option value="0">科研人员</option>
                        <option value="1">系科研秘书</option>
                        <option value="2">校科研秘书</option>
                        <option value="3">系统管理员</option>
                    </select>
                </div>
                <div class="form-group">
                    <button class="btn btn-lg btn-success btn-block" id="btn_submit" type="submit">登陆</button>
                </div>
				<div class="registration">
                	还没有账户?
                <a class="" href="registration.jsp">
                                                  创建一个账户
                </a>
            </div>
            </div>
        </table>

        <%

            if (s1 != null) {
                getServletContext().removeAttribute("info1");
                out.print("<font color='red'>" + s1 + "</font>");
            }
        %>

    </form>

</div>


</body>

<script src="js/jquery.js"></script>
<script src="js/gVerify.js"></script>
<script>
    var verifyCode = new GVerify("v_container");
    $(document).ready(function () {
        $("#btn_submit").click(function(){
            if(document.getElementById("code_input").value==""){
                $("#pwd").val("");
                alert("未输入验证码");
            }else{
                var res = verifyCode.validate(document.getElementById("code_input").value);
                if (res) {

                } else {
                    $("#pwd").val("");
                    alert("验证码错误");
                }}
        });


    });


</script>

</html>
