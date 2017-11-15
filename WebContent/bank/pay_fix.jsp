<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">

<div class="cnt_header">
	<span>首页 > 金融中心 > 分期管理 > 修改分期</span>
</div>
<div class="cnt_body">
	<p class="user_title">修改分期支付方式</p>
	<div class="fill_block">
		<p><span>银行</span><i class="user_name"></i></p>
		<p><span>支付类型</span>
			<select class="sel_type">
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
	<div class="fill_block pdts_state">
		<ul>
			<li><span>新增人：</span><i class="bp_whoAdd username"></i><span>新增时间：</span><i class="bp_stringAddTime"></i></li>
			<li><span>修改人：</span><i class="bp_whoEdit username"></i><span>修改时间：</span><i class="bp_stringEditTime"></i></li>
		</ul>
	</div>
	<div class="button_block pay_add_btn">
		<button class="submit">提　交</button>
	</div>
</div>
<script>
	sysInit();
	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getOneInstallmentDetail',
			type: 'GET',
			data: {
				installmentId: getSysUrlParam('installmentId')
			},
			success: function(res){
				$('.cnt_body').show();
				$('.sel_type').val(res.paymentType);
				var deadlineArr = res.paymentDeadlineEnum.split(',');
				for(var i = 0; i < deadlineArr.length; i++){
					$('[value=' + deadlineArr[i] + ']').attr('checked', true);
				}
				doFill(res,['whoAdd', 'whoEdit', 'stringAddTime','stringEditTime'], 'bp_');
			},
			error: function(res){
				console.log(res)
			}
		});
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
			if(_checked){
				var postData = {
					"id": getSysUrlParam('installmentId'),   
					"bankId": USER.id,
					"paymentType": $('.sel_type').val(),
					"paymentDeadlineEnum": _deadline.join(',')
				}
				$.ajax({
					url: DOMAIN + '/editBankInstallment',
					type: 'POST',
					data: JSON.stringify(postData),
					dataType: 'JSON',
					contentType: "application/json ; charset=utf-8",
					success: function(res){
						if(res.saved){
							alert('修改成功！');
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