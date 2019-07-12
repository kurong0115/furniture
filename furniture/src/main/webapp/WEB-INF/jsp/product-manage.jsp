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
            url: 'listAllProductByPage.do',
            toolbar:'#toolbar'" >
        <thead>
            <tr>
                <th data-options="field:'pid',width:15">产品ID</th>
                <th field="model" width="35">产品品牌</th>
                <th field="productname" width="20">产品名称</th>
                <th field="price" width="20">产品价格</th>
                <th field="description" width="90">产品尺寸</th>
                <th field="score" width="20">产品评分</th>
                <th field="stock" width="20">产品库存</th>
                <th data-options="field:'createtime',width:40,formatter:fmtCreateTime">上架时间</th>
                <th data-options="field:'images',width:20,formatter:fmtImages">图片预览</th>
                <th field="content" width="50">产品内容</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProduct()">添加产品</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProduct()">修改产品</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProduct()">下架产品</a>
        <select class="easyui-combobox" style="width:8%;">
            <option value="0">全部</option>
        </select>        
                商品名: <input class="easyui-textbox" style="width:12%" id="productname">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="query()">查询</a>
    </div>
    
    <div id="viewImages" class="easyui-dialog" style="width:45%;height:100%;" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
                 
    </div>
    <div id="imageDetail" class="easyui-dialog" style="width:50%;height:100%;"data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
        
    </div>
    <div id="dlg" class="easyui-dialog" style="width:70%;height:100%;" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px" onsubmit="return check()">
            <h3>产品信息</h3>
            <div style="margin-bottom:10px">
                <input name="pid" class="easyui-textbox" type="hidden"><br>
                <input name="model" class="easyui-textbox" required="true" label="产品品牌:" style="width:40%"><br><br>
                <input name="productname" class="easyui-textbox" required="true" label="产品名称:" style="width:40%"><br><br>
                <select name="cid" style="width:40%;" label="产品分类：" id="options" ></select><br><br>
                <input name="price" class="easyui-textbox" required="true" label="产品价格:" style="width:40%" id="price"><br><br>
                <input name="stock" class="easyui-textbox" required="true" label="产品数量:" style="width:40%" id="stock" ><br><br>
                <input name="description" class="easyui-textbox" required="true" label="产品尺寸:" style="width:80%"><br><br>
                <!-- <input name="content" class="easyui-textbox" required="true" label="产品内容:" style="width:100%"><br><br> -->
                <label style="position: relative;top:-80px;">产品内容:</label>
                <textarea rows="6" cols="60" name="content" id="content" style="margin-left: 20px;"></textarea><br><br>
                
                <div>
	                <div style="float:left;">
	                   <label style="position: relative;top:-5px;">产品图片:</label>
	                </div>
	                <div id="showImages" style="margin-left: 10px;float: left;">
	                   <div class="uploadedImage" style="float: left;">
	                       <input name="uploads" type="hidden" class="titleimgs">
                           <img alt="" src="/head/20190629142434.png" height="80px" style="margin-left: 10px;">
                           <a href="#" onclick="removeImage(this)" style="text-decoration: none;position:relative;top:-80px;">x</a>                           
	                   </div>	                   
	                    	                                        
                        
	                </div>	
	                <div id="option" style="width:80px;height:80px;margin-left: 15px;float: left;">
	                   <img alt="上传图片" src="images/uploadimg.jpg" onclick="file.click()" height="80px" width="80px" id="image"
                        style="border: 1px solid #fcc;display:inline-block;">
                        <input name="file" id="file" type="file" style="display:none;" onchange="upload()">
	                </div>                
	                
                </div>
                
            </div>                     
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveProduct()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
    
    <script type="text/javascript">
        // 文件上传
        function upload(){
        	$.ajax({
                url:"uploadImages.do",
                type:"post",
                cache:false,
                data:new FormData($("#fm")[0]),
                processData:false,
                contentType:false,
                dataType:"json",
                success:function(data){
                  if (data.code == 1){
                	  $("#showImages").prepend('<div class="uploadedImage" style="width: 80px;height:80px;float: left;margin-left:12px;">'+
				      '<input name="uploads" type="hidden" class="titleimgs" value="'+data.data+'">'+
				      '<img alt="" src="'+data.data+'" height="80px" width="80px" style="margin-left: 0px;">'+
				      '<a href="#" onclick="removeImage(this)" style="text-decoration: none;position:relative;top:-95px;left:80px;">x</a> </div>');               	                 	  
                  } 
                  showInformation(data.message);
                },
                
            });
        }
        
        // 消息提示框
        function showInformation(message){
        	$.messager.show({
                title:"系统提示",
                msg:message,
                timeout:2000,
                showType:"slide",
            });
        }
        
        // 移除图片
        function removeImage(input){
        	var path = $(input).prev().prop("src");
            $.ajax({
        		url:'delateImage.do?filename='+path,
        		method:'get',
        		async:true,
        		success:function(data){        			
        			$(input).parent().remove();
        			$('#dg').datagrid('reload');
        			showInformation(data.message);
        		},
        		error:function(){
        			showInformation("服务器繁忙");
        		}
        	})
        	
        }
        
        // 图片预览标签
        function fmtImages(value, row, index){       	
        	return '<a href="javascript:view()" style="text-decoration:none;">点击查看</a>';
        }
        
        // 表格时间填充
        function fmtCreateTime(value, row, index){
        	var date = new Date(value);
            return date.toLocaleString();
        }
        
        // 设置图片信息到编辑框
        function setImages(images){
        	$("#viewImages").empty();
        	for(var i = 0; i < images.length; i++){
        		$("#viewImages").append('<div style="float:left;margin-left:13px;margin-top:13px;">'+
        		'<img src="'+images[i].imgpath+'" onclick="openDetail(this)" width="150px" height="150px" style="margin-left:0px;margin-top:18px;"></div>');
        	}      		       	
        }
        
        // 浏览大图
        function openDetail(input){
        	$("#imageDetail").empty();
        	$("#imageDetail").append('<img src="'+$(input).attr("src")+'" width="100%" height="100%">');
        	$("#imageDetail").dialog('open').dialog('center').dialog('setTitle','大图显示')
        }
        
        // 图片预览
        function view(images){
        	var row = $('#dg').datagrid('getSelected');
        	if (row){
        		images = row.images;
        	}        	
        	setImages(row.images);
        	$("#viewImages").dialog('open').dialog('center').dialog('setTitle','图片预览')
        }
        
        $(function(){
        	$('#price').textbox('textbox').bind('blur', function () {
        		isMoney();
            });
            $('#stock').textbox('textbox').bind('blur', function () {
            	isDigit();
            });
        })
        
        
        
        
        
        // 将所有分类信息填充到下拉框
        function getAllCategory(){
        	$("#options").empty();
        	$.ajax({
        		url:'selectAllCategory.do',
        		method:'get',
        		async:true,
        		success:function(data){
        			if (data != null){
       				    for(var i = 0; i < data.data.length; i++){
       				        $("#options").append('<option  value="'+data.data[i].cid+'">'+data.data[i].categoryname+'</option>');   
       				    }
        			}   
       				$("#options").combobox({});
//       				$("#options").combobox('select', data.data[10].cid);       			
        		},
        		error:function(){
        			showInformation("服务器繁忙");
        		}
        	})
        }
        
        // 用于改变请求的url
        var url;
        
        // 新增一个产品
        function newProduct(){
        	$('#fm').form('clear');
        	$("#showImages").empty();
        	getAllCategory();
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','添加产品')            
            url = 'saveProduct.do';
        }
        
        // 修改产品
        function editProduct(){
            var row = $('#dg').datagrid('getSelected');
            getAllCategory();                                                                           
            if (row){
                $('#dlg').dialog('open').dialog('center').dialog('setTitle','修改商品');
//                $("#options").combobox('select', row.category.cid);  
                editSetImages(row.images); 
                $('#fm').form('load',row);                    
                url = 'updateProduct.do';
            }          
            
        }
        
        // 填充修改信息时的图片信息
        function editSetImages(images){
        	$("#showImages .uploadedImage").remove();
        	for (var i = 0; i < images.length; i++){
        		$("#showImages").prepend('<div class="uploadedImage" style="width: 80px;height:80px;float: left;margin-left:12px;">'+
                   '<img alt="" src="'+images[i].imgpath+'" height="80px" width="80px" style="margin-left: 0px;">'+
                   '<a href="#" onclick="delImage(this,'+images[i].imgid+')" style="text-decoration: none;position:relative;top:-95px;left:80px;">x</a> </div>');
        	}
        }
        
        // 持久化产品信息
        function saveProduct(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate')&&isMoney()&&isDigit();
                },
                success: function(result){
                    result = JSON.parse(result);
                    if (result.code == 1){                    	
                        showInformation(result.message);                        
                    } 
                    $('#dlg').dialog('close');      
                    $('#dg').datagrid('reload');
                }
            });
        }
        
        // 正则表达式判断是不是数字
        function isDigit(){
            var reg = /^[1-9][0-9]*$/;
            if (reg.test($("#stock").val())){
                return true;
            } else {
                showInformation('请输入正确的数量');
                return false;
            }
        }
        
        // 正则表达式判断数字是不是金钱格式
        function isMoney(){
            var reg=/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9](0-9)?$)/;
            if (reg.test($("#price").val())){
                return true;
            } else {                
                showInformation('请输入正确的价格');
                return false;
            }           
        }
        
        // 将产品下架
        function destroyProduct(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','您确定下架此产品吗?',function(r){
                    if (r){
                        $.post('removeProduct.do',{pid:row.pid},function(result){
                            if (result.code == 1){
                            	showInformation(result.message);  
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                            	showInformation(result.message);  
                            }
                        },'json');
                    }
                });
            }
        }
               
        // 删除产品对应的图片信息及本地文件
        function delImage(input,id){
            $.ajax({
                url:'removeImage.do?imgid=' + id,
                method:'get',
                async:true,
                success:function(data){
                    if (data.code == 1){
                        removeImage(input);
                    }                   
                    showInformation(data.message);
                },
                error:function(){
                    showInformation("服务器繁忙");
                }
            })
        }
    </script>
</body>
</html>