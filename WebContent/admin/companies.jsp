<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 企业中心 > 企业管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th style="width:26%;">企业名称</th>
						<th>企业区域</th>
						<th>联系电话</th>
						<th>商品数</th>
						<th>需求数</th>
						<th>供货笔数</th>
						<!-- <th>供货交易额</th> -->
						<th>采购笔数</th>
						<!-- <th>采购交易额</th> -->
						<th>登录次数</th>
						<th  style="width:125px;">最近登录</th>
					</tr>
				</thead>
				<tbody class="rows company_list"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	sysInit();
	$.ajax({
		url: DOMAIN + '/getAllCompanyUsersDetailInfo',
		type: 'GET',
		data: {
			pageIndex: getSysUrlParam('pageIndex') || 0,
			pageSize: 20
		},
		success: function(res){
			$('.cnt_body').show();
			$('.company_list').empty();
			for(var i = 0; i < res.content.length; i++){
				var item = res.content[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				$('.company_list').append(
					'<tr class="' + _class + 
					'"><td>' + item.username +
					'</td><td>' + item.area +
					'</td><td>' + item.phone +
					'</td><td>' + item.productCount +
					'</td><td>' + item.reqFormCount +
					'</td><td>' + item.sellOrderCount +
					'</td><td>' + item.buyOrderCount +
					'</td><td>' + item.loginCount +
					'</td><td>' + item.stringLatestLoginTime + '</td></tr>'
				);
			}
			$('.company_list').off();
			$('.company_list').on('click', '.op', function(){
				var financeId = $(this).parent().attr('financeId');
				if($(this).hasClass('view')){
					jump('admin', {
						page: 'finance_list',
						financeId: financeId
					});
				}else if($(this).hasClass('pass')){
					changeFinanceStatus('Y', financeId);
				}else if($(this).hasClass('refuse')){
					changeFinanceStatus('R', financeId);
				}
			});
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