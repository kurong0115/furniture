<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>未回复消息管理</title>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<style type="text/css">
	#ff *{
		margin-top:5px
	}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/manageNoreply.js"></script>
</head>
<body>
	<!-- 数据表格 -->
	<table class="easyui-datagrid" id="dg" data-options="
		fitColumns: true,
		singleSelect: true,
		fit: true,
		pagination: true,
		pageSize: 5,
		pageList: [5,10,20],
		url: 'messages.do?flag=0',
		rownumbers: true,
		toolbar:'#tb'">
	    <thead>
			<tr>
				<th data-options="field:'name',width:50">用户名</th>
				<th data-options="field:'title',width:80">主题</th>
				<th data-options="field:'content',width:150,formatter:fmtContent">内容</th>
				<th data-options="field:'createtime',width:80,formatter:fmtTime">留言时间</th>
				<th data-options="field:'id',align:'center',width:50,formatter:fmtReply">操作</th>
			</tr>
	    </thead>
	</table>
	
	<!-- 页头搜索框、添加和查询按钮，在数据表格中添加toolbar属性 -->
	<div id="tb" style="padding:5px;height:auto;">
		<div>
			用户名: <input class="easyui-textbox" style="width:80px" id="name">
			主题: <input class="easyui-textbox" style="width:80px" id="title">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="query()">查询</a>
		</div>
	</div>
	
	<!-- 回复用户留言的表单 -->
	<div id="dlg" class="easyui-dialog" title="回复" style="width:900px;height:450px;padding: 10px;"
		data-options="
			iconCls: 'icon-edit',
			buttons: [{
				text:'回复',
				iconCls:'icon-save',
				handler:function(){
					save();
				}
			},{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){
					$('#dlg').dialog('close');
				}
			}],
			closed: true,
			modal: true
		">
		<form id="ff" method="post" style="text-align:center;">
			<!-- 保存id操作该条数据 -->
			<input type="hidden" name="mid" id="mid">
			<textarea rows="5" cols="20" name="reply" id="reply"></textarea>
			<script>
				CKEDITOR.replace('reply', {
					height : 360,
					width : 850
				});
			</script>
		</form>
	</div>
</body>
</html>