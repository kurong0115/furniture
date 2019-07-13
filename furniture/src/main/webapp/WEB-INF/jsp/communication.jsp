<%@page import="com.house.furniture.vo.Result"%>
<%@page import="com.house.furniture.util.MyUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>消息中心</title>

<!-- 引入首部链接 -->
<%@include file="common/header_link.jsp" %>
<link rel="stylesheet" type="text/css" href="assets/css/communication.css"/>

</head>
<body>
<div class="wrapper">
<div class="qqBox" style="width: 100%;"> 

	<!-- 引入首部 -->
    <%@include file="common/header.jsp" %>

	<div class="BoxHead" style="background: #ece4d9; no-repeat;">
		<div class="headImg">
			<img src="${user.head }"/>
		</div>
		<div class="internetName">${user.name }</div>
	</div>
	<div class="context">
		<div class="conLeft">
			<ul>
				
				<li class="bg">
					<div class="liLeft"><img src="assets/img/communication/admin.jpg"/></div>
					<div class="liRight">
						<span class="intername">管理员</span>
						<span class="infor"></span>
					</div>
				</li>
			</ul>
		</div>
		<div class="conRight">
			<div class="Righthead">
				<div class="headName">管理员</div>
			</div>
			<!-- 展示消息内容 -->
			<div class="RightCont">
				<ul class="newsList">
				
				</ul>
			</div>
		</div>
	</div>
</div>
</div>
<!-- <script src="js/jquery-2.1.4.min.js"></script> -->
<%@include file="common/footer_link.jsp" %>
<script type="text/javascript">
	$(function(){
		// 点击左侧用户，更换css，背景颜色，显示该用户名
		/* $('.conLeft li').on('click',function(){
			$(this).addClass('bg').siblings().removeClass('bg');
			var intername=$(this).children('.liRight').children('.intername').text();
			$('.headName').text(intername);
			$('.newsList').html('');
		}) */
		
		// 根据用户id显示聊天内容
		$.post("getSendAndReply.do",{
			uid: 1
		},function(data){
			if(data.code > 0){
				for(var i = 0; i < data.code; i++){
					info(data.data[i].content,data.data[i].reply);
					if((i+1) == data.code){
						var reply = subTag(data.data[i].reply);
						reply = reply.length>6 ? reply.substring(0,6)+"..." : reply;
						$(".infor").html(reply);
					}
				}
			}
		});
		
	});
	//设置对话内容
	function info(send,reply){
		var answer='';
		answer+='<li>'+
					'<div class="answerHead"><img src="${user.head}"/></div>'+
					'<div class="answers"><img class="jiao" src="assets/img/communication/jiao.jpg">'+send+'</div>'+
				'</li>';
		$('.newsList').append(answer);
		
		var str='';
		str+='<li>'+
				'<div class="nesHead"><img src="assets/img/communication/admin.jpg"/></div>'+
				'<div class="news"><img class="jiao" src="assets/img/communication/20170926103645_03_02.jpg">'+reply+'</div>'+
			'</li>';
		$('.newsList').append(str);
	}
	
	// 去除html标签
	function subTag(str) {
		return str.replace(/<[^>]+>/g,"");
	}
</script>
</body>
</html>