sysInit();
if($.cookie('sb')){
	var _operation,
		_method,
		_type,
		_param = {
		'pageIndex': getSysUrlParam('pageIndex') || 0,
		'pageSize': 20
	}
	if($('.cnt_body').hasClass('order_supply')){
		_param.companyId = $.cookie('userId');
		_method = '/getPagedUserOrderByProductCompanyId';
		_type = 'supply';
	}else if($('.cnt_body').hasClass('order_purchase')){
		_param.userId = $.cookie('userId');
		_method = '/getPagedUserOrderByUserId';
		_type = 'purchase';
	}

	$.ajax({
		url: DOMAIN + _method,
		type: 'GET',
		data: _param,
		success: function(res){
			for(var i = 0; i < res.content.length; i++){
				var order = res.content[i];
				console.log(order)
				var _class = i % 2 == 0 ? '' : 'odd';
				if(order.status == '已下单'){
					_operation = _type == 'supply' ? '<a class="op confirm">确认</a>|<a class="op cancel">取消</a>|' : '<a class="op cancel">取消</a>|';
				}else if(order.status == '已授信'){
					_operation = _type == 'supply' ? '<a class="op order_send">发货</a>|' : '';
				}else if(order.status == '已发货'){
					_operation = _type == 'supply' ? '' : '<a class="op recieve">收货</a>|';
				}else{
					_operation = '';
				}
				$('.orders').append(
					'<tr class="' + _class + 
					'"><td>' + order.id + 
					'</td><td>' + order.productName +
					'</td><td>' + order.productType +
					'</td><td>' + order.buyerCompanyName +
					'</td><td>' + order.status +
					'</td><td>' + order.unitPrice +
					'</td><td>' + order.quantity +
					'</td><td>' + (order.amount - order.serviceCharge) +
					'</td><td>' + order.serviceCharge +
					'</td><td class="order_money">￥' + order.amount +
					'</td><td orderId="' + order.id + '">' + _operation + '<a class="op view" jump="order_detail">详情</a></td></tr>'
				);
			}
			$('.cnt_body').show();
			pageInit(res.totalPages);
		}
	});
	
	$('.orders').on('click', '.op', function(){
		if($(this).hasClass('view')){
			jump('company',{
				page: 'order_detail',
				orderType: _type,
				orderId: $(this).parent().attr('orderId')
			});
		}else{
			var _opParam = {
				orderId: $(this).parent().attr('orderId')
			},
			_op,
			_msg;
			if($(this).hasClass('cancel')){
				_op = '/cancelOrder'
				_opParam.userName = $('.user_name').html();
				_msg = '订单已取消';
			}else if($(this).hasClass('confirm')){
				_op = '/confirmOrder'
				_msg = '订单已确认';
			}else if($(this).hasClass('order_send')){
				_op = '/sendOrderProductConfirm'
				_msg = '发货成功';
			}else if($(this).hasClass('recieve')){
				_op = '/receiveOrderProductConfirm';
				_msg = '确认收货成功';
			}
			$.ajax({
				url: DOMAIN + _op,
				type: 'POST',
				dataType: 'json',
				data: _opParam,
				success: function(res){
					alert(_msg);
					reload('company');
				}
			});
		}
	});
}else{
	alert('您的登录信息已过期，请重新登录。');
}