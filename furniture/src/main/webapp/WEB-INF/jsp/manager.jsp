<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
//侧栏菜单点击事件
function onMenuSelect(item){
	if($("#tt").tabs('exists',item.text)){
		$("#tt").tabs('select',item.text)
	}else{
		$("#tt").tabs('add',{
			title:item.text,
			content:'<iframe id="a" src="'+item.url+'" style="width:100%;height:100%;border:0px"></iframe>',
			closable:true
		});
	}
}
//json格式的菜单对象
var dt = [{
	text: '用户管理',
	iconCls: 'icon-sum',
	state: 'open',
	children: [{
	    text: '用户管理',
	    iconCls: 'icon-reload',
	    url:"manage-user.do"
	}]
},{
	style:'background-color:#E0ECFF',
	text: '产品管理',
	iconCls: 'icon-sum',
	children: [{
	    text: '货品管理',
	    iconCls: 'icon-reload',
	    url:"manage-product.do"
	},{
	    text: '订单管理',
	    iconCls: 'icon-reload',
	    url:"manage-orders.do"
	},{
	    text: '分类管理',
	    iconCls: 'icon-reload',
	    url:"manage-category.do"
	}]
},{
	text: '留言管理',
	iconCls: 'icon-sum',
	children: [{
	    text: '未回复',
	    iconCls: 'icon-reload',
	    url:"manage-noReply.do"
	},{
	    text: '已回复',
	    iconCls: 'icon-reload',
	    url:"manage-reply.do"
	}]
}];

function adminOut() {
	$.messager.confirm("提示","确认退出吗？",function(flag){
		if(flag){
			$.get('adminOut',function(data){
				if(data.code==1){
					location.href="admin";
				}else{
					getFailMsg("操作失败，请稍后再试")
				}
			});
		}
	});
	
}
function getSuccessMsg(msg) {
	$.message({
        message:msg,
        type:'success',
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

<body class="easyui-layout" style="">
    <div data-options="region:'north'" style="height:80px;">
    	
    	<div style="display: inline-block;height:75px;width: 60%">
    		<img src="assets/img/manageLogo.png" alt="" style="margin-left: 10%;"> 		
    	</div>
    	
    	<div style="display: inline-block;float: right;margin-right: 10%;height:65px;margin-top: 10px;">
    		<font style="font-size: 25px">欢迎您：${admin.name}</font>&nbsp;&nbsp;&nbsp;
    		<a href="javascript:void(0)" onclick="adminOut()" style="font-size: 25px">注销</a>&nbsp;&nbsp;&nbsp;
    		<img alt="" src="${admin.head }" width="50px" height="50px" style="vertical-align: middle;border-radius: 50%;">
    		
    	</div>
    	
    </div>
    <div data-options="region:'north'" style="height:50px;"></div>
    <!-- <div data-options="region:'south',split:true" style="height:50px;"></div> -->
    <div class="easyui-sidemenu" data-options="region:'west',split:true,data:dt,
    	onSelect:onMenuSelect" title="菜单栏" style="width:200px;"></div>
    <div class="easyui-tabs" data-options="region:'center'" id="tt">
    	<div title="首页"></div>
    </div>
    <script src="/assets/js/message.js"></script>   
</body>
</html>