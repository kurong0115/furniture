/**
 * 登录
 * @returns
 */
function login(){
	if( $("#LoginUsername").val()=='' ){
		getInfoMsg("请输入用户名！");
		return;
	}
	if( $("#LoginPassword").val()=='' ){
		getInfoMsg("请输入密码！");
		return;
	}
	if( $("#LoginCode").val()=='' ){
		getInfoMsg("请输入验证码！");
		return;
	}
	$.ajax({
		url:"login.do",
		type:'POST',
		data:{
			username:$("#LoginUsername").val(),
			password:$("#LoginPassword").val(),
			code:$("#LoginCode").val()
		},
		dataType:"json",
		success:function(data){
			if( data.message == '登录成功!' ){
				getSuccessMsg(data.message);
				window.history.go(-1);
			}else{
				getInfoMsg(data.message);
			}
		},error:function(){
			getFailMsg('出现异常了，刷新试试！');
		}	
  	});
}
	/**
	 * 注册
	 * @returns
	 */
	function reg(){
		if( $("#RegUsername").val() == ''){
			getInfoMsg("请输入用户名！");
			return;
		}
		if( $("#RegPassword").val() == '' || $("#RegPassword1").val() == ''){
			getInfoMsg("请输入密码！");
			return;
		}
		
		if( $("#RegCode").val() == ''){
			getInfoMsg("请输入验证码！");
			return;
		}
		if( $("#RegPassword").val() != $("#RegPassword1").val() ){
			getInfoMsg("两次密码输入不一致");
			return;
		}
		if( $("#email").val() == '' ){
			getInfoMsg("请输入邮箱！");
			return;
		}
		if( $("#regCode").val() == '' ){
			getInfoMsg("请输入验证码！");
			return;
		}
    	$.ajax({
   			url:"reg.do",
   			type:'POST',
   			data:{
   				username:$("#RegUsername").val(),
   				password:$("#RegPassword").val(),
   				email:$("#email").val(),
   				code:$("#regCode").val()
   			},
   			dataType:"json",
   			success:function(data){
   				if( data.message == '注册成功!' ){
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
	
	
	var time=60;
	//验证码过期倒数时间
	function getTime(bnt) {
		
		if(time==0){
			bnt.removeAttribute("disabled"); 
			bnt.value="免费获取验证码"; 
			time = 60;
		}else{
			bnt.setAttribute("disabled", true); 
			bnt.value="重新发送(" + time + ")";
			time--;
			setTimeout(function() { 
				getTime(bnt) 
			},1000); 
		}
		
	}
	
	
		
	
	function updateCode() {
		var img=document.getElementById("code");
		// 相同的url请求，浏览器会在缓存里加载数据并不会往服务器重新发送，所以后面加一个随机数
		img.src="createCode?"+Math.random();
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

