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
   	<!-- 引入QQ登录js文件 -->
    <script type="text/javascript"  charset="utf-8"
        src="http://connect.qq.com/qc_jssdk.js"
        data-appid="101701345"
        data-redirecturi="http://127.0.0.1:8080/QQLogin"
    ></script>
	
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
                        <a href="index">首页</a>
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
                                                    <a href="forgetPassword">忘记密码/账号?</a>
                                                </div>
                                                <button type="button" onclick="login()">登录</button>      					
                                            </div>
                                        </form>
                                        <br><br><br>
                                     <span id="qqLoginBtn"></span>
										<script type="text/javascript">
										   //调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
										   QC.Login({
										       //btnId：插入按钮的节点id，必选
										       btnId:"qqLoginBtn",
										       //用户需要确认的scope授权项，可选，默认all
										       scope:"all",
										       //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
										       size: "B_M"
										   }, function(reqData, opts){//登录成功
										       //根据返回数据，更换按钮显示状态方法
										       var dom = document.getElementById(opts['btnId']),
										       _logoutTemplate=[
										            //头像
										            '<span><img src="{figureurl}" class="{size_key}"/></span>',
										            //昵称
										            '<span>{nickname}</span>',
										            //退出
										            '<span><a href="javascript:QC.Login.signOut();">退出</a></span>'
										       ].join("");
										       dom && (dom.innerHTML = QC.String.format(_logoutTemplate, {
										           nickname : QC.String.escHTML(reqData.nickname), //做xss过滤
										           figureurl : reqData.figureurl
										       }));
										       //window.location.href("QQLoginCallBack");
										   }, function(opts){//注销成功
										         
										   }
										);
										QC.Login.getMe(function(openId, accessToken){
											$.post("QQLoginCallBack",{
												   openId:openId
											   },function(data){
												   if( data.code == 1 ){
													   QC.Login.signOut();
													   window.location.href='index';
												   }
												   else{
													   getFailMsg(data.message);
												   } 
											   });
											   
									       });
										
										</script>
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
<!-- 引入login-register.js文件 -->
    <script src="<%=request.getContextPath() %>/assets/js/login-register.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/forgetPassword.js"></script>
    
    
<script type="text/javascript">
$('#LoginCode,#LoginUsername,#LoginPassword').keyup(function(event){  
    if(event.keyCode ==13){  
    	login();
    }  
  });
</script>
</body>
</html>
