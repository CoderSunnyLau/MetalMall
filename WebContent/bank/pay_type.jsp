<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 金融中心 > 分期管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="pay_add">新增</button></div>
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th>银行名称</th>
						<th>支付方式</th>
						<th>支付期限</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows pay_types"></tbody>
			</table>
		</div>
	</div>
</div>
<script>
	sysInit();
	cntLoad($('.add_btn [jump="pay_add"]'), 'bank');
	
	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getBankInstallmentsDetailByBankId',
			type: 'GET',
			data: {
				bankId: USER.id,
				pageIndex: getUrlParameter('pageIndex') || 0,
				pageSize: 20
			},
			success: function(res){
				$('.cnt_body').show();
				$('.pay_types').empty();
				for(var i = 0; i < res.length; i++){
					var item = res[i];
					var _class = i % 2 == 0 ? '' : 'odd';
					$('.pay_types').append(
						'<tr class="' + _class + 
						'"><td>' + item.bankName +
						'</td><td>' + item.paymentType +
						'</td><td>' + item.paymentDeadlineEnum +
						'</td><td itemId="' + item.id + '"><a class="op edit" jump="pay_fix">修改</a>|<a class="op to_del">删除</a>' +
						'</td></tr>'
					);
				}
				cntLoad($('.edit[jump="pay_fix"]'), 'bank');
				$('.pay_types').on('click', '.op', function(){
					var itemId = $(this).parent().attr('itemId');
					if($(this).hasClass('edit')){
						setUrlParameter('installmentId', itemId);
					}else if($(this).hasClass('to_del')){
						$.ajax({
							url: DOMAIN + '/deleteBankInstallment',
							type: 'POST',
							data: {
								installmentId: itemId
							},
							dataType: 'json',
							success: function(res){
								if(res.deleted){
									alert('操作成功！');
									reload('bank');
								}else{
									alert('操作失败，请重试。');
								}
							}
						});
					}
				});
			}
		});
	}
</script>