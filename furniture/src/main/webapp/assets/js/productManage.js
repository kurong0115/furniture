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
        
        // 填充内容
        /* function fmtContent(value, row, index){
        	return '<span title="' + value + '">' + value + '</span>';
        } */
        
        
        
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
        	$('#fm').form('clear');
        	getAllCategory();          
            var row = $('#dg').datagrid('getSelected');                                                                            
            if (row){           	
                $('#dlg').dialog('open').dialog('center').dialog('setTitle','修改商品');               
                editSetImages(row.images);     
                $("#options").combobox({
                	onLoadSuccess:function(){
                		$("#options").combobox('select',row.category.cid);
                	}
                });
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
        
        // 重新上架产品
        function uploadProduct(){
        	var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','您确定上架此产品吗?',function(r){
                    if (r){
                        $.post('uploadProduct.do',{pid:row.pid},function(result){
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
        
        // 条件查询产品信息
        function query(){       	
       		$('#dg').datagrid('load',{
                   cid: $("#productType").val(),
                   productname: $("#productname").val()
            });       	           	
        }