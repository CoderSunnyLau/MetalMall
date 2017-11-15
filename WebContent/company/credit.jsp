<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 资信中心 > 我的授信</span>
</div>
<div class="cnt_body company">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="credit_add">申请授信</button></div>
		</div>
		<div class="pdts_list">
			<table>
				<thead>
					<th style="width:220px;">企业名称</th>
					<th>企业区域</th>
					<!-- <th>联系电话</th> -->
					<th>供货笔数</th>
					<!-- <th>供货交易额</th> -->
					<th>采购笔数</th>
					<!-- <th>采购交易额</th> -->
					<th>银行名称</th>
					<th>授信额度（万元）</th>
					<th>状态</th>
				</thead>
				<tbody class="rows credit_list"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	sysInit();
	cntLoad($('[jump="credit_add"]'), 'company');
	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getCreditInfoByCompanyId',
			type: 'GET',
			data: {
				id: USER.id,
				pageIndex: getSysUrlParam('pageIndex') || 0,
				pageSize: 10
			},
			success: function(res){
				$('.cnt_body').show();
				$('.credit_list').empty();
				if(res.totalElements){
					for(var i = 0; i < res.content.length; i++){
						var item = res.content[i];
						var _class = i % 2 == 0 ? '' : 'odd';
						$('.credit_list').append(
							'<tr class="' + _class + 
							'"><td>' + item.companyName +
							'</td><td>' + item.companyArea +
							'</td><td>' + item.companySalesCount +
							'</td><td>' + item.companyBuyCount +
							'</td><td>' + item.bankName +
							'</td><td>' + (item.creditAmount / 10000).toFixed(2) +
							'</td><td>' + item.status + '</td></tr>'
						);
					}
					pageInit(res.totalPages);
				}else{
					$('.credit_list').append('<tr><td><div class="no_info">您尚未经过银行授信</div></td></tr>');
					$('.page_box').hide();
				}
			}
		});
	}
</script>