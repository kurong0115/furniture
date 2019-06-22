/**
 * 忘记密码
 * @returns
 */
function resertPassword(){
	if( $("#username").val() == ''){
		getInfoMsg("请输入用户名！");
		return;
	}
	if( $("#password1").val() == '' || $("#password2").val() == ''){
		getInfoMsg("请输入密码！");
		return;
	}
	
	if( $("#RegCode").val() == ''){
		getInfoMsg("请输入验证码！");
		return;
	}
	if( $("#password1").val() != $("#password2").val() ){
		getInfoMsg("两次密码输入不一致");
		return;
	}
	if( $("#email").val() == '' ){
		getInfoMsg("请输入邮箱！");
		return;
	}
	if( $("#code").val() == '' ){
		getInfoMsg("请输入验证码！");
		return;
	}
	$.ajax({
		url:"forgetPassword.do",
		type:'POST',
		data:{
			username:$("#username").val(),
			password1:$("#password1").val(),
			password2:$("#password2").val(),
			email:$("#email").val(),
			code:$("#code").val()
		},
		dataType:"json",
		success:function(data){
			if( data.message == '修改成功!' ){
				getSuccessMsg(data.message);
				window.location.href='login-register';
			}else{
				getInfoMsg(data.message);
			}
		},error:function(){
			getFailMsg('出现异常了，刷新试试！');
		}	
  	});
}
	
/**
 * 找回账号
 * @returns
 */
function forgetCount(){
	if( $("#searchCountEmail").val() == '' ){
		getInfoMsg("请输入邮箱！");
		return;
	}
	$.ajax({
			url:"forgetCount.do",
			type:'POST',
			data:{
				email:$("#searchCountEmail").val()
			},
			dataType:"json",
			success:function(data){
				if( data.message == '账号已发送至您的邮箱,请查收!' ){
					getSuccessMsg(data.message);
					window.location.href='login-register';
				}else{
					getInfoMsg(data.message);
				}
			},error:function(){
				getFailMsg('出现异常了，刷新试试！');
			}	
	  	});
}


/**
 * 发送邮件
 * @returns
 */
function sendCode(){	
	if( $("#email").val() == '' ){
		getInfoMsg("请输入邮箱！");
		return;
	}
	$.ajax({
			url:"send",
			type:'POST',
			data:{
				username:$("#username").val(),
				email:$("#email").val()
			},
			dataType:"json",
			success:function(data){
				if( data.message == '发送成功！' ){
					getSuccessMsg(data.message);
				}else{
					getInfoMsg(data.message);
				}		
			},error:function(){
				getFailMsg('出现异常了，刷新试试！');
			}
	  	});
	getTime(this);
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
	        duration:'6000'
	    });
	}
	function getFailMsg(msg) {
		$.message({
	        message:msg,
	        type:'error',
	        duration:'6000'
	    });
	}