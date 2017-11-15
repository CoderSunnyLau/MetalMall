$.ajax({
	url: DOMAIN + '/getBankProductViewById',
	type: 'GET',
	data: {
		id: getUrlParameter('id')
	},
	success: function(res){
		$('.loading_wrapper').hide();
		$('.loading_success').show();
		var getArr = [];
		for(item in res){
			getArr.push(item);
		}
		doFill(res, getArr, 'f_');
	}
});

$('.toApply').click(function(){
	if($.cookie('sb')){
		var _finished = false;
		var postData = {
			"id":null,
			"bankProductId": getUrlParameter('id'),
			"applicantId":1,
			"contactWho":$('.user_name').html(),
			"phone": getVal('phone'),
			"description": getVal('description'),
			"approval":"N",
			"valid":"Y"
		};
		$('.row_input').each(function(){
			if($(this).find('.field').length && !$(this).find('.field').val()){
				alert('请输入' + $(this).find('span').html());
				_finished = false;
				return false;
			}else{
				_finished = true;
			}
		});
		if(_finished){
			$.ajax({
				url: DOMAIN + '/addBankProductApply',
				type: 'POST',
				data: JSON.stringify(postData),
				dataType: 'JSON',
				contentType: "application/json ; charset=utf-8",
				success: function(res){
					if(res.saved){
						alert('提交成功！');
						window.location.href = _href;
					}else{
						alert('提交失败，请重试。')
					}
				}
			});
		}
	}else{
		alert('您当前尚未登录，请登录后再试。');
	}
});