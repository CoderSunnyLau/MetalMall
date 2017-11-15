<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>欢迎来到易金所！</span>
</div>
<div class="cnt_body c">
	<div class="col col_4 my_credit jump" jump="credit">
		<p class="hbox_name">我的授信</p>
		<p class="col_long hbox_cnt ch_creditAmountByCompanyId">--</p>
		<p class="hbox_unit">（单位：万元）</p>
	</div>
	<div class="col_4">
		<div class="col jump" jump="orders_supply">
			<p class="hbox_name">我的供货</p>
			<p class="hbox_cnt ch_supplyTradeAmount">--</p>
			<p class="hbox_unit">（单位：万元）</p>
		</div>
		<div class="col jump" jump="orders_purchase">
			<p class="hbox_name">待确认订单</p>
			<p class="hbox_cnt ch_pendingCheckOrderCount">--</p>
			<p class="hbox_unit">（单位：笔）</p>
		</div>
	</div>
	<div class="col_4">
		<div class="col jump" jump="orders_purchase">
			<p class="hbox_name">我的收货</p>
			<p class="hbox_cnt ch_buyingTradeAmount">--</p>
			<p class="hbox_unit">（单位：万元）</p>
		</div>
		<div class="col jump" jump="orders_supply">
			<p class="hbox_name">待发货订单</p>
			<p class="hbox_cnt ch_pendingSendOrderCount">--</p>
			<p class="hbox_unit">（单位：笔）</p>
		</div>
	</div>
	<div class="col_4">
		<div class="col jump" jump="orders_purchase">
			<p class="hbox_name">待签收订单</p>
			<p class="hbox_cnt ch_pendingRcvOrderCount">--</p>
			<p class="hbox_unit">（单位：笔）</p>
		</div>
		<div class="col jump" jump="demand">
			<p class="hbox_name">待处理需求</p>
			<p class="hbox_cnt ch_pendingSupplyReqCount">--</p>
			<p class="hbox_unit">（单位：笔）</p>
		</div>
	</div>
	<script type="text/javascript">
		sysInit();
		var successCallback = function(){
			$.ajax({
				url: DOMAIN + '/getCompanyBackendIndexData',
				type: 'GET',
				data: {
					companyId: USER.id
				},
				success: function(res){
					$('.cnt_body').show();
					res.buyingTradeAmount = parseInt(res.buyingTradeAmount/10000);
					res.creditAmountByCompanyId = parseInt(res.creditAmountByCompanyId/10000);
					res.supplyTradeAmount = parseInt(res.supplyTradeAmount/10000);
					var chArr = [];
					for(count in res){
						chArr.push(count);
					}
					doFill(res, chArr, 'ch_');
				}
			});
		}
		$('.jump').each(function(){
			cntLoad($(this), 'company');
		});
	</script>
</div>