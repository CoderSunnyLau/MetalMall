<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 金融中心 > 金融管理 > 申请列表</span>
</div>
<div class="cnt_body finance_list">
	<p class="user_title">金融详情</p>
	<div class="fill_block">
		<p><span>名称：</span><i class="bf_name"></i></p>
		<p><span>类型：</span><i class="bf_paymentType"></i></p>
		<p><span>银行：</span><i class="bf_bankName"></i></p>
		<p><span>简介：</span><i class="bf_brief"></i></p>
	</div>
	<div class="finance_order_list">
		<p class="user_title">申请列表</p>
			<table>
				<thead>
					<tr>
						<th>申请企业</th>
						<th>申请人</th>
						<th>联系电话</th>
						<th>申请描述</th>
					</tr>
				</thead>
				<tbody class="rows apply_list"></tbody>
			</table>
	</div>
	<div class="button_block">
		<button class="submit back_finance_btn" jump="finance">返　回</button>
	</div>
</div>
<script>
	sysInit();
	
	var successCallback = function(){}
	var mainData = [
		'name',
		'paymentType',
		'bankName',
		'brief'
	];
	$('.back_finance_btn').click(function(){
		jump('bank', 'finance');
	});
	$.ajax({
		url: DOMAIN + '/getBankProductDetailViewById',
		type: 'GET',
		data: {
			id: getSysUrlParam('financeId')
		},
		success: function(res){
			$('.cnt_body').show();
			doFill(res, mainData, 'bf_');
			$('.apply_list').empty();
			if(res.applicantInfos.length == 0){
				$('.apply_list').append('<tr><td colspan="4">暂无数据</td></tr>');
			}else{
				for(var i = 0; i < res.applicantInfos.length; i++){
					var item = res.applicantInfos[i];
					var _class = i % 2 == 0 ? '' : 'odd';
					var _operation = '';
					$('.apply_list').append(
						'<tr class="' + _class + 
						'"><td>' + item.applicant +
						'</td><td>' + item.applicantCompanyName +
						'</td><td>' + item.phone +
						'</td><td>' + item.description + '</td></tr>'
					);
				}
			}
		}
	});
</script>