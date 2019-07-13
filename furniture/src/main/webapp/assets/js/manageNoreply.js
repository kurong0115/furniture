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
			+'border-radius: 10px;overflow-x:hidden;overflow-y: auto;width:300px;height:200px;">'+value+'</textarea>.';
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
		var date = new Date(value);
		var year = date.getYear()+1900;
		var month = date.getMonth()+1;
		var day = date.getDate();
		var hour = date.getHours();
		var minute = date.getMinutes()+1;
		return year+"-"+month+"-"+day+"  "+hour+":"+minute;
	}
	
	// 回复留言
	function fmtReply(value, row, index){
		return '<input type="button" value="回复" style="background:#f8f9fa;border-radius: 25px;" onclick=\'modify('+index+')\'>';
	}
	// 打开表单编辑
	function modify(index){
		var row = $('#dg').datagrid('getRows')[index];
		
		$('#ff').form('load', row);
		$('#dlg').dialog('open');
	}