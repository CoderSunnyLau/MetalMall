<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 订单中心 > 订单详情</span>
</div>
<div class="cnt_body">
	<p class="order_top">
		<span>订单编号：</span><i class="o_id os_id"></i>
		<span>订单状态：</span><i class="o_status"></i>
	</p>
	<div>
		<div class="order_detail_block">
			<p class="user_title">订单详情</p>
			<div class="order_block"></div>
			<div class="order_block seller_block">
				<p class="order_title">卖家企业</p>
				<p class="order_row"><span>企业名称：</span><i class="os_username"></i><span>企业电话：</span><i class="os_phone"></i><span>地区：</span><i class="os_area"></i></p>
			</div>
			<div class="order_block">
				<p class="order_title">买家企业</p>
				<p class="order_row"><span>企业名称：</span><i class="ob_username"></i><span>企业电话：</span><i class="ob_phone"></i><span>地区：</span><i class="ob_area"></i></p>
				<p class="order_row"><span>信用码：</span><i class="ob_uniformCreditCode"></i><span>法人代表：</span><i class="ob_corporateName"></i><span>企业地址：</span><i class="ob_address"></i></p>
				<p class="order_row"><span>开户银行：</span><i class="ob_bankName"></i><span>银行账户：</span><i class="ob_bankAccount"></i><span>授信额度：</span><i class="ob_creditAmount"></i></p>
			</div>
			<div class="order_block">
				<p class="order_title">备注信息</p>
				<p class="order_row o_userMark"></p>
			</div>
			<div class="order_block">
				<p class="order_title">支付信息</p>
				<p class="order_row"><span>支付类型：</span><i>现金支付</i></p>
				<p class="order_row"><span>支付银行：</span><i class="o_creditBank"></i></p>
				<p class="order_row"><span>支付方式：</span><i class="o_paymentType"></i></p>
				<p class="order_row"><span>支付期限：</span><i class="o_paymentDeadline"></i></p>
			</div>
			<div class="order_block">
				<table class="order_pdt">
					<thead>
					<tr>
						<th>商品</th>
						<th>材质</th>
						<th>规格</th>
						<th>件重（kg）</th>
						<th>数量</th>
						<th>单价（元）</th>
						<th>总价（元）</th>
					</tr>
					</thead>
					<tr>
						<td class="op_name"></td>
						<td class="op_material"></td>
						<td class="op_specification"></td>
						<td class="op_weight"></td>
						<td class="o_productQuantity"></td>
						<td class="op_price"></td>
						<td class="op_amount"></td>
					</tr>
				</table>
			</div>
			<div class="order_account">
				<p><span>商品总价：</span><i class="red">￥<big class="op_amount"></big></i></p>
				<p><span>服务费：</span><i class="red">￥<big class="o_serviceCharge"></big></i></p>
				<p><span>订单总额：</span><i class="red order_total_style">￥<big class="o_orderPriceAmount"></big></i></p>
			</div>
		</div>
		<div class="order_block track_block">
			<p class="user_title">订单跟踪</p>
			<div class="order_track order_row"></div>
		</div>
		<div class="order_back"><button>返　回</button></div>
	</div>
</div>
<script src="../js/s_order_detail.js"></script>