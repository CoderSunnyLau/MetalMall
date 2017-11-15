sysInit();
cntLoad($('.bank [jump="credit_add"]'), 'bank');
if($.cookie('sb')){
	var _operation;
	$.ajax({
		url: DOMAIN + '/getPagedUserOrderByCreditBankId',
		type: 'GET',
		data: {
			'bankId': $.cookie('userId'),
			'pageIndex': getSysUrlParam('pageIndex') || 0,
			'pageSize': 20
		},
		success: function(res){
			$('.cnt_body').show();
			$('.orders').empty();
			for(var i = 0; i < res.content.length; i++){
				var order = res.content[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				if(order.status == '已确认'){
					_operation = '<a class="op accept">同意</a>|<a class="op refuse">拒绝</a>|';
				}else{
					_operation = '';
				}
				$('.orders').append(
						'<tr class="' + _class + 
						'"><td>' + order.id + 
						'</td><td>' + order.productName +
						'</td><td>' + order.sellerCompanyName +
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
			pageInit(res.totalPages);
		}
	});
	
	$('.orders').on('click', '.op', function(){
		var orderId = $(this).parent().attr('orderId');
		if($(this).hasClass('view')){
			jump('bank', {
				page: 'order_detail',
				orderId: orderId
			});
		}else{
			if($(this).hasClass('accept')){
				var _status = '已授信';
			}else if($(this).hasClass('refuse')){
				var _status = '拒绝授信';
			}
				$.ajax({
					url: DOMAIN + '/creditOrder',
					type: 'POST',
					dataType: 'json',
					data: {
						'orderId': orderId,
						'creditStatus': _status
					},
					success: function(res){
						alert('操作成功！');
						reload('bank');
					}
				});
		}
	});
}else{
	alert('您的登录信息已过期，请重新登录。');
}