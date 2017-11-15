<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 供货中心 > 商品审核</span>
</div>
<div class="cnt_body pdt_check">
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
					<th style="width:20%;">商品名称</th>
					<th>商品类型</th>
					<th>规格</th>
					<th>材质</th>
					<th>库存</th>
					<th>当前状态</th>
					<th style="width:120px;">时间</th>
					<th>成交笔数</th>
					<th>操作</th>
				</thead>
				<tbody class="pdts_check rows"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
sysInit();
var _method = '/getAllPendingProductsByPageOnBackend',
	_operation = '<a class="pass op">通过</a>|<a class="refuse op">打回</a>';
	
$('.pdts_check').off();
$('.pdts_check').on('click', '.op', function(){
	var pdtId = $(this).parent().attr('pdtId');
	if($(this).hasClass('pass') || $(this).hasClass('refuse')){
		if($(this).hasClass('pass')){
			var _status = '已审核';
		}else{
			var _status = '审核打回';
		}
		$.ajax({
			url: DOMAIN + '/changeProductStatus',
			type: 'POST',
			dataType: 'json',
			data: {
				productId: pdtId,
				status: _status
			},
			success: function(res){
				if(res.success){
					alert('操作成功！');
					reload('admin');
				}
			}
		});
	}else if($(this).hasClass('view')){
		jump('admin', {
			page: 'pdt_detail',
			pdtId: pdtId
		});
	}
});

$.ajax({
	url: DOMAIN + _method,
	type: 'GET',
	data: {
		'pageIndex': getSysUrlParam('pageIndex') || 0,
		'pageSize': 20
	},
	success: function(res){
		$('.pdts_check').empty();
		if(res.content.length){
			for(var i = 0; i < res.content.length; i++){
				var pdt = res.content[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				var _operation2 = pdt.status == '已审核' ? '|<a class="refuse op">打回</a>' : '';
				$('.pdts_check').append(
					'<tr class="' + _class + 
					'"><td class="pdt_name">' + pdt.name + 
					'</td><td>' + pdt.type +
					'</td><td>' + pdt.specification +
					'</td><td>' + pdt.material +
					'</td><td>' + pdt.stockQuantity +
					'</td><td>' + pdt.status +
					'</td><td>' + pdt.addTime +
					'</td><td>' + pdt.salesCount +
					'</td><td pdtId="' + pdt.id + '">' + _operation + _operation2 + '</td></tr>'
				);
			}
		}else{
			noRes($('.pdts_check'));
		}
		$('.cnt_body').show();
		pageInit(res.totalPages);
	}
});
</script>