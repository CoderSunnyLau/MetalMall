<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 金融中心 > 支付方式</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="payment_list">
			<table>
				<thead>
					<tr>
						<th>银行名称</th>
						<th>支付方式</th>
						<th>支付期限</th>
					</tr>
				</thead>
				<tbody class="rows pay_types"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	sysInit();
	$.ajax({
		url: DOMAIN + '/getAllBankInstallments',
		type: 'GET',
		data: {
			pageIndex: getUrlParameter('pageIndex') || 0,
			pageSize: 20
		},
		success: function(res){
			$('.cnt_body').show();
			$('.pay_types').empty();
			for(var i = 0; i < res.content.length; i++){
				var item = res.content[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				$('.pay_types').append(
					'<tr class="' + _class + 
					'"><td>' + item.bankName +
					'</td><td>' + item.paymentType +
					'</td><td>' + item.paymentDeadlineEnum +
					'</td></tr>'
				);
			}
			pageInit(res.totalPages);
		}
	});
</script>