
	var postData={};
	//初始化頁面
	var orderParam = [
		'productName',
		'material',
		'specification',
		'unitWeight',
		'totalWeight',
		'unitPrice',
		'amount',
		'paymentType',
		'creditBank',
		'paymentDeadline',
		'userMark',
		'serviceCharge'
	],
	orderParamSeller = [
	    'username'
	],
	orderParamBuyer = [
	    'username',
	    'phone'
	],
	orderParamProduct = [
   	    'name',
   	    'material',
   	    'specification',
   	    'weight',
   	    'price'
   	];
	if(window.location.href.indexOf("admin/system_") != -1){
		orderParam.push(
			'id',
			'status',
			['seller_phone','productSellerInfo','phone'],
			['seller_area','productSellerInfo','area'],
			['buyer_code','buyerInfo','uniformCreditCode']
		);
	}
	var resId;
	var successCallback = function(){
		if(_href.indexOf('order_checkout') >= 0){
			var _url = DOMAIN + '/getPrepareUserOrderInfo';
			$.ajax({
				url: _url,
				type: 'GET',
				data: {
					'productId': getUrlParameter('productId'),
					'userId': USERID
				},
				success: function(r){
					var res = r.prepareUserOrderInfo;
					doFill(res.product, orderParamProduct, 'op_');
					doFill(res.buyer, orderParamBuyer, 'ob_');
					doFill(res.seller, orderParamSeller, 'os_');
					if(_href.indexOf('order_checkout') >= 0){
						var amount = Number($('.op_amount').html());
						$('.op_amount').html(amount.toFixed(2));
						$('.total_money').html((amount + 100).toFixed(2));
						var items = r.paymentItems;
						var payTypeArr = [];
						for(payType in items){
							payTypeArr.push(payType);
						}
						optionConfigInit('pay_type', payTypeArr);
						var selected_bank;
						$('#pay_type').change(function(){
							selected_type = $(this).val();
							if($(this).val() != 0){
								var pay_type = items[$(this).val()];
								$('#sel_bank').empty().append('<option value="0">选择银行</option>');
								$('#sel_deadline').empty().append('<option value="0">选择期限</option>');
								for(bank in pay_type){
									console.log(bank)
									var option = new Option(bank,bank);
									$('#sel_bank').append(option);
								}
							}else{
								$('#sel_bank').empty().append('<option value="0">选择银行</option>');
								$('#sel_deadline').empty().append('<option value="0">选择期限</option>');
							}
						});
						$('#sel_bank').change(function(){
							if($(this).val() != 0){
								var sel_bank = items[selected_type][$(this).val()];
								console.log(sel_bank)
								$('#sel_deadline').empty().append('<option value="0">选择期限</option>');
								var deadlineArr = sel_bank.split(',');
								for(var i = 0; i < deadlineArr.length; i++){
									var option = new Option(deadlineArr[i], deadlineArr[i]);
									$('#sel_deadline').append(option);
								}
							}else{
								$('#sel_deadline').empty().append('<option value="0">选择期限</option>');
							}
						});
//						optionConfigInit('pay_bank', res.productType);
//						optionConfigInit('pay_deadline', res.productType);
					}
					
					var pdt = res.product;
					postData ={
						"id": null,
						"userId": USERID,
						"productId": Number(getUrlParameter('productId')),
						"productName": pdt.name,
						"productType": pdt.type,
						"quantity": null,
						"unit": pdt.unit,
						"amount": null,//订单总价
						"totalWeight": null,//总重量
						"material": pdt.material,//材质
						"specification": pdt.specification,//规格说明
						"paymentType": "",//支付方式
						"paymentDeadline": "",//支付期限
						"creditBankId": null,//(该单选取的）信用银行的id'
						"creditBank": "",//(该单选取的）信用银行
						"bankInterest": null,//银行收取该单的利息
						"createTime": null,//订单创建时间
						"status": "已下单",//状态：已下单、已确认、已授信、拒绝授信、已发货、已签收、已取消
						"confirmTime": null,//确认时间
						"creditTime": null,//授信时间
						"sendTime": null,//发货时间
						"receiveTime": null,//收货时间
						"cancelTime": null,//取消时间
						"whoCancel": "",
						"serviceCharge": 100,//服务费
						"userMark": "",//用户备注
						"systemMark": "",//系统备注
						"valid": "Y"//是否生效
					}
				}
				
			});
		}else if(window.location.href.indexOf('order_success') >= 0){
			$.ajax({
				url: DOMAIN + '/getUserOrderDetail',
				type: 'GET',
				data: {
					'id': getUrlParameter('orderId')
				},
				success: function(res){
					var orderOtherData = [
					    'creditBank',
					    'orderPriceAmount',
					    'paymentDeadline',
					    'paymentType',
					    'productQuantity',
					    'serviceCharge'
					];
					doFill(res.product, orderParamProduct, 'op_');
					doFill(res.buyer, orderParamBuyer, 'ob_');
					doFill(res.seller, orderParamSeller, 'os_');
					doFill(res, orderOtherData, 'o_');
					$('.op_amount').html((res.productQuantity * res.product.price).toFixed(2));
					$('.op_totalweight').html(res.productQuantity * res.product.weight);
				}

			});
		}
	}
	
	var errorCallback = function(){
		alert('您当前尚未登录，即将跳转到登录页。');
		var _target = window.location.href;
		window.location.href = YJS + '/web/login.jsp?target=' + _target;
	}
	
