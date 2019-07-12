<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分类管理</title>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</head>
<body> 
    <table id="dg" title="产品分类管理" class="easyui-datagrid" style="width:100%;height:500px"
        data-options="
	        fitColumns: true,
	        singleSelect: true,
	        fit: true,
	        pagination: true,
	        pageSize: 5,
	        pageList: [5,10,20],
	        url: 'listAllCategory.do',
	        rownumbers: true,
	        toolbar:'#toolbar'" >
        <thead>
            <tr>
                <th field="cid" width="30">类别ID</th>
                <th field="categoryname" width="50">类别名称</th>
                <th field="count" width="50">产品数量</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newCategory()">添加分类</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editCategory()">修改分类</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyCategory()">删除分类</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
            <h3>分类信息</h3>
            <div style="margin-bottom:10px">
                <input name="categoryname" class="easyui-textbox" required="true" label="类别名称:" style="width:100%">
            </div>                     
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveCategory()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
    <script type="text/javascript">
        var url;
        function newCategory(){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','添加分类');
            $('#fm').form('clear');
            url = 'saveCategory.do';
        }
        function editCategory(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('center').dialog('setTitle','修改分类');
                $('#fm').form('load',row);
                url = 'updateCategory.do?cid='+row.cid;
            }
        }
        
        function saveCategory(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                	result = JSON.parse(result);
                    if (result.code == 1){
                        $.messager.show({
                            title: '提示',
                            msg: result.message,
                            timeout:2000,
                            showType:"slide"
                        });
                        
                    } else {
                    	$.messager.show({
                            title: '错误',
                            msg: result.message,
                            timeout:2000,
                            showType:"slide"
                        });    
                    }
                    $('#dlg').dialog('close');      
                    $('#dg').datagrid('reload');
                }
            });
        }
        function destroyCategory(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','您确定删除此分类吗?',function(r){
                    if (r){
                        $.post('removeCategory.do',{cid:row.cid},function(result){
                            if (result.code == 1){
                            	$.messager.show({   // show error message
                                    title: '提示',
                                    msg: result.message,
                                    timeout:2000,
                                    showType:"slide"
                                });
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({   // show error message
                                    title: '错误',
                                    msg: result.message,
                                    timeout:2000,
                                    showType:"slide"
                                });
                            }
                        },'json');
                    }
                });
            }
        }
    </script>
</body>
</html>