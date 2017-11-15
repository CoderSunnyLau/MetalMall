<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 订单中心 > 供货订单</span>
</div>
<div class="cnt_body order_supply">
	<div class="part">
		<div class="search_bar">
			<div class="search" style="display:block;">
			<span>状态：</span>
			<select id="sel_status" onchange="selStatus(this)">
				<option value="">全部订单</option>
				<option value="已下单">已下单</option>
				<option value="已确认">已确认</option>
				<option value="已授信">已授信</option>
				<option value="拒绝授信">拒绝授信</option>
				<option value="已发货">已发货</option>
				<option value="已签收">已签收</option>
				<option value="已取消">已取消</option>
			</select>
				<button>搜 索</button>
			</div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<th class="tab_4">订单编号</th>
					<th>商品名称</th>
					<th class="tab_4">商品类型</th>
					<th>买方企业</th>
					<th class="tab_4">订单状态</th>
					<th class="tab_4">单价</th>
					<th class="tab_4">数量</th>
					<th class="tab_4">商品总价</th>
					<th class="tab_4">服务费</th>
					<th class="tab_4">订单总价</th>
					<th class="operation">操作</th>
				</thead>
				<tbody class="rows orders"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	sysInit();
	var successCallback = function(){
		var _operation,
			_method,
			_type,
			_param = {
			'pageIndex': getSysUrlParam('pageIndex') || 0,
			'pageSize': 20,
			'companyId': USER.id
		}
		var status = getSysUrlParam('status');
		if(status){
			_param.status = status;
			$('#sel_status').val(status);
		}
		_method = status ? '/getSellingOrdersByCompanyAndStatus' : '/getPagedUserOrderByProductCompanyId';
		_type = 'supply';
	
		$.ajax({
			url: DOMAIN + _method,
			type: 'GET',
			data: _param,
			success: function(res){
				$('.orders').empty();
				if(res.content.length){
					for(var i = 0; i < res.content.length; i++){
						var order = res.content[i];
						var _class = i % 2 == 0 ? '' : 'odd';
						if(order.status == '已下单'){
							_operation = '<a class="op confirm">确认</a>|<a class="op cancel">取消</a>|';
						}else if(order.status == '已授信'){
							_operation = '<a class="op order_send">发货</a>|';
						}else if(order.status == '已发货'){
							_operation = '';
						}else{
							_operation = '';
						}
						$('.orders').append(
							'<tr class="' + _class + 
							'"><td>' + order.id + 
							'</td><td>' + order.productName +
							'</td><td>' + order.productType +
							'</td><td>' + order.buyerCompanyName +
							'</td><td>' + order.status +
							'</td><td>' + order.unitPrice +
							'</td><td>' + order.quantity +
							'</td><td>' + (order.amount - order.serviceCharge) +
							'</td><td>' + order.serviceCharge +
							'</td><td class="order_money">￥' + order.amount +
							'</td><td orderId="' + order.id + '">' + _operation + '<a class="op view" jump="order_detail">详情</a></td></tr>'
						);
					}
				}else{
					noRes($('.orders'));
				}
				$('.cnt_body').show();
				pageInit(res.totalPages);
			}
		});
		
		$('.orders').on('click', '.op', function(){
			if($(this).hasClass('view')){
				jump('company',{
					page: 'order_detail',
					orderType: _type,
					orderId: $(this).parent().attr('orderId')
				});
			}else{
				var _opParam = {
					orderId: $(this).parent().attr('orderId')
				},
				_op,
				_msg;
				if($(this).hasClass('cancel')){
					_op = '/cancelOrder'
					_opParam.userName = $('.user_name').html();
					_msg = '订单已取消';
				}else if($(this).hasClass('confirm')){
					_op = '/confirmOrder'
					_msg = '订单已确认';
				}else if($(this).hasClass('order_send')){
					_op = '/sendOrderProductConfirm'
					_msg = '发货成功';
				}else if($(this).hasClass('recieve')){
					_op = '/receiveOrderProductConfirm';
					_msg = '确认收货成功';
				}
				$.ajax({
					url: DOMAIN + _op,
					type: 'POST',
					dataType: 'json',
					data: _opParam,
					success: function(res){
						alert(_msg);
						reload('company');
					}
				});
			}
		});
	}
	var selStatus = function(el){
		setUrlParameter('status', el.value);
	}
</script>