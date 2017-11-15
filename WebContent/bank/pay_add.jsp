<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 金融中心 > 分期管理 > 新增分期</span>
</div>
<div class="cnt_body">
	<p class="user_title">新增分期支付方式</p>
	<div class="fill_block">
		<p><span>银行</span><i class="user_name"></i></p>
		<p><span>支付类型</span>
			<select class="sel_type">
				<option value="">请选择支付类型</option>
				<option value="白条分期">白条分期</option>
				<option value="应收票据">应收票据</option>
				<option value="反向保理">反向保理</option>
			</select>
		</p>
		<p><span>支付期限</span>
			<span class="sel_deadline">
				<input type="checkbox" name="deadline" value="2周"><i>2周</i>
				<input type="checkbox" name="deadline" value="1个月"><i>1个月</i>
				<input type="checkbox" name="deadline" value="3个月"><i>3个月</i>
				<input type="checkbox" name="deadline" value="6个月"><i>6个月</i>
			</span>
		</p>
	</div>
	<div class="button_block pay_add_btn">
		<button class="submit">提　交</button>
	</div>
</div>
<script>
	sysInit();
	
	var successCallback = function(){
		$('.bank_name').html(USER.userName);
		$('.cnt_body').show();
		$('.submit').unbind();
		$('.submit').bind('click', function(){
			var _checked = false;
			var _deadline = [];
			$('[name="deadline"]').each(function(){
				if($(this).is(':checked')){
					_checked = true;
					_deadline.push($(this).val());
				}
			});
			alert(_checked)
			if(!$('.sel_type').val()){
				alert('请选择支付类型');
			}else if(_checked){
				var postData = {
					"id": getSysUrlParam('installmentId'),   
					"bankId": USER.id,
					"paymentType": $('.sel_type').val(),
					"paymentDeadlineEnum": _deadline.join(',')
				}
				$.ajax({
					url: DOMAIN + '/addBankInstallment',
					type: 'POST',
					data: JSON.stringify(postData),
					dataType: 'JSON',
					contentType: "application/json ; charset=utf-8",
					success: function(res){
						if(res.saved){
							alert('新增成功！');
							reload('bank');
						}else{
							alert('提交失败。');
						}
					}
				});
			}else{
				alert('请选择支付期限');
			}
		});
	}
</script>