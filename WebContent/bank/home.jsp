<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>欢迎来到易金所！</span>
</div>
<div class="cnt_body b">
	<div class="col col_2" jump="credit_apply">
		<p class="bank_num org"><b class="bh_applyCount">--</b>个</p>
		<p>订单资信申请</p>
	</div>
	<div class="col col_2 bh2" jump="credit">
		<p class="bank_num bl"><b class="bh_creditedCompanyCount">--</b>个</p>
		<p>已授信企业</p>
	</div>
	<div class="col col_2  bh3" jump="credit">
		<p class="bank_num bl"><b class="bh_creditedAmountByBankId">--</b>万元</p>
		<p>已授信额度</p>
	</div>
	<div class="col col_2 bh4" jump="credit_apply">
		<p class="bank_num org"><b class="bh_finishedOrderAmountByBankId">--</b>万元</p>
		<p>成交订单额</p>
	</div>
</div>
<script>
	sysInit();
	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getBankBackendIndexData',
			type: 'GET',
			data: {
				bankId: USER.id
			},
			success: function(res){
				$('.cnt_body').show();
				res.creditedAmountByBankId = (res.creditedAmountByBankId / 10000).toFixed(2);
				res.finishedOrderAmountByBankId = (res.finishedOrderAmountByBankId / 10000).toFixed(2);
				var chArr = [];
				for(count in res){
					chArr.push(count);
				}
				doFill(res, chArr, 'bh_');
			}
		});
		
	
		$('.col_2').each(function(){
			cntLoad($(this), 'bank');
		});
	}
</script>