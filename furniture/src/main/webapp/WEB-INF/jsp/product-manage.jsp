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
<style type="text/css">
    a:hover{
        color:red;
    }
</style>
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
                <th field="model" width="35">产品品牌</th>
                <th field="productname" width="20">产品名称</th>
                <th data-options="field:'categoryname',width:15,formatter:fmtCategoryname">产品类别</th>
                <th field="price" width="20">产品价格</th>
                <th field="description" width="90">产品尺寸</th>
                <th field="score" width="20">产品评分</th>
                <th field="stock" width="20">产品库存</th>
                <th data-options="field:'createtime',width:40,formatter:fmtCreateTime">上架时间</th>
                <th data-options="field:'images',width:20,formatter:fmtImages">图片预览</th>
                <!-- <th field="content" width="50" data-options="formatter:fmtContent" align="center">产品内容</th> -->
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProduct()">添加产品</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProduct()">修改产品</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="uploadProduct()">上架产品</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProduct()">下架产品</a>
        <select class="easyui-combobox" style="width:8%;" onclick="getAllCategory()" id="productType">
            
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
                <select name="cid" style="width:40%;" label="产品分类：" id="options"></select><br><br>
                <input name="price" class="easyui-textbox" required="true" label="产品价格:" style="width:40%" id="price"><br><br>
                <input name="stock" class="easyui-textbox" required="true" label="产品数量:" style="width:40%" id="stock" ><br><br>
                <input name="description" class="easyui-textbox" label="产品尺寸:" style="width:80%"><br><br>
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
    <script type="text/javascript" src="/assets/js/productManage.js"></script>
    <script type="text/javascript">
    
	    $(function(){
	        $('#price').textbox('textbox').bind('blur', function () {
	            isMoney();
	        });
	        $('#stock').textbox('textbox').bind('blur', function () {
	            isDigit();
	        });
	        getAllCategory();
	    })
	    
        // 产品类别填充
        function fmtCategoryname(value, row, index){
            return row.category.categoryname;
        }
	    
	    // 图片预览标签
        function fmtImages(value, row, index){          
            return '<a class="easyui-linkbutton" href="javascript:view()" style="text-decoration: none">点击查看</a>';
        }
                  
        // 表格时间填充
        function fmtCreateTime(value, row, index){
            var date = new Date(value);
            return date.toLocaleString();
        }
        
        // 将所有分类信息填充到下拉框
        function getAllCategory(){
            $("#options").empty();
            $("#productType").empty();
            $("#productType").append("<option value='0'>全部</option>");          
            $.ajax({
                url:'selectAllCategory.do',
                method:'get',
                async:true,
                success:function(data){
                    if (data != null){
                        for(var i = 0; i < data.data.length; i++){
                            $("#options").append('<option  value="'+data.data[i].cid+'">'+data.data[i].categoryname+'</option>');
                            $("#productType").append('<option  value="'+data.data[i].cid+'">'+data.data[i].categoryname+'</option>');
                        }
                    }   
                    $("#options").combobox({});
                    $("#productType").combobox({});                    
                    $("#productType").combobox({
                        onLoadSuccess:function(){
                            $("#productType").combobox('select',0);
                        }
                    });
                },
                error:function(){
                    showInformation("服务器繁忙");
                }
            })
        }
     
     
      </script>
</body>
</html>