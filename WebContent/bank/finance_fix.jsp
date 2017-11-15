<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 金融中心 > 金融管理 > 修改金融</span>
</div>
<div class="cnt_body cnt_finance_add">
	<p class="user_title">修改金融详情信息</p>
	<div class="fill_block">
		<p><span>名称</span><input class="field" name="name" type="text" placeholder="请输入金融产品名称"/></p>
		<p><span>类型</span>
			<select class="field" name="paymentType" id="payment_type">
				<option value="">请选择类型</option>
			</select>
		</p>
		<p><span>银行</span><i class="" name="bank"></i></p>
		<p><span>产品简介</span><textarea class="field" name="brief" placeholder="请输入金融产品的简介，300字内。" type="text" maxlength="300"></textarea></p>
	</div>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>金融介绍</span>
			<div class="field"><jsp:include page="../components/ueditor.jsp"></jsp:include></div>
		</div>
	</div>
	<div class="fill_block pdts_state">
		<p><span>审核状态</span><i class="bf_status"></i></p>
		<ul>
			<li><span>新增人：</span><i class="username bf_whoAdd">--</i><span>新增时间：</span><i class="bf_addTime">--</i></li>
			<li><span>修改人：</span><i class="username bf_whoEdit">--</i><span>修改时间：</span><i class="bf_editTime">--</i></li>
		</ul>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
	</div>
</div>
<script>
sysInit();
var successCallback = function(){
	var financeId = getSysUrlParam('financeId');
	var getData = {};
	$.ajax({
		url: DOMAIN + '/getBankInstallmentsByBankId',
		type: 'GET',
		data: {bankId: USER.id},
		success: function(res){
			var optionArr = [];
			getData = res;
			$('#payment_type').html('<option value="">请选择类型</option>');
			for(var i = 0; i < res.length; i++){
				optionArr.push(res[i].paymentType);
			}
			$('[name="bank"]').html(USER.userName);
			optionConfigInit('payment_type', optionArr);
			fillCallback();
		}
	});
	var fillCallback = function(){
		$.ajax({
			url: DOMAIN + '/getPendingEditBankProductById',
			type: 'GET',
			data: {id: financeId},
			success: function(r){
				var res = r.bankProductInfo;
				$('.field').each(function(){
					$(this).val(res[$(this).attr('name')]);
				});
				UE.getEditor('editor').setContent(res.introduction, false);
				$('.cnt_body').show();
				doFill(res, [
					'whoAdd',
					'whoEdit',
					'addTime',
					'editTime',
					'status'
				], 'bf_');
			}
		});
	}
	$('.cnt_finance_add .submit').off();
	$('.cnt_finance_add .submit').on('click', function(){
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
				"id": financeId,
				"name":getVal('name'),
				"bankId":USER.id,
				"brief":getVal('brief'),
				"introduction":UE.getEditor('editor').getContent(),
				"paymentType":getVal('paymentType'),
				"paymentDeadlineEnum":pde
			};
			$.ajax({
				url: DOMAIN + '/editBankProduct',
				type: 'POST',
				data: JSON.stringify(postData),
				dataType: 'JSON',
				contentType: "application/json ; charset=utf-8",
				success: function(res){
					if(res.saved){
						alert('修改成功！');
						jump('bank', 'finance');
					}else{
						alert('提交失败，请重试。');
						$('.submit').removeClass('sent').html('提 交').removeAttr('disabled');
					}
				}
			});
		}
	});
}
</script>