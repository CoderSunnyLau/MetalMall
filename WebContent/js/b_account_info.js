sysInit();
var getData = {};
$.ajax({
	url: DOMAIN + '/getUserDetailByToken',
	type: 'GET',
	xhrFields:{withCredentials:true},
	dataType:'jsonp',
	jsonp:"callback",
	jsonpCallback:"successjsonpcallback",
	data: {
		sb: $.cookie('sb')
	},
	success: function(res){
		console.log(res)
		getData = res;
		$('.cnt_body').show();
		var resArr = [];
		for(item in res){
			resArr.push(item);
		}
		console.log(res)
		doFill(res, resArr, 'ba_');
	}
});

$('.fix_btn').click(function(){
	if($(this).hasClass('to_fix')){
		$('.disabled').removeAttr('disabled').removeClass('disabled');
		$(this).html('保存').removeClass('to_fix');
	}else if($(this).html() == '保存'){
		$('.fix_field').attr('disabled', 'disabled').addClass('disabled');
		$(this).html('正在保存..').attr('disabled', 'disabled').addClass('sent');
		var fixData = {
			"phone": getVal('phone'),
			"username": getVal('username'),
			"miniName": getVal('miniName'),
			"operatorRealName": getVal('operatorRealName'),
			"uniformCreditCode": getVal('uniformCreditCode'),
			"description": getVal('description')
		}
		var postData = getData;
		var _this = $(this);
		$.extend(postData, fixData);
		$.ajax({
			url: DOMAIN + '/editUserInfo',
			type: 'POST',
			dataType: 'json',
			data: JSON.stringify(postData),
			contentType: "application/json ; charset=utf-8",
			success: function(res){
				if(res.saved){
					alert('修改成功！');
					_this.html('修改银行信息').removeClass('sent').removeAttr('disabled').addClass('to_fix');
					$('.ca_operatorRealName').eq(0).html(postData.operatorRealName);
				}else{
					alert('保存失败，请重试。');
				}
			}
		});
	}
});