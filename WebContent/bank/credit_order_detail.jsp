<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 订单中心 > 订单详情</span>
</div>
<div class="cnt_body">
	<div class="credit_detail">
		<div class="order_detail_block">
			<p class="user_title">订单详情<span class="order_top"><span>订单编号：</span><i class="os_id">10258665220</i></span></p>
			<div class="order_block"></div>
			<div class="order_block credit_order_pay">
				<p class="order_title">支付信息</p>
				<p class="order_row"><span>支付类型：</span><i>现金支付</i></p>
				<p class="order_row"><span>支付银行：</span><i class="os_creditBank"></i></p>
				<p class="order_row"><span>支付方式：</span><i class="os_paymentType"></i></p>
				<p class="order_row"><span>支付期限：</span><i class="os_paymentDeadline"></i></p>
				<p class="order_row"><span>商品总价：</span><i class="red">￥<big class="os_amount"></big></i></p>
				<p class="order_row"><span>服务费：</span><i class="red">￥<big class="os_serviceCharge"></big></i></p>
				<p class="order_row"><span>订单总额：</span><i class="red">￥<big class="order_total"></big></i></p>
			</div>
			<div class="order_block">
				<p class="order_title">卖家企业</p>
				<p class="order_row"><span>企业名称：</span><i class="seller_name"></i><span>企业电话：</span><i class="seller_phone">10258665220</i><span>地区：</span><i class="seller_area"></i></p>
			</div>
			<div class="order_block">
				<p class="order_title">买家企业</p>
				<p class="order_row"><span>企业名称：</span><i class="buyer_name"></i><span>企业电话：</span><i class="buyer_phone"></i><span>地区：</span><i class="buyer_area"></i></p>
				<p class="order_row"><span>信用码：</span><i class="buyer_code"></i><span>法人代表：</span><i>xxx</i><span>联系电话：</span><i>15858585858</i></p>
				<p class="order_row"><span>企业地址：</span><i>广东省广州市xxx</i><span>开户银行：</span><i>招商银行</i><span>银行账户：</span><i>6210952020202020</i></p>
				<p class="order_row"><span>授信额度：</span><i class="red buyer_credit">3000000</i></p>
			</div>
		</div>
		<div class="track_block">
			<p class="order_row"><span>利息核算：</span><input type="number" /><i class="grey">该利息银行线下收取卖家费用</i></p>
			<p class="order_row">
				<span>申请操作：</span>
				<input type="radio" name="credit_operation" value="agree" /><i>同意（已授信）</i>
				<input type="radio" name="credit_operation" value="refuse" /><i>拒绝（拒绝授信）</i>
			</p>
		</div>
		<div class="button_block"><button class="submit">提　交</button></div>
	</div>
</div>
<script src="../js/order.js"></script>