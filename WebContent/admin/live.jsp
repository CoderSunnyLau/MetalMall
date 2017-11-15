<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<style>
	.live_des{
		text-align:left;
	}
</style>
<div class="cnt_header">
	<span>首页 > 系统管理 > 直播管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="live_add">新增</button></div>
		</div>
		<div class="market_info_list">
			<table>
				<thead>
					<tr>
						<th width="200">直播标题</th>
						<th>直播文字</th>
						<th width="130">时间</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows market_info"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	sysInit();
	cntLoad($('.add_btn [jump="live_add"]'), 'admin');
	
	$.ajax({
		url: DOMAIN + '/getMarketBoardByPage',
		type: 'GET',
		data: {
			pageIndex: getSysUrlParam('pageIndex') || 0,
			pageSize: 20
		},
		success: function(res){
			$('.cnt_body').show();
			$('.market_info').empty();
			for(var i = 0; i < res.content.length; i++){
				var item = res.content[i];
				var _class = i % 2 == 0 ? '' : 'odd';
				$('.market_info').append(
					'<tr class="' + _class + 
					'"><td>' + item.title +
					'</td><td class="live_des">' + item.description +
					'</td><td>' + item.updateTime +
					'</td><td itemId="' + item.id + '"><a class="op edit" jump="live_fix">修改</a>|<a class="op to_del">删除</a>' +
					'</td></tr>'
				);
			}
			$('.market_info').on('click', '.op', function(){
				var itemId = $(this).parent().attr('itemId');
				if($(this).hasClass('edit')){
					jump('admin', {page: 'live_fix', liveId: itemId});
				}else if($(this).hasClass('to_del')){
					$.ajax({
						url: DOMAIN + '/deleteMarketBoard',
						type: 'POST',
						data: {
							id: itemId
						},
						dataType: 'json',
						success: function(res){
							if(res.deleted){
								alert('操作成功！');
								reload('admin');
							}else{
								alert('操作失败，请重试。');
							}
						}
					});
				}
			});
			pageInit(res.totalPages);
		}
	});
</script>