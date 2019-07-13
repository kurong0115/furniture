function produceOrder() {
			if($('input[name="addr"]:checked').val()==null){
				getInfoMsg("请选择收货地址")
			}else if($('input[name="payment_method"]:checked').val()==null){
				getInfoMsg("请选择支付方式")
			}else{
				location.href="produceOrder?addressid="+$('input[name="addr"]:checked').val()+"&sum="+$('#sum').val()+"&paymethod="+$('input[name="payment_method"]:checked').val()+"";
			}
		}
    	function CheckOutAddAddress() {
    		var phone = $('#addressPhone').val();
    		if( $('#addressName').val() == ''){
    			getFailMsg('请输入您的姓名！');
    			return;
    		}
    		if( $('#addressPhone').val()==''){
    			getFailMsg('请输入您的电话！');
    			return;
    		}
    		if( $('#loc_province').val()=='' || $('#loc_city').val()==''
    				|| $('#loc_town').val()=='' || $('#addressDetails').val()==''){
    			getFailMsg('请输入完整的地址信息！');
    			return;
    		}
    		if(checkPhone(phone) == false){
    			getFailMsg('手机号码格式错误！');
    			return;
    		}
    		$.post('addAddress',{
    			name:$('#addressName').val(),
    			phone:$('#addressPhone').val(),
    			address:$('#loc_province').select2('data').text+"-"+$('#loc_city').select2('data').text+"-"+$('#loc_town').select2('data').text+"-"+$('#addressDetails').val()
    		},function(data){
    			if(data.code==1){
    				getSuccessMsg(data.message);
    						
    				$("#closeModel").click();
    				window.location.href='checkout';	 
    			}else{
    				getFailMsg(data.message);
    			}
    		})
    	}
    	function checkPhone(phone){ 
    	    if(!(/^1[3456789]\d{9}$/.test(phone))){ 
    	        return false; 
    	    } 
    	}