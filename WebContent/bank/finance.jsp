<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 金融中心 > 金融管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="finance_add">新增</button></div>
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th>金融名称</th>
						<th>银行</th>
						<th>类型</th>
						<th>申请数</th>
						<th>状态</th>
						<th>日期</th>
						<th class="operation" style="width:120px;">操作</th>
					</tr>
				</thead>
				<tbody class="rows finance_list"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
sysInit();
cntLoad($('.add_btn [jump="finance_add"]'), 'bank');

var successCallback = function(){
	$.ajax({
		url: DOMAIN + '/getBankProductsByBankIdOnBackend',
		type: 'GET',
		data: {
			pageIndex: getSysUrlParam('pageIndex') || 0,
			pageSize: 20,
			bankId: USER.id
		},
		success: function(res){
			$('.cnt_body').show();
			$('.finance_list').empty();
			for(var i = 0; i < res.content.length; i++){
				var item = res.content[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				var _operation = item.status == '未审核' ? '|<a class="op to_fix" jump="finance_fix">修改</a>' : '';
				$('.finance_list').append(
					'<tr class="' + _class + 
					'"><td>' + item.name +
					'</td><td>' + item.bankName +
					'</td><td>' + item.paymentType +
					'</td><td>' + item.applicantCount +
					'</td><td>' + item.status +
					'</td><td>' + item.addTime +
					'</td><td financeId="' + item.id + '"><a class="op view" jump="finance_list">申请列表</a>|<a class="op delete">删除</a>' + _operation + '</td></tr>'
				);
			}
			$('.finance_list').off();
			$('.finance_list').on('click', '.op', function(){
				var financeId = $(this).parent().attr('financeId');
				if($(this).hasClass('view')){
					jump('bank', {
						page: 'finance_list',
						financeId: financeId
					});
				}else if($(this).hasClass('to_fix')){
					jump('bank', {
						page: 'finance_fix',
						financeId: financeId
					});
				}else if($(this).hasClass('delete')){
					$.ajax({
						url: DOMAIN + '/deleteBankProduct',
						type: 'POST',
						data: {productId: financeId},
						dataType: 'JSON',
						success: function(res){
							if(res.deleted){
								alert('删除成功！');
								reload('bank');
							}else{
								alert('删除失败。');
							}
						}
					});
				}
			});
			pageInit(res.totalPages);
		}
	});
}
</script>