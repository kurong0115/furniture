<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>产品管理</title>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</head>
<body> 
    <table id="dg" title="产品管理" class="easyui-datagrid" style="width:100%;height:500px"
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
                <th field="model" width="30">产品品牌</th>
                <th field="productname" width="50">产品名称</th>
                <th field="price" width="50">产品价格</th>
                <th field="description" width="50">产品尺寸</th>
                <th field="score" width="50">产品评分</th>
                <th field="stock" width="50">产品库存</th>
                <th field="createtime" width="50">上架时间</th>
                <th field="content" width="50">产品内容</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newCategory()">添加产品</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editCategory()">修改产品</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyCategory()">下架产品</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:70%;height:100%;" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
            <h3>产品信息</h3>
            <div style="margin-bottom:10px">
                <input name="model" class="easyui-textbox" required="true" label="产品品牌:" style="width:40%"><br><br>
                <input name="productname" class="easyui-textbox" required="true" label="产品名称:" style="width:40%"><br><br>
                <select class="easyui-combobox" name="cid" style="width:40%;" label="产品分类：">
                    <option selected="selected" value="1">客厅</option>
                </select><br><br>
                <input name="price" class="easyui-textbox" required="true" label="产品价格:" style="width:40%"><br><br>
                <input name="stock" class="easyui-textbox" required="true" label="产品数量:" style="width:40%"><br><br>
                <input name="description" class="easyui-textbox" required="true" label="产品尺寸:" style="width:80%"><br><br>
                <!-- <input name="content" class="easyui-textbox" required="true" label="产品内容:" style="width:100%"><br><br> -->
                <label style="position: relative;top:-80px;">产品内容:</label>
                <textarea rows="6" cols="60" name="content" id="content" style="margin-left: 20px;"></textarea><br><br>
                <div>
	                <label style="position: relative;top:22px;">产品图片:</label>
	                <div id="showImages" style="margin-left: 70px;">	                   
	                    <!-- <input name="images" type="hidden" class="titleimgs">
                        <img alt="" src="/head/20190629142434.png" height="80px" style="margin-left: 10px;"> -->	                                        
                        <img alt="上传图片" src="images/uploadimg.jpg" onclick="file.click()" height="80px" id="image"
                        style="border: 1px solid #fcc;display:inline-block;margin-left:20px;margin-top:10px;">
                    <input name="file" id="file" type="file" style="display:none;" onchange="upload()">
	                </div>	                
	                
                </div>
                
            </div>                     
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveCategory()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
    <script type="text/javascript">
        function upload(){
        	$.ajax({
                url:"uploadImages.do",
                type:"post",
                cache:false,
                data:new FormData($("#ff")[0]),
                processData:false,
                contentType:false,
                dataType:"json",
                success:function(data){
                  if (data.code == 1){
                	  $("#showImages").prepend('<input name="images" type="hidden" class="titleimgs" value="'+data.data+'">');
                	  $("#showImages").prepend('<img alt="" src="'+data.data+'" height="80px" style="margin-left: 10px;">');
                      $.messager.show({
                          title:"系统提示",
                          msg:data.message,
                          timeout:2000,
                          showType:"slide",
                      });
                  } else{
                      $.messager.show({
                          title:"系统提示",
                          msg:data.message,
                          timeout:2000,
                          showType:"slide",
                      });
                  } 
                },
                
            });
        }
    
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
                    alert(result);
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