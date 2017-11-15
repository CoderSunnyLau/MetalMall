sysInit();

if($.cookie('sb')){
	$.ajax({
		url: DOMAIN + '/getAllUserOrderByPage',
		type: 'GET',
		data: {
			'pageIndex': getSysUrlParam('pageIndex') || 0,
			'pageSize': 20
		},
		success: function(res){
			$('.cnt_body').show();
			$('.orders').empty();
			for(var i = 0; i < res.content.length; i++){
				var order = res.content[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				$('.orders').append(
					'<tr class="' + _class + 
					'"><td>' + order.id + 
					'</td><td>' + order.productName +
					'</td><td>' + order.productType +
					'</td><td>' + order.sellerCompanyName +
					'</td><td>' + order.status +
					'</td><td>￥' + order.unitPrice +
					'</td><td>' + order.quantity +
					'</td><td>￥' + (order.amount - order.serviceCharge) +
					'</td><td>￥' + order.serviceCharge +
					'</td><td class="order_money">￥' + order.amount +
					'</td><td orderId="' + order.id + '"><a class="op view" jump="order_detail">详情</a></td></tr>'
				);
			}
			pageInit(res.totalPages);
		}
	});
	$('.orders').off();
	$('.orders').on('click', '.op', function(){
		if($(this).hasClass('view')){
			jump('admin', {
				page: 'order_detail',
				orderId: $(this).parent().attr('orderId')
			});
		}
	});
}else{
	alert('您的登录信息已过期，请重新登录。');
}