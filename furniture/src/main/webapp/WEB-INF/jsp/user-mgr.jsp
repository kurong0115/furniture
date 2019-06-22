<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>用户管理</title>
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
			email: $("#email").val()
		});
	}
	
	// 打开编辑弹窗
	function openEdit(){
		$('#ff').form('clear');
		
		$("#ti").attr("src", "/images/uploadimg.jpg");
		$('#dlg').dialog('open');
	}
	
	// 保存编辑信息
	function save(){
		$('#ff').form('submit',{
			url: "user/save",
			onSubmit: function(){
				//扩展参数
			},
			success: function(data){	//data是json字符串而不是json对象
				data = JSON.parse(data);
				//消息框弹窗
				$.messager.alert("提醒", data.message);
				//alert(data.message);
				if(data.code == 1){
					$('#dg').datagrid('reload');
					$('#dlg').dialog('close');
				}else{
					// console.info(data); 在服务器控制台输出Result，查看报错信息结构
					// 提示错误信息
					for(var i = 0; i < data.data.length; i++){
						alert(data.data[i].defaultMessage);
					}
				}
			}
		});
	}
	
	// 头像格式化
	function fmtimgs(value, row, index){
		return '<img src="'+value+'" height="50px"/>';
	}
	// 查看收货信息
	function fmtop(value, row, index){
		return '<input type="button" value="查看详情" onclick=\'modify('+index+')\'>';
	}
	function modify(index){
		var row = $('#dg').datagrid('getRows')[index];
		
		//将用户的uid传给控制器，利用uid查出其地址信息
		$('#fff').datagrid({
			url:'/user/queryAddress',
		    queryParams:{
		        uid : row.id,
		        state:'ok'
		    }
		});
		
		$('#fff').form('load', row);
		$('#ddd').dialog('open');
	}
	
	// 文件上传
	function upload(){
		$.ajax({
	        url: "/user/upload",
	        type: 'POST',
	        cache: false,
	        data: new FormData($('#ff')[0]),
	        processData: false,
	        contentType: false,
	        dataType:"json",
	        success : function(data) {
	            if (data.code == 1) {
	                $("#ti").attr("src", data.data);
	                $("#head").val(data.data);
	                $.messager.show({
	                	title:'系统提示',
	                	msg:data.message,
	                	timeout:2000,
	                	showType:'slide'
	                });
	            } else {
	            	$.messager.alert('系统提示', data.message, 'error');
	            }
	        }
	    });
	}
</script>
</head>
<body>
	<!-- 数据表格，展示博文基础信息 -->
	<table class="easyui-datagrid" id="dg" data-options="
		fitColumns: true,
		singleSelect: true,
		fit: true,
		pagination: true,
		pageSize: 5,
		pageList: [5,10,20],
		url: 'user/query',
		rownumbers: true,
		toolbar:'#tb'">
	    <thead>
			<tr>
				<th data-options="field:'name',width:100">用户名</th>
				<th data-options="field:'email',width:100">邮箱</th>
				<th data-options="field:'head',width:100,formatter:fmtimgs">头像</th>
				<th data-options="field:'id',width:100,formatter:fmtop">收货信息</th>
			</tr>
	    </thead>
	</table>
	
	<!-- 页头搜索框、添加和查询按钮，在数据表格中添加toolbar属性 -->
	<div id="tb" style="padding:5px;height:auto">
		<div>
			用户名: <input class="easyui-textbox" style="width:80px" id="name">
			邮箱: <input class="easyui-textbox" style="width:80px" id="email">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="openEdit()">添加</a>
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="query()">查询</a>
		</div>
	</div>
	
	<!-- 弹窗添加新用户 -->
	<div id="dlg" class="easyui-dialog" title="添加用户" style="width:600px;height:400px;padding:10px"
		data-options="
			iconCls: 'icon-save',
			buttons: [{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){
					save();
				}
			},{
				text:'取消',
				iconCls:'icon-no',
				handler:function(){
					$('#dlg').dialog('close');
				}
			}],
			closed: true,
			modal: true
		">
		<form id="ff" method="post" style="text-align:center">
			<input type="hidden" name="id" id="id">
			
			<!-- ajax文件上传，需要3个控件 -->
			<img height="70px" id="ti" alt="点击上传图片" src="/images/uploadimg.jpg" 
				onclick="file.click()" style="display:inline-block;float:right;
				border:1px solid #666;margin:7px 15px">
			<input type="hidden" name="head" id="head">
			<input type="file" name="file" style="display: none;" onchange="upload()">
			
			<input class="easyui-textbox" name="name" data-options="label:'用户名',width:400"><br/>
			<input class="easyui-textbox" name="password" data-options="label:'密码',width:400"><br/>
			<input class="easyui-textbox" name="email" data-options="label:'邮箱',width:400"><br/>
		</form>
	</div>
	
	<!-- 弹窗展示收货信息 -->
	<div id="ddd" class="easyui-dialog" title="收货信息" style="width:900px;height:500px;padding:10px"
		data-options="
			iconCls: 'icon-save',
			buttons: [{
				text:'关闭',
				iconCls:'icon-ok',
				handler:function(){
					$('#ddd').dialog('close');
				}
			}],
			closed: true,
			modal: true
		">
		
		<table class="easyui-datagrid" id="fff" data-options="
			singleSelect: true,
			fit: true,
			pagination: true,
			pageSize: 5,
			pageList: [5,10,20],
			rownumbers: true">
		    <thead>
				<tr>
					<th data-options="field:'address',width:550">收货地址</th>
					<th data-options="field:'name',width:100">收货人</th>
					<th data-options="field:'phone',width:180">电话</th>
				</tr>
		    </thead>
		</table>
	</div>
</body>
</html>