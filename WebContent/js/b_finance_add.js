sysInit();
var successCallback = function(){
	var getData = {};
	$.ajax({
		url: DOMAIN + '/getBankInstallmentsByBankId',
		type: 'GET',
		data: {bankId: USER.id},
		success: function(res){
			var optionArr = [];
			getData = res;
			$('.cnt_body').show();
			$('#payment_type').html('<option value="">请选择类型</option>');
			for(var i = 0; i < res.length; i++){
				optionArr.push(res[i].paymentType);
			}
			$('[name="bank"]').html(USER.userName);
			optionConfigInit('payment_type', optionArr);
		}
	});
	$('.cnt_finance_add .submit').click(function(){
		var _finished;
		$('.field').each(function(){
			if($(this).is('div') && !UE.getEditor('editor').getContent()){
					_finished = false;
					alert('请填写金融介绍');
					return false;
				}else if(!$(this).is('div') && !$(this).val()){
					_finished = false;
					alert('请填写' + $(this).parent().find('span').html());
					return false;
				}else{
					_finished = true;
				}
		});
		if(_finished){
			$('.submit').addClass('sent').html('正在提交...').attr('disabled');
			var pde;
			for(var i = 0; i < getData.length; i++){
				if(getData[i].paymentType == getVal('paymentType')){
					pde = getData[i].paymentDeadlineEnum;
					break;
				}
			}
			var postData = {
				"id":null,
				"name":getVal('name'),
				"bankId":USER.id,
				"brief":getVal('brief'),
				"introduction":UE.getEditor('editor').getContent(),
				"paymentType":getVal('paymentType'),
				"paymentDeadlineEnum":pde
			};
			$.ajax({
				url: DOMAIN + '/addBankProduct',
				type: 'POST',
				data: JSON.stringify(postData),
				dataType: 'JSON',
				contentType: "application/json ; charset=utf-8",
				success: function(res){
					if(res.saved){
						alert('新增成功！');
						jump('bank', 'finance');
					}else{
						alert('新增失败，请重试。');
						$('.submit').removeClass('sent').html('提 交').removeAttr('disabled');
					}
				}
			});
		}
	});
}