<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="/assets/css/loginbootstrap.min.css">
<style>
	body{color:#fff; font-family:"微软雅黑"; font-size:14px;}
	.wrap1{position:absolute; top:0; right:0; bottom:0; left:0; margin:auto }/*把整个屏幕真正撑开--而且能自己实现居中*/
	.main_content{background:url(assets/img/main_bg.png) repeat; margin-left:auto; margin-right:auto; text-align:left; float:none; border-radius:8px;}
	.form-group{position:relative;}
	.login_btn{display:block; background:#3872f6; color:#fff; font-size:15px; width:100%; line-height:50px; border-radius:3px; border:none; }
	.login_input{width:100%; border:1px solid #3872f6; border-radius:3px; line-height:40px; padding:2px 5px 2px 30px; background:none;}
	.icon_font{position:absolute; bottom:15px; left:10px; font-size:18px; color:#3872f6;}
	.font16{font-size:16px;}
	.mg-t20{margin-top:20px;}
	@media (min-width:200px){.pd-xs-20{padding:20px;}}
	@media (min-width:768px){.pd-sm-50{padding:50px;}}
	#grad {
	  background: -webkit-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Safari 5.1 - 6.0 */
	  background: -o-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Opera 11.1 - 12.0 */
	  background: -moz-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Firefox 3.6 - 15 */
	  background: linear-gradient(#4990c1, #52a3d2, #6186a3); /* 标准的语法 */
	}
	
	@font-face {
  font-family: 'icomoon';
  src:  url('assets/img/fonts/icomoon.eot?u4m6fy');
  src:  url('assets/img/fonts/icomoon.eot?u4m6fy#iefix') format('embedded-opentype'),
    url('assets/img/fonts/icomoon.ttf?u4m6fy') format('truetype'),
    url('assets/img/fonts/icomoon.woff?u4m6fy') format('woff'),
    url('assets/img/fonts/icomoon.svg?u4m6fy#icomoon') format('svg');
  font-weight: normal;
  font-style: normal;
}

[class^="icon-"], [class*=" icon-"] {
  /* use !important to prevent issues with browser extensions that change fonts */
  font-family: 'icomoon' !important;
  speak: none;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;

  /* Better Font Rendering =========== */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.icon-logg:before {
  content: "\e915";
}
.icon-manager:before {
  content: "\e916";
}
.icon-user:before {
  content: "\e917";
}
.icon-data:before {
  content: "\e918";
}
.icon-sysmanager:before {
  content: "\e919";
}
.icon-list:before {
  content: "\e91a";
}
.icon-passagewaymanager:before {
  content: "\e91b";
}
.icon-base:before {
  content: "\e91c";
}
.icon-agentlist:before {
  content: "\e91d";
}
.icon-configure:before {
  content: "\e91e";
}
.icon-flow:before {
  content: "\e91f";
}
.icon-orderlist:before {
  content: "\e920";
}
.icon-ydlist:before {
  content: "\e921";
}
.icon-agentpay:before {
  content: "\e922";
}
.icon-agentsum:before {
  content: "\e923";
}
.icon-passagewaysum:before {
  content: "\e924";
}
.icon-custom:before {
  content: "\e925";
}
.icon-address:before {
  content: "\e926";
}
.icon-lock:before {
  content: "\e927";
}	
</style>
<script type="text/javascript">
function adminLogin() {
	var name=$('#adminName').val();
	var password=$('#adminpwd').val();
	if(name==""){
		getInfoMsg("请输入用户名");
		return ;
	}
	if(password==""){
		getInfoMsg("请输入密码");
		return ;
	}
	
	$.post("adminLogin",{
		name:name,
		password:password
	},function(data){
		if(data.code==1){
			getSuccessMsg(data.message);
			location.href=data.data;
		}else if(data.code==0){
			getFailMsg(data.message);
		}else{
			getFailMsg("登陆失败");
		}
	})
}

function getSuccessMsg(msg) {
		$.message({
	        message:msg,
	        type:'success',
	        duration:'3000'
	    });
	}
	function getInfoMsg(msg) {
		$.message({
	        message:msg,
	        type:'info',
	        duration:'3000'
	    });
	}
	function getFailMsg(msg) {
		$.message({
	        message:msg,
	        type:'error',
	        duration:'3000'
	    });
	}
</script>

</head>


<body style="background:url(assets/img/bg.jpg) no-repeat;">
    
    <div class="container wrap1" style="height:450px;">
            <h2 class="mg-b20 text-center">OurHouse后台登录</h2>
            <div class="col-sm-8 col-md-5 center-auto pd-sm-50 pd-xs-20 main_content">
                <p class="text-center font16">管理员登录</p>
                <form>
                    <div class="form-group mg-t20">
                        <i class="icon-user icon_font"></i>
                        <input type="text" class="login_input" id="adminName" name="adminName" placeholder="请输入用户名" />
                    </div>
                    <div class="form-group mg-t20">
                        <i class="icon-lock icon_font"></i>
                        <input type="password" class="login_input" id="adminpwd" name="adminpwd" placeholder="请输入密码"  />
                    </div>
                    <input type="button" class="login_btn" value="登 录" onclick="adminLogin()">
               </form>
        </div><!--row end-->
    </div><!--container end-->
<script src="/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="/assets/js/message.js"></script>          
</body>
</html>