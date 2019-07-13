
function fmtbnt(value,row,index) {
	var row=$('#tt').datagrid('getRows')[index];
	if(row.isdeal==0){
		return  '<img src="assets/img/new.jpg" width="35px" height="35px" style="vertical-align: middle;"/>'+
				'<input class="dealOrder" type="button" value="处理订单"  onclick=\'dealOrder('+index+')\'/>'+
				'<input class="seeOrder" type="button" value="查看订单"  onclick=\'seeOrder('+index+')\' />';
	}else{
		return  '<input class="dealOrder" type="button" value="处理订单"  onclick=\'dealOrder('+index+')\'/>'+
				'<input class="seeOrder" type="button" value="查看订单"  onclick=\'seeOrder('+index+')\' />';
	}
	
}
function openEdit() {
	$('#ff').form('clear');
	$("#dlg").dialog('open');
	
}
function closeEdit() {	
	$("#dlg").dialog('close');
}

function dlDgealOrder(){
	var id=$('#ffOrderId').val();
	var orderStatus=$('#fforderStatus').val();
	if(orderStatus=='订单已付款，已处理，请尽快发货'){
		$.messager.alert('提示','订单已处理，无需重复处理');
		return ;
	}
	if(orderStatus=='订单已完成'){
		$.messager.alert('提示','订单已完成，无需处理');
		return ;
	}
	$.post('manage/dealOrder',{
		orderid:id
	},function(data){
		if(data.code==1){
			$.messager.show({
				title:'提示',
				msg:data.message,
				timeout:1000,
				showType:'slide'
			});
			closeEdit();
			$('#tt').datagrid('reload');
		}else{
			$.messager.alert('提示','服务器繁忙，请稍后再试');
		}
	});
	
}

function dealOrder(index){
	var row=$('#tt').datagrid('getRows')[index];
	if(row.isdeal==1){
		$.messager.alert('提示','订单已处理，无需重复处理');
		return;
	}
	$.post('manage/dealOrder',{
		orderid:row.id
	},function(data){
		if(data.code==1){
			$.messager.show({
				title:'提示',
				msg:data.message,
				timeout:1000,
				showType:'slide'
			});
			$('#tt').datagrid('reload');
		}else{
			$.messager.alert('提示','服务器繁忙，请稍后再试');
		}
	});
}

function seeOrder(index){
	$('#rowIndex').val(index);
	openEdit();
	var row=$('#tt').datagrid('getRows')[index];
	var time = new Date(row.createtime); 
	
	var status="";
	if(row.ispay==1 && row.isdeal==0 && row.isfinish==0){
		status+='订单已付款，尚未处理，请尽快处理';
	}
	if(row.ispay==1 && row.isdeal==1 && row.isfinish==0){
		status+='订单已付款，已处理，请尽快发货';
	}
	if(row.ispay==1 && row.isdeal==1 && row.isfinish==1){
		status+='订单已完成';
	}

	
	$('#ff').form('load',{
		orderno:row.orderno,
		username:row.user.name,
		createtime:time.toLocaleString(),
		address:row.address.address+'--'+row.address.name+'--'+row.address.phone,
		orderStatus:status,
		id:row.id
	});
	$('#tbb').find("tr").remove();
	$.post('manage/showOrderByOrderId',{
		orderid:row.id
	},function(data){
		if(data.code==1){
			for(var i=0;i<data.data.length;i++){
				$('#tbb').append(
						'<tr>'+
		                    '<td ><span><img src="'+data.data[i].productList[0].images[0].imgpath+'" alt="" width="82px" height="82px"></span></td>'+
		                    '<td ><span>'+data.data[i].productList[0].productname+'</span></td>'+
		                    '<td >￥<span>'+data.data[i].price+'</span></td>'+
		                    '<td ><span>'+data.data[i].count+'</span></td>'+
		                    '<td >￥<span>'+data.data[i].sum+'</span></td>'+ 
		                '</tr>'		
				);
			}
			
		}else{
			$.messager.alert('提示','服务器繁忙，请稍后再试');
		}
	});
}

function doSearch(){
	if($('#createtime1').val()>$('#createtime2').val()){
		$.messager.alert('提示','请选择正确的时间区间');
		return;
	}
	$('#tt').datagrid('load',{
		orderno:$('#orderno').val(),
		uname:$('#uname').val(),
		createtime1:$('#createtime1').val(),
		createtime2:$('#createtime2').val()
	});
}