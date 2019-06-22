<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Parlo - eCommerce Bootstrap 4 Template</title>
    
    <!-- 引入首部链接 -->
    <%@include file="common/header_link.jsp" %>
   	<!-- 引入login-register.js文件 -->
	<script src="assets/js/forgetPassword.js"></script>

</head>

<body>
<div class="wrapper">
    
    <!-- 引入首部 -->
    <%@include file="common/header.jsp" %>

    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="index.html">首页</a>
                    </li>
                    <li class="active">忘记密码 /忘记账号</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="login-register-area pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                    <div class="login-register-wrapper">
                        <div class="login-register-tab-list nav">
                            <a class="active" data-toggle="tab" href="#lg1">
                                <h4> 忘记密码 </h4>
                            </a> 
                            <a data-toggle="tab" href="#lg2">
                                <h4> 忘记账号 </h4>
                            </a>
                        </div>
                        <div class="tab-content">
                            <div id="lg1" class="tab-pane active">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                        <form action="" method="post">  	
	                                        <input type="text" id="username" placeholder="用户名"> 	
                                            <input type="password" id="password1" placeholder="密码">
                                            <input type="password" id="password2" placeholder="重复密码">
                                            <input type="email" id="email" placeholder="邮箱" style="width: 60%">
                                            <button onclick="sendCode()">发送验证码</button>	
                                            <input type="text" id="code" placeholder="验 证 码"  style="width: 60%"/>	
                                            <div class="button-box">
                                                <button type="button" onclick="resertPassword()">确认修改</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="lg2" class="tab-pane">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                        <form action="" method="post">
                                            <input id="searchCountEmail" placeholder="邮箱" type="email">
                                            <div class="button-box">
                                                <button type="button" onclick="forgetCount()">忘记账号</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <!-- 引入底部 -->
    <%@include file="common/footer.jsp" %>
</div>
<!-- 引入底部链接 -->
<%@include file="common/footer_link.jsp" %>
</body>
</html>
