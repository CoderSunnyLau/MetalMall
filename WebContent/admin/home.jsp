<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span class="welcome">欢迎来到易金所</span>
</div>
<div class="cnt_body">
	<div class="col col_3" jump="pdts_check">
		<p class="hbox_name">待审核商品</p>
		<p class="hbox_cnt"><b class="ah_pendingApprovedProductCount">--</b> 种</p>
	</div>
	<div class="col col_3" jump="demand_check">
		<p class="hbox_name">待审核需求单</p>
		<p class="hbox_cnt"><b class="ah_pendingApprovedRequirementCount">--</b> 个</p>
	</div>
	<div class="col col_3" jump="finance">
		<p class="hbox_name">待审核金融</p>
		<p class="hbox_cnt"><b class="ah_pendingApprovedFinanceCount">--</b> 笔</p>
	</div>
	<script type="text/javascript">
		sysInit();
		var successCallback = function(){
			$.ajax({
				url: DOMAIN + '/getSystemBackendIndexData',
				type: 'GET',
				success: function(res){
					$('.cnt_body').show();
					var chArr = [];
					for(count in res){
						chArr.push(count);
					}
					doFill(res, chArr, 'ah_');
				}
			});
		}
		$('.col_3').each(function(){
			cntLoad($(this), 'admin');
		});
	</script>
</div>