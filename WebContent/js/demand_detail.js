var _param = [
    'name',
    'addTime',
    'companyName',
    'productType',
    'quantityReqrm',
    'area',
    'material',
    'specification',
    'minBudget',
    'maxBudget',
    'description'
];

var successCallback = function(){
	$('.da_company').html(USER.userName);
	$('.field[name="contactWho"]').val(USER.optsName);
	$('.field[name="phone"]').val(USER.phone);
}

var errorCallback = function(){
}

$.ajax({
	url: DOMAIN + '/getReqForm',
	type: 'GET',
	data: {
		id: getUrlParameter('id')
	},
	success: function(res){
		$('.loading_wrapper').hide();
		$('.demand_detail').show();
		doFill(res, _param, 'd_');
	}
});

var doSupply = function(){
	var postData = {
		"id": null,
		"formId": getUrlParameter('id'),
		"supplierId": USER.id,
		"contactWho": getVal('contactWho'),
		"phone": getVal('phone'),
		"description": getVal('description'),
		"beSelected": "N",
		"valid": "Y"
	}
	var _finished = false;
	$('.field').each(function(){
		if($(this).val() == ""){
			alert('请填写' + $(this).attr('tip'));
			_finished = false;
			return false;
		}else{
			_finished = true;
		}
	});
	var _phone = $('.field[name="phone"]').val();
	if(_phone.substr(0, 1) != '1' || _phone.indexOf('.') > -1 || _phone.length != 11){
		alert('您输入的手机号有误，请重新输入。')
		_finished = false;
	}
	if(_finished){
		$.ajax({
			url: DOMAIN + '/addReqFormSupplier',
			type: 'POST',
			dataType: 'json',
			contentType : "application/json ; charset=utf-8", 
			data: JSON.stringify(postData),
			success: function(res){
				if(res.saved){
					alert('已提交供货申请！');
					window.location.href = _href;
				}
			}
		});
	}
}

$('.offer').click(function(){
	if(USERNAME){
		doSupply();
	}else{
		alert('您当前尚未登录，即将跳转到登录页。');
		window.location.href = YJS + "/web/login.jsp?target=" + window.location.href;
	}
});