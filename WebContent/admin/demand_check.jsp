<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 需求中心 > 需求单管理</span>
</div>
<div class="cnt_body demand_check">
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
						<th>名称</th>
						<th>商品类型</th>
						<th>规格</th>
						<th>材质</th>
						<th>需求数量</th>
						<th>预算</th>
						<th>时间</th>
						<th>审核状态</th>
						<th>处理状态</th>
						<th>申请数</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows demands"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	sysInit();

	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getAllReqFormsByPageOnBackend',
			type: 'GET',
			data: {
				'pageIndex': getSysUrlParam('pageIndex') || 0,
				'pageSize': 20
			},
			success: function(res){
				$('.cnt_body').show();
				$('.demands').empty();
				for(var i = 0; i < res.content.length; i++){
					var demand = res.content[i];
					if(demand.approval != '待审核'){
						return false;
					}
					var _class = i % 2 == 0 ? '' : 'odd';
					var _operation = demand.approval == '待审核' ? '<a class="op pass">通过</a>|' : '';
					$('.demands').append(
						'<tr class="' + _class + 
						'"><td>' + demand.name + 
						'</td><td>' + demand.productType +
						'</td><td>' + demand.specification +
						'</td><td>' + demand.material +
						'</td><td>' + demand.quantityReqrm +
						'</td><td>' + demand.minBudget + '~' + demand.maxBudget +
						'</td><td>' + demand.addTime +
						'</td><td>' + demand.approval +
						'</td><td>' + demand.status +
						'</td><td>' + demand.applicantCount +
						'</td><td demandId="' + demand.id + '">' + _operation + '<a class="op view" jump="demand_detail">详情</a></td></tr>'
					);
				}
				pageInit(res.totalPages);
			}
		});
		
		$('.demands').on('click', '.op', function(){
			var demandId = $(this).parent().attr('demandId');
			if($(this).hasClass('pass')){
				$.ajax({
					url: DOMAIN + '/approvalRequirementForm',
					data: {'formId': parseInt(demandId)},
					type:'POST',
					dataType: 'json',
					success: function(res){
						console.log(res)
						if(res.success){
							alert('操作成功！');
							reload('admin');
						}
					}
				});
			}else if($(this).hasClass('view')){
				jump('admin', {
					page: 'demand_detail',
					demandId: demandId,
					prepage: 'demand_check'
				});
			}
		});
	}
</script>