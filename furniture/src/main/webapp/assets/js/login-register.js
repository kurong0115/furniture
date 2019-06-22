function login(){
		if( $("#cheack").get(0).checked ){
			var cheack = "1";		
		}else{
			var cheack = "2";
		}
    	$.ajax({
   			url:"login.do",
   			type:'POST',
   			data:{
   				username:$("input[name='username']").val(),
   				password:$("input[name='password']").val(),
   				code:$("input[name='code']").val(),
   				cheack:cheack
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
	
	function reg(){
    	$.ajax({
   			url:"reg.do",
   			type:'POST',
   			data:{
   				username:$("#RegUsername").val(),
   				password:$("#RegPassword").val(),
   				email:$("#email").val()	,
   				code:$("#code").val()
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
	
	function resertPassword(){
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
	
	
	
	  
	function sendCode(){
		var to = $("#email").val();
    	$.ajax({
   			url:"email",
   			type:'POST',
   			data:{
   				username:$("#username").val(),
   				email:$("#email").val()
   			},
   			dataType:"json",
   			success:function(data){
   					getSuccessMsg(data.message);	
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
	
	function forgetCount(){
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

