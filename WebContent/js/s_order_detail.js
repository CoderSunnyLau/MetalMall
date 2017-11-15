sysInit();
var successCallback = function(){
	console.log(99)
	var postData={};
	//初始化頁面
	var orderParam = [],
	orderParamSeller = [
		'username',
		'phone',
		'area'
	],
	orderParamBuyer = [
   		'username',
		'phone',
		'area',
		'uniformCreditCode',
		'corporateName',
		'address',
		'bankName',
		'bankAccount',
		'creditAmount'
	],
	orderParamProduct = [
		'name',
		'material',
		'specification',
		'weight',
		'quantity',
		'price'
	],
	orderParam = [
 		'status',
 		'userMark',
 		'creditBank',
 		'paymentType',
 		'paymentDeadline',
 		'productQuantity',
 		'serviceCharge',
 		'orderPriceAmount'
 	];
	var resId;
	$('.o_id').html(getSysUrlParam('orderId'));
	$.ajax({
		url: DOMAIN + '/getUserOrderDetailLv2',
		type: 'GET',
		data: {
			'id': getSysUrlParam('orderId')
		},
		success: function(res){
			$('.cnt_body').show();
			doFill(res.product, orderParamProduct, 'op_');
			doFill(res.buyer, orderParamBuyer, 'ob_');
			doFill(res.seller, orderParamSeller, 'os_');
			doFill(res, orderParam, 'o_');
			$('.op_amount').html((res.product.price * res.productQuantity).toFixed(2));
			$('.order_track').empty();
			for(var i = 0; i < res.listOrderHistoryMark.length; i++){
				var item = res.listOrderHistoryMark[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				$('.order_track').append('<p class="' + _class + '">' + item + '</p>')
			}
		}

	});
}
	
var errorCallback = function(){
	alert('您当前尚未登录，即将跳转到登录页。');
	var _target = window.location.href;
	window.location.href = YJS + 'login.jsp?target=' + _target;
}

var orderType = getSysUrlParam('orderType') || 0;
$('.order_back button').click(function(){
	var _url = 'system.jsp';
	if(_href.indexOf('/admin/') >= 0){
		jump('admin', 'orders');
	}else if(_href.indexOf('/bank/') > -1){
		jump('bank', 'credit_apply');
	}else{
		if(orderType == 0){
			window.location.href = _url;
		}else{
			jump('company', 'orders_' + orderType);
		}
	}
});

/*	$('.view_order').click(function(){
		//判斷跳轉地址
		var url = '../admin/system_' + userType + '.jsp?page=order_detail&orderTpye=purchase&orderId=' + resId;
		window.open(url);
	});
*/	
$('.submit').click(function(){
	$(this).attr('disabled','disabled');
	if(!$('.op_count').attr('disabled')){
		alert('请确认商品数量');
		$('.op_count').addClass('red_border').focus();
		var countTemp = $('.op_count').val();
		$('.op_count').val(countTemp);
		$(this).removeAttr('disabled','disabled');
	}else if(($('#pay_type').val()=="0") || ($('#sel_bank').val()=="0") || ($('#sel_deadline').val()=="0")){
		alert('请选择支付方式');
		$(this).removeAttr('disabled','disabled');
	}else{
		$(this).addClass('sent').html('正在提交...');
		doAddOrder();
	}
});
	
//doAddOrder
var doAddOrder = function(){
	postData.quantity = Number($('.op_count').val());
	postData.amount = Number($('.total_money').html());
	postData.totalWeight = Number($('.op_totalweight').html());
	postData.paymentType = $('#pay_type').val();
	postData.paymentDeadline = $('#sel_deadline').val();
//		postData.creditBankId = $('#sel_bank').val();
	postData.creditBank = $('#sel_bank').find("[value='" + $('#sel_bank').val() + "']").html();
	console.log(postData.creditBank)
	postData.userMark = $('.remark').val();
	
	$.ajax({
		url: DOMAIN + "/addUserOrder",
		type: "POST",
		data: JSON.stringify(postData),
		dataType: 'JSON',
		contentType : "application/json ; charset=utf-8", 
		success: function(res){
			if(res.saved){
				window.location.href = YJS + '/web/order_success.jsp?orderId=' + res.orderId;
			}else{
				alert(res.message);
				$('.submit').removeAttr('disabled').removeClass('sent');
			}
		},
		error: function(res){
			alert('订单提交失败，请重新提交。');
			$('.submit').removeAttr('disabled').removeClass('sent');
		}
	});
}