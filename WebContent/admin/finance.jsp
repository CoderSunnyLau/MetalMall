<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 金融中心 > 金融管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="pdts_list">
			<table>
				<thead>
					<th>金融名称</th>
					<th>银行</th>
					<th>类型</th>
					<th>申请数</th>
					<th>状态</th>
					<th>日期</th>
					<th style="width:125px;">操作</th>
				</thead>
				<tbody class="rows finance_list"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	sysInit();
	$.ajax({
		url: DOMAIN + '/getBankProductsByPageOnBackend',
		type: 'GET',
		data: {
			pageIndex: getSysUrlParam('pageIndex') || 0,
			pageSize: 20
		},
		success: function(res){
			$('.cnt_body').show();
			$('.finance_list').empty();
			for(var i = 0; i < res.content.length; i++){
				var item = res.content[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				var _operation = item.status == '未审核' ? '|<a class="pass op">同意</a>|<a class="refuse op">拒绝</a>' : '';
				$('.finance_list').append(
					'<tr class="' + _class + 
					'"><td>' + item.name +
					'</td><td>' + item.bankName +
					'</td><td>' + item.paymentType +
					'</td><td>' + item.applicantCount +
					'</td><td>' + item.status +
					'</td><td>' + item.addTime +
					'</td><td financeId="' + item.id + '"><a class="op view" jump="finance_list">申请列表</a>' + _operation + '</td></tr>'
				);
			}
			$('.finance_list').off();
			$('.finance_list').on('click', '.op', function(){
				var financeId = $(this).parent().attr('financeId');
				if($(this).hasClass('view')){
					setUrlParameter('financeId', financeId);
				}else if($(this).hasClass('pass')){
					changeFinanceStatus('Y', financeId);
				}else if($(this).hasClass('refuse')){
					changeFinanceStatus('R', financeId);
				}
			});
			cntLoad($('.view[jump="finance_list"]'), 'admin');
			var changeFinanceStatus = function(status, financeId){
				$.ajax({
					url: DOMAIN + '/approveBankProduct',
					type: 'POST',
					data: {
						productId: financeId,
						status: status
					},
					dataType: 'json',
					success: function(res){
						console.log(res);
						console.log(res.success);
						if(res.success){
							alert('操作成功！');
							reload('admin');
						}else{
							alert('操作失败。');
						}
					},
					error: function(res){
						console.log(res)
					}
				});
			}
			pageInit(res.totalPages);
		}
	});
</script>