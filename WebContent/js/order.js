$(function(){
	var data = {};
	var doFill = function(arr){
		for(var i = 0; i < arr.length; i++){
			var obj = arr[i];
			if(typeof(obj) == 'string'){
				$('.os_' + obj).html(data[obj]);
			}else if(typeof(obj) == 'object'){
				if(obj.length == 4){
					var fill_cnt = data[obj[1]] + data[obj[2]];
				}else{
					var fill_cnt = data[obj[1]][obj[2]];
				}
				$('.' + obj[0]).html(fill_cnt);
			}
		}
	}

	var getUrlParameter = function(param){
	     var reg = new RegExp("(^|&)"+ param +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r != null)
	    	 return  unescape(r[2]);
	     return null;
	}
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
		['buyer_phone','buyerInfo','phone']
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
	$.get('../js/order.json',function(res){
		data = res;
		doFill(orderParam);
		//银行授信
	});

	var userType = 'company';
	var orderType = getUrlParameter('orderType');
	var prePage = orderType ? 'orders_' + orderType : userType + '_home';
	$('.order_box button').click(function(){
		window.location.search = 'page=' + prePage;
	});
	
	$('.view_order').click(function(){
		//判斷跳轉地址
		var url = '../admin/system_' + userType + '.jsp?page=order_detail&orderTpye=purchase&orderId=' + data.id;
		window.open(url);
	});
});