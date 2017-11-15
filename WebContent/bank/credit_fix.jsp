<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 资信中心 > 企业授信 > 修改企业授信</span>
</div>
<div class="cnt_body">
	<p class="user_title">修改企业授信</p>
	<div class="fill_block">
		<p><span>银行</span><i class="bc_bankName"></i></p>
		<p><span>企业</span><i class="bc_companyName"></i></p>
		<p><span>授信额度</span><input class="bc_creditAmount" type="text" placeholder="请填写授信额度" /></p>
	</div>
	<div class="fill_block pdts_state">
		<ul>
			<li><span>新增人：</span><i class="username bc_whoAdd">--</i><span>新增时间：</span><i class="bc_stringAddTime">--</i></li>
			<li><span>修改人：</span><i class="username bc_whoEdit">--</i><span>修改时间：</span><i class="bc_stringEditTime">--</i></li>
		</ul>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
	</div>
</div>
<script>
	sysInit();
	
	var creditId = getSysUrlParam('creditId');
	$.ajax({
		url: DOMAIN + '/getCreditInfoDetailById',
		type: 'GET',
		data: {
			id: creditId
		},
		success: function(res){
			$('.cnt_body').show();
			doFill(res, [
				'bankName',
				'companyName',
				'whoAdd',
				'whoEdit',
				'stringAddTime',
				'stringEditTime'
			], 'bc_');
			$('.bc_creditAmount').val(res.creditAmount);
		}
	});
	
	$('.submit').click(function(){
		if($('.bc_creditAmount').val()){
			$.ajax({
				url: DOMAIN + '/editCreditByBank',
				type: 'POST',
				data: {
					creditInfoId: creditId,
					creditAmount: $('.bc_creditAmount').val()
				},
				dataType: 'JSON',
				success: function(res){
					if(res.saved){
						alert('修改成功！');
						var _targetUrl = setUrlParameter('page', 'credit', _href);
						_targetUrl = delUrlParam('creditId', _targetUrl);
						$('.cnt').load('../bank/credit.jsp');
						window.location.href = _targetUrl;
					}else{
						alert('操作失败。');
					}
				}
			});
		}else{
			alert('请填写授信额度。');
		}
	});
</script>