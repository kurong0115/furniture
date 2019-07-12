<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>已回复消息管理</title>
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
<script type="text/javascript">
	// 条件查询
	function query(){
		$('#dg').datagrid('load',{
			name: $("#name").val(),
			title: $("#title").val()
		});
	}
	
	// 保存回复信息
	function save(){
		$('#ff').form('submit',{
			url: "replyMessage.do",
			onSubmit: function(){
				//扩展参数
			},
			success: function(data){	//data是json字符串而不是json对象
				data = JSON.parse(data);
				if(data.code == 0){
					// 提示错误信息
					for(var i = 0; i < data.data.length; i++){
						$.messager.alert("提醒", data.data[i].defaultMessage);
					}
				}else {
					if(data.code == 1){
						$('#dg').datagrid('reload');
						$('#dlg').dialog('close');
					}
					//消息框弹窗
					$.messager.alert("提醒", data.message);
				}
			}
		});
	}
	
	// 查看内容（提示框显示）
	function fmtContent(value, row, index){
		value = value.replace(/<[^>]+>/g,"");	//消除html标签
		content = value.length > 10 ? value.substring(0, 10) : value;
		return '<a href="#" onMouseOver="showText(this)" onMouseOut="hideText(this)"'
			+'style="text-decoration:none;">'+content+'</a>'
			+'<textarea hidden style="background-color: #f8f9fa;position: absolute;'
			+'border-radius: 10px;overflow-x:hidden;overflow-y: auto;width:300px;height:200px;">'+value+'</textarea>.'
	}
	function showText(input){
		$(input).next().removeAttr("hidden");
		//$(input).next().html($(input).text());
	}
	function hideText(input){
		$(input).next().attr("hidden","true");
	}
	
	// 日期格式化
	function fmtTime(value,rowData,rowIndex){
		if(value != null){
			var date = new Date(value);
			var year = date.getYear()+1900;
			var month = date.getMonth()+1;
			var day = date.getDate();
			var hour = date.getHours();
			var minute = date.getMinutes()+1;
			return year+"-"+month+"-"+day+"  "+hour+":"+minute;
		}
	}
	
	// 打开表单编辑
	function modify(index){
		var row = $('#dg').datagrid('getRows')[index];
		
		$('#ff').form('load', row);
		$('#dlg').dialog('open');
	}
</script>
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
		url: 'messages.do?flag=1',
		rownumbers: true,
		toolbar:'#tb'">
	    <thead>
			<tr>
				<th data-options="field:'name',width:50">用户名</th>
				<th data-options="field:'title',width:80">主题</th>
				<th data-options="field:'content',width:150,formatter:fmtContent">内容</th>
				<th data-options="field:'createtime',width:80,formatter:fmtTime">留言时间</th>
				<th data-options="field:'reply',width:150,formatter:fmtContent">回复信息</th>
				<th data-options="field:'replytime',width:80,formatter:fmtTime">回复时间</th>
			</tr>
	    </thead>
	</table>
	
	<!-- 页头搜索框、添加和查询按钮，在数据表格中添加toolbar属性 -->
	<div id="tb" style="padding:5px;height:auto">
		<div>
			用户名: <input class="easyui-textbox" style="width:80px" id="name">
			主题: <input class="easyui-textbox" style="width:80px" id="title">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="query()">查询</a>
		</div>
	</div>
</body>
</html>