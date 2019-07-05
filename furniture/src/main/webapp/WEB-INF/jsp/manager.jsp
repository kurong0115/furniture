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
	text: '系统管理',
	iconCls: 'icon-sum',
	state: 'open',
	children: [{
	    text: '用户管理',
	    iconCls: 'icon-search',
	    url:"manage-user.do"
	},{
	    text: '货品管理',
	    iconCls: 'icon-search',
	    url:"???"
	}]
},{
	text: '用户留言',
	iconCls: 'icon-sum',
	state: 'close',
	children: [{
	    text: '未回复',
	    iconCls: 'icon-search',
	    url:"manage-noReply.do"
	},{
	    text: '已回复',
	    iconCls: 'icon-search',
	    url:"???"
	}]
}];
</script>
</head>

<body class="easyui-layout" style="">
    <div data-options="region:'north'" style="height:50px;"></div>
    <div data-options="region:'south',split:true" style="height:50px;"></div>
    <div class="easyui-sidemenu" data-options="region:'west',split:true,data:dt,
    	onSelect:onMenuSelect" title="菜单栏" style="width:200px;"></div>
    <div class="easyui-tabs" data-options="region:'center'" id="tt">
    	<div title="首页"></div>
    </div>
</body>
</html>