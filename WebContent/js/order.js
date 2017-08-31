$(function(){
	$.get('order.json',function(res){
		console.log(res);
		$('.seller_name').html(res.productSellerInfo.username);
		//材質
		//規格
		//件重
		$('.total_weight').html(res.totleWeight);
		//$('.pdt_price').html(res.);
		$('.pdt_amount').html(res.amount);
		$('.buyer_name').html(res.buyerInfo.username + "　|　电话：" + res.buyerInfo.phone);
		$('.pay_type').html(res.paymentType);
		$('.bank_name').html(res.creditBank);
		$('.selected_time').html(res.paymentDeadline);
		//银行授信
	});
});