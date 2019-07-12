<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">

<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<style type="text/css">
	.dealOrder{
		height:30px;
		border-radius:10px;
		background:#E0ECFF;
		border:0px solid #fff;
	}
	.seeOrder{
		height:30px;
		border-radius:10px;
		background:#E0ECFF;
		border:0px solid #fff;
	}
	
	.seeOrder:hover {
		background-color: blue;
		color:white;
		cursor:pointer;
	}
	.dealOrder:hover {
		background-color: blue;
		color:white;
		cursor:pointer;
	}
</style>
<script type="text/javascript">
setInterval("getNewOrder()", 30000);
$(getNewOrder());
function getNewOrder(){
	$.post("manage/getNewOrder",function(data){
		if(data.code==1){
			$.messager.show({
				title:'提示',
				msg:data.message,
				timeout:8000,
				showType:'slide'
			});
			$('#tt').datagrid('reload');
		}
	})
}

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
</script>
</head>
<body>
	<div id="tb" style="padding:3px">
		<div>
			<span>订单编号</span>
			<input id="orderno" class="easyui-textbox" style="width:100px" placeholder="输入编号">
			<span>用户名:</span>
			<input id="uname" class="easyui-textbox" style="width:100px" placeholder="输入用户名" >
			<span>下单时间区间:</span>
			<input class="easyui-datetimebox" name="birthday" id="createtime1" style="width:170px">
			<span>~</span>
			<input class="easyui-datetimebox" name="birthday" id="createtime2" style="width:170px;  ">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="doSearch()">查询</a>
			
		</div>
	</div>
	<table id="tt" class="easyui-datagrid"
		data-options="
		url:'manage/manageOrdersAll',
		fitColumns:true,
		singleSelect:true,
		pageSize:5,
		pageNumber:1,
		pageList:[5,10,20],
		rownumbers:true,
		pagination:true,
		fit:true,
		toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'orderno',width:'50',align:'center'">订单编号</th>
				<th data-options="field:'uname',align:'center',formatter:function(val,row){
					if(row.user==null){
						return '空';
					}else{
						return row.user.name;
					}
				}">下单用户</th>
				<th data-options="field:'createtime',align:'center',formatter:function(value,row,index){  
			            var createtime = new Date(value);  
			            return createtime.toLocaleString();  
			    }">下单时间</th>
			    <th data-options="field:'addressid',width:'100',align:'center',formatter:function(val,row){
					if(row.address==null){
						return '空';
					}else{
						var addr=row.address.address+'--'+row.address.name+'--'+row.address.phone;
						return addr;
					}
				}">收货地址</th>
			    <th data-options="field:'sum',align:'center'">总金额</th>			
				<th data-options="field:'isdeal',align:'center',formatter:function(value,row,index){  
			           if(value==1){
			           		return '订单已处理';	
			           }else{
			           		return '订单未处理';  
			           } 
			            
			    }">处理情况</th>
				<th data-options="field:'orderStatus',align:'center',formatter:function(value,row,index){  
			           if(row.isfinish==1){
			           		return '订单已完成';	
			           }else if(row.isdeal==1){
			           		return '订单已处理，请尽快发货';  
			           }else{
			           		return '订单已付款,请及时处理';  
			           }
			            
			    }">订单状态</th>
				<th data-options="field:'id',align:'center',formatter:fmtbnt" >操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="dlg" class="easyui-dialog" title="查看订单" style="width:60%;height:90%;padding:10px"
			data-options="
				buttons: [{
					text:'处理订单',
					iconCls:'icon-ok',
					handler:function(){
						dlDgealOrder();
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						closeEdit();
					}
				}],
				closed:true,
				modal:true
			">
		<form id="ff" method="post">
			<input type="hidden" name="id" id="ffOrderId">
			<input class="easyui-textbox" name="orderno" style="width:90%;" data-options="label:'订单编号'," readonly="readonly"/>
			<br/>
			<br/>
			<input class="easyui-textbox" name="username" style="width:90%;" data-options="label:'下单用户'" readonly="readonly"/>
			<br/>
			<br/>
			<input class="easyui-textbox" name="createtime" style="width:90%;" data-options="label:'下单时间'" readonly="readonly"/>
			<br/>
			<br/>
			<input class="easyui-textbox" name="address" style="width:90%;" data-options="label:'收货地址'" readonly="readonly"/>
			<br/>
			<br/>
			<input class="easyui-textbox" name="orderStatus" id="fforderStatus" style="width:90%;" data-options="label:'订单状态'" readonly="readonly"/>			
			<br/>
			<br/>
			<span>订单详细</span>
			
		</form>
		<table style="width: 100%;border: 1px solid #4879c4;border-radius: 5px;text-align: center;">
				<thead style="text-align: center;">
                    <tr >
                        <th >图片</th>
                        <th >物品名</th>
                        <th >原价</th>
                        <th >数量</th>
                        <th >小计</th>
                    </tr>
                </thead>
                <tbody id="tbb">
                   		
                </tbody>
			</table>
	</div>
</body>
</html>