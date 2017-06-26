<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>铜陵学院科研管理系统注册</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/normalize.css" rel="stylesheet">
    <link href="css/public.css" rel="stylesheet">
    <link href="css/validator.css" rel="stylesheet">
    <link href="css/completer.css" rel="stylesheet">
    <link href="jedate/skin/jedate.css" rel="stylesheet">
    <link href="css/date.css" type="text/css" rel="stylesheet">
    <link href="css/magic-check.css" rel="stylesheet" >
    <link href="css/jquery-ui.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/public.js"></script>
    <script type="text/javascript" src="jedate/jedate.js"></script>
    <script type="text/javascript" src="js/date.js"></script>
    <script type="text/javascript" src="js/jquery-validate.js"></script>
    <script type="text/javascript" src="js/validator.js"></script>
    <script type="text/javascript" src="http://www.jq22.com/jquery/jquery-ui-1.10.2.js"></script>
    <script type="text/javascript" src="js/index.js"></script>

    <!--[if lt IE 9]>
    <script src="http://cdn.static.runoob.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        body{
            background: url("Image/bcg.jpg") no-repeat scroll center top  ;
        }

    </style>
</head>
<body>
<header>
</header>
<div class="container">
    <br><br><br><br><br><br><br><br><br><br><br>
    <div class="form-box row">
        <form action="register.do?method=insert" method="post" class="form-horizontal" role="form" id="register-form">
            <div class="form-group">
                <label for="username" class="col-sm-2  control-label" style="padding-left: 0px;padding-right: 0px">学&nbsp;&nbsp;工&nbsp;&nbsp;号 :</label>
                <div class="col-sm-10" style="padding-left: 0px;padding-right: 0px">
                    <input type="text" class="form-control vinput" id="username" name="username" placeholder="请输入学工号" >
                    <span></span>
                </div>
            </div>
			
			<div class="form-group">
                <label for="username" class="col-sm-2  control-label" style="padding-left: 0px;padding-right: 0px">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名 :</label>
                <div class="col-sm-10" style="padding-left: 0px;padding-right: 0px">
                    <input type="text" class="form-control vinput" id="name" name="name" placeholder="请输入姓名" >
                    <span></span>
                </div>
            </div>
            		
			<div class="form-group">
                <label for="username" class="col-sm-2  control-label" style="padding-left: 0px;padding-right: 0px">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</label>
                <div class="col-sm-10" style="padding-left: 0px;padding-right: 0px">
                    <input type="text" class="form-control vinput" id="addr" name="addr" placeholder="请输入地址" >
                    <span></span>
                </div>
            </div>

            <div class="form-group">
                <label for="username" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称 :</label>
                <select class="col-sm-10 m-bot15 input-sm" name="postnum">
                    <option value="1">教授</option>
                    <option value="2">副教授</option>
                    <option value="3">讲师</option>
                    <option value="4">助教</option>
                </select>
            </div>

            <div class="form-group">
                <label for="username" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px">所在院系 :</label>
                <select class="col-sm-10 m-bot15 input-sm" name="userdept">
                    <option value="数学与计算机学院">数学与计算机学院</option>
                    <option value="会计学院">会计学院</option>
                    <option value="工商管理学院">工商管理学院</option>
                    <option value="财税与公共管理学院">财税与公共管理学院</option>
                    <option value="金融学院">金融学院</option>
                    <option value="经济学院">经济学院</option>
                    <option value="文学与艺术传媒学院">文学与艺术传媒学院</option>
                    <option value="机械工程学院">机械工程学院</option>
                    <option value="外国语学院">外国语学院</option>
                    <option value="建筑工程学院">建筑工程学院</option>
                    <option value="电气工程学院">电气工程学院</option>
                    <option value="法学院">法学院</option>
                    <option value="校领导">校领导</option>
                </select>
            </div>

            <div class="form-group">
                <label for="phone" class="col-sm-2  control-label" style="padding-left: 0px;padding-right: 0px">手 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 机 :</label>
                <div class="col-sm-10 " style="padding-left: 0px;padding-right: 0px">
                    <input type="text" class="form-control vinput" id="phone" name="tel" placeholder="请输入手机号">
                    <span></span>
                </div>
            </div>
            <div class="form-group ">
                <label for="email" class="col-sm-2  control-label" style="padding-left: 0px;padding-right: 0px">邮 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 箱 :</label>
                <div class="col-sm-10"  style="padding-left: 0px;padding-right: 0px">
                    <input type="text" class="form-control vinput" id="email" name="email" placeholder="请输入邮箱"/>
                    <span></span>
                </div>
            </div>

            <div class="form-group ">
                <label for="password" class="col-sm-2  control-label" style="padding-left: 0px;padding-right: 0px">密 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 码 :</label>
                <div class="col-sm-10 " style="padding-left: 0px;padding-right: 0px">
                    <input type="password" class="form-control vinput" id="password" name="password" placeholder="请输入密码"/>
                    <i class="glyphicon glyphicon-eye-close form-control-feedback" id="toogle-password"></i>
                    <span></span>
                </div>
            </div>
            <div class="form-group">
                <label for="notpass" class="col-sm-2  control-label" style="padding-left: 0px;padding-right: 0px">确认密码 :</label>
                <div class="col-sm-10 " style="padding-left: 0px;padding-right: 0px">
                    <input type="text" class="form-control vinput" id="notpass" name="notpass" placeholder="请再次输入密码"/>
                    <i class="glyphicon glyphicon-eye-close form-control-feedback" id="toggle-notpass"></i>
                    <span></span>
                </div>
            </div>
            <br>
<input type="hidden" name="level" value="科研人员">
            <input type="hidden" name="userclasify" value="0">
            <input type="hidden" name="checked" value="0">

            <div class="form-group">
                <div class="col-sm-12" style="padding-left: 0px;padding-right: 0px">
                    <input type="submit" class="btn btn-primary form-control" id="submit" value="注册"/>
                </div>
            </div>

            <div class="form-group pull-right">
                已有账号前去&nbsp;<a href="login.jsp">登录</a>
            </div>
        </form>
    </div>
</div>

<footer>
</footer>
</body>
</html>