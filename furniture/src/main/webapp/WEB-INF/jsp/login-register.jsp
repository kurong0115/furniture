<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>登录 / 注册</title>
    
    <!-- 引入首部链接 -->
    <%@include file="common/header_link.jsp" %>
   	<!-- 引入login-register.js文件 -->
	<script src="assets/js/login-register.js"></script>
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
                    <li class="active">登录 / 注册 </li>
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
                                <h4> 登录 </h4>
                            </a>
                            <a data-toggle="tab" href="#lg2">
                                <h4> 注册 </h4>
                            </a>
                        </div>
                        <div class="tab-content">
                            <div id="lg1" class="tab-pane active">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                        <form action="" method="post">
                                        	<input type="text" id="LoginUsername" placeholder="用户名">
                                            <input type="password" id="LoginPassword" placeholder="密码">
                                            <input type="text" id="LoginCode" placeholder="验 证 码"  style="width: 60%"/>
                                            <img id="code" src="createCode" onclick="updateCode()" style="vertical-align: middle;">
                                            <a href="javascript:updateCode()">换一张</a>		
                                            <div class="button-box">
                                                <div class="login-toggle-btn">
                                                    <a href="forgetPassword">忘记密码?</a>
                                                </div>
                                                <button type="button" onclick="login()">登录</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>  
                            <div id="lg2" class="tab-pane">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                        <form action="" method="post">
                                            <input type="text" id="RegUsername" placeholder="用户名">
                                            <input type="password" id="RegPassword" placeholder="密码">
                                            <input type="password" id="RegPassword1" placeholder="重复密码">                          
                                            <div>
                                            	<input id="email" placeholder="邮箱" type="email" style="width: 60%">
                                           		<input type="button" value="获取验证码" onclick="sendCode()" id="getCodeByEmail" style="width: 38%">
                                            </div>
                                            <input type="text" id="regCode" placeholder="验证码" >
                                            <div class="button-box">
                                                <button type="button" onclick="reg()">注册</button>
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