//	$.get('../data/order.json',function(res){
//		doFill(res, orderParam, 'os_');
//		//银行授信
//		resId = res.id;
//	});
	var setCount = 0;
	$('.count_btn').click(function(){
		if(setCount == 0){
			setCount = 1;
			$(this).html("确认");
			$('.op_count').removeAttr('disabled').focus();
			var countTemp = $('.op_count').val();
			$('.op_count').val("").val(countTemp);
		}else{
			setCount = 0;
			$(this).html("修改");
			$('.op_count').attr('disabled', 'disabled').removeClass('red_border');
			var input_el = $('.op_count');
			var count;
			var _thisArray = input_el.val().split('.');
			if(_thisArray.length == 2 && Number(_thisArray[1]) > 0){
				count = Number(input_el.val()).toFixed(3) || 1;
			}else{
				count = parseInt(input_el.val()) || 1;
			}
			$(this).val(count);
			var totalWeight = ($('.op_weight').eq(0).html() * count).toString();
			totalWeight = totalWeight.split('.')[1] > 0 ? Number(totalWeight).toFixed(2) : parseInt(totalWeight);
			$('.op_totalweight').html(totalWeight);
			$('.op_amount').html(($('.op_price').eq(0).html() * count).toFixed(2));
			$('.total_money').html((Number($('.op_amount').eq(0).html()) + 100).toFixed(2));
		
		}
	});
	$('.op_count').bind('blur', function(){});
	var userType = 'company';
	var orderType = getUrlParameter('orderType');
	var prePage = orderType ? 'orders_' + orderType : userType + '_home';
	$('.order_box button').click(function(){
		window.location.search = 'page=' + prePage;
	});
	
	$('.view_order').click(function(){
		//判斷跳轉地址
		var url = '../admin/system_' + userType + '.jsp?page=order_detail&orderTpye=purchase&orderId=' + resId;
		window.open(url);
	});
	
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
			console.log($('#pay_type').val(), $('#sel_bank').val(), $('#sel_deadline').val())
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
		postData.creditBankId = 1;
		postData.creditBank = $('#sel_bank').find("option [value='" + $('#sel_bank').val() + "']").html();
		postData.userMark = $('.remark').val();
		
		$.ajax({
			url: DOMAIN + "/addUserOrder",
			type: "POST",
			data: JSON.stringify(postData),
			dataType: 'JSON',
			contentType : "application/json ; charset=utf-8", 
			success: function(res){
				if(res.saved){
//					window.location.href = YJS + '/web/order_success.jsp?orderId=' + res.orderId;
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