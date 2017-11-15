<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 系统管理 > 我的收藏</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="user_title">
			我的收藏
		</div>
		<div class="pdts_list">
			<table>
				<thead>
					<th style="width:20%;">商品名称</th>
					<th>商品类型</th>
					<th>规格</th>
					<th>材质</th>
					<th>库存</th>
					<!-- <th>时间</th> -->
					<th>单价（元）</th>
					<th>操作</th>
				</thead>
				<tbody class="favorite_list rows"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	sysInit();
	
	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getAllCompanyStoredProductsByCompanyId',
			type: 'GET',
			data: {
				id: USER.id,
				pageIndex: getSysUrlParam('pageIndex') || 0,
				pageSize: 40
			},
			success: function(res){
				$('.cnt_body').show();
				console.log(res)
				if(res.totalElements){
					$('.favorite_list').empty();
					for(var i = 0; i < res.content.length; i++){
						var pdt = res.content[i];
						var _class = i % 2 == 0 ? '' : 'odd';
						$('.favorite_list').append(
							'<tr class="' + _class + 
							'"><td>' + pdt.name +
							'</td><td>' + pdt.type +
							'</td><td>' + pdt.specification +
							'</td><td>' + pdt.material +
							'</td><td>' + pdt.stockQuantity +
							'</td><td>' + pdt.price +
							'</td><td pdtId="' + pdt.id + '"><a class="op to_del">删除</a>|<a class="op view" jump="pdt_detail">查看</a></td></tr>'
						);
					}
					$('.favorite_list').off();
					$('.favorite_list').on('click', '.op', function(){
						var pdtId = $(this).parent().attr('pdtId');
						if($(this).hasClass('view')){
							jump('company', {
								page: 'pdt_detail',
								pdtId: pdtId,
								prepage: 'account_favorite'
							});
						}else if($(this).hasClass('to_del')){
							$.ajax({
								url: DOMAIN + '/removeFavoriteProductForCompany',
								type: 'POST',
								data: {
									companyId: USER.id,
									productId: pdtId
								},
								dataType: 'json',
								success: function(res){
									if(res.deleted){
										alert('已取消收藏！');
										reload('company');
									}else{
										alert('操作失败，请重试。');
									}
								}
							});
						}
					});
					pageInit(res.totalPages);
				}else{
					noRes($('.favorite_list'));
				}
			}
		});
	}
</script>