<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 资信中心 > 企业授信</span>
</div>
<div class="cnt_body admin">
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
					<th width="230">企业名称</th>
					<th>企业区域</th>
					<th>联系电话</th>
					<th>供货笔数</th>
					<!--<th>供货交易额</th>-->
					<th>采购笔数</th>
					<!--<th>采购交易额</th>-->
					<th>银行名称</th>
					<th>授信额度</th>
					<th width="80">状态</th>
				</thead>
				<tbody class="rows credit_list"></tbody>
			</table>
			<jsp:include page="../components/page.jsp"></jsp:include>
		</div>
	</div>
</div>
<script>
	sysInit();
	cntLoad($('[jump="credit_add"]'), 'company');
	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getAllCreditInfo',
			type: 'GET',
			data: {
				pageIndex: getSysUrlParam('pageIndex') || 0,
				pageSize: 20
			},
			success: function(res){
				$('.credit_list').empty();
				if(res.content.length){
					for(var i = 0; i < res.content.length; i++){
						var item = res.content[i];
						var _class = i % 2 == 0 ? '' : 'odd';
						$('.credit_list').append(
							'<tr class="' + _class + 
							'"><td>' + item.companyName +
							'</td><td>' + item.companyArea +
							'</td><td>' + item.phone +
							'</td><td>' + item.companySalesCount +
							'</td><td>' + item.companyBuyCount +
							'</td><td>' + item.bankName +
							'</td><td>' + item.creditAmount +
							'</td><td>' + item.status + '</td></tr>'
						);
					}
				}else{
					noRes($('.credit_list'));
				}
				$('.cnt_body').show();
				pageInit(res.totalPages);
			}
		});
	}
</script>