$(function(){

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
		'serviceCharge',
		['seller_name','productSellerInfo','username'],
		['os_quantity','quantity','unit', 1],
		['order_total','amount','serviceCharge', 1],
		['buyer_name','buyerInfo','username'],
		['buyer_phone','buyerInfo','phone'],
		['os_creditAmount','buyerInfo','creditAmount']
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
	$.get('../data/order.json',function(res){
		doFill(res, orderParam, 'os_');
		//银行授信
		resId = res.id;
	});

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
});