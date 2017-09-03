<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
    <span>首页 > 订单中心 > 订单详情</span>
</div>
<div class="cnt_body">
    <div class="order_box">
    	<div class="order_detail_width">
    		<h1>订单详情</h1>
	        <div class="order_block">
	        	<p class="order_title">订单信息</p>
				<p class="order_row"><span>订单编号：</span><i class="os_id">10258665220</i><span>订单状态：</span><i class="os_status"></i></p>
	        </div>
	        <div class="order_block">
	        	<p class="order_title">商品信息</p>
				<table class="order_pdt">
					<tr>
						<th>商品名称</th>
						<th>材质</th>
						<th>规格</th>
						<th>件重（kg）</th>
						<th>数量</th>
						<th>单价（元）</th>
						<th>总价（元）</th>
					</tr>
					<tr>
						<td class="os_productName"></td>
						<td class="os_material"></td>
						<td class="os_specification"></td>
						<td class="os_unitWeight"></td>
						<td class="os_quantity"></td>
						<td class="os_unitPrice"></td>
						<td class="os_amount"></td>
					</tr>
				</table>
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
				<p class="order_row"><span>授信额度：</span><i>3000000</i></p>
	        </div>
	        <div class="order_block">
	        	<p class="order_title">结算信息</p>
				<p class="order_row"><span>支付类型：</span><i>现金支付</i><span>支付银行：</span><i class="os_creditBank"></i><span>支付方式：</span><i class="os_paymentType"></i></p>
				<p class="order_row"><span>支付期限：</span><i class="os_paymentDeadline"></i><span>服务费：</span><i class="red">￥<big class="os_serviceCharge"></big></i><span>订单总额：</span><i class="red order_total_style">￥<big class="order_total"></big></i></p>
	        </div>
	        <div class="order_block">
	        	<p class="order_title">备注信息</p>
				<p class="order_row os_userMark"></p>
	        </div>
	        <div class="order_block">
	        	<p class="order_title">订单跟踪</p>
				<div class="order_track">
					<p><span>已发货</span><span>xxx确认发货</span><span>小A</span><span>2017-08-30</span></p>
				</div>
	        </div>
	     </div>
    <button>返回</button>
    </div>
</div>
<script src="../js/order.js"></script>