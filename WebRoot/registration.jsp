<%@ page language="java" pageEncoding="utf-8" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>科研信息管理系统</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

</head>

  <body class="login-body">

    <div class="container">

      <form class="form-signin" action="index.jsp">
        <h2 class="form-signin-heading">用户注册</h2>
        <div class="login-wrap">
            <p>输入你的个人信息</p>
            <input type="text" class="form-control" placeholder="姓名" autofocus>
            <input type="text" class="form-control" placeholder="地址" autofocus>
            <input type="text" class="form-control" placeholder="邮箱" autofocus>
            <input type="text" class="form-control" placeholder="地址" autofocus>
            <div class="radios">
                <label class="label_radio col-lg-6 col-sm-6" for="radio-01">
                    <input name="sample-radio" id="radio-01" value="1" type="radio" checked /> 男
                </label>
                <label class="label_radio col-lg-6 col-sm-6" for="radio-02">
                    <input name="sample-radio" id="radio-02" value="1" type="radio" /> 女
                </label>
            </div>

            <p> 输入详细资料</p>
            <input type="text" class="form-control" placeholder="用户名" autofocus>
            <input type="password" class="form-control" placeholder="密码">
            <input type="password" class="form-control" placeholder="再次输入密码">           
            <button class="btn btn-lg btn-login btn-block" type="submit">提交</button>

            <div class="registration">
                已注册
                <a class="" href="login.jsp">
                    登录
                </a>
            </div>

        </div>

      </form>

    </div>


  </body>
</html>
