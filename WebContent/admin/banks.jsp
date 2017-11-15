<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 金融中心 > 银行管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="bank_add">新 增</button></div>
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
						<th>联系电话</th>
						<th>总授信</th>
						<th>最近登录</th>
					</tr>
				</thead>
				<tbody class="rows bank_list"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	cntLoad($('.add_btn [jump="bank_add"]'));
	sysInit();
	$.ajax({
		url: DOMAIN + '/getAllBankUsers',
		type: 'GET',
		data: {
			pageIndex: getSysUrlParam('pageIndex') || 0,
			pageSize: 20
		},
		success: function(res){
			$('.cnt_body').show();
			$('.bank_list').empty();
			for(var i = 0; i < res.content.length; i++){
				var item = res.content[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				$('.bank_list').append(
					'<tr class="' + _class + 
					'"><td>' + item.username +
					'</td><td>' + item.phone +
					'</td><td>' + item.creditAmountForBank +
					'</td><td>' + item.stringLatestLoginTime + '</td></tr>'
				);
			}
			pageInit(res.totalPages);
		}
	});
</script>