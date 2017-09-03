<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>提交成功</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/order.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="mall" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="mall">
		<div class="page_cnt main_width">
			<div class="cnt_header">
				<span class="tip success"><i></i>订单提交成功，请您尽快付款！</span>
			</div>
			<div class="checkout">
				<div class="table_box">
					<p class="box_title"><span>卖家企业</span></p>
					<p class="company_name seller_name"></p>
					<p class="box_title"><span>商品明细</span></p>
					<table class="pdts_list">
						<thead>
							<tr>
								<th>商品名</th>
								<th>材质</th>
								<th>规格</th>
								<th>件重（kg）</th>
								<th>重量（kg）</th>
								<th>单价（元）</th>
								<th>数量</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="os_productName"></td>
								<td class="os_material"></td>
								<td class="os_specification"></td>
								<td class="os_unitWeight"></td>
								<td class="os_totalWeight"></td>
								<td class="os_unitPrice"></td>
								<td class="os_quantity"></td>
							</tr>
						</tbody>
						<tfoot>
							<tr><td class="sum" colspan="7">商品总计：<b>￥<i class="os_amount"></i></b></td></tr>
						</tfoot>
					</table>
				</div>
				<div class="table_box">
					<p class="box_title"><span>买家企业</span></p>
					<p class="company_name"><i class="buyer_name"></i>　|　电话：<i class="buyer_phone"></i></p>
					<p class="box_title"><span>支付方式</span></p>
					<div class="payment_type">
						<table>
							<tr class="type_th">
								<td>支付方式</td>
								<td>已选银行</td>
								<td>已选期限</td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td class="os_paymentType"></td>
								<td class="os_creditBank"></td>
								<td class="os_paymentDeadline"></td>
								<td colspan="3"></td>
							</tr>
						</table>
					</div>
					<p class="bank_credit">银行授信：<span></span></p>
					<p class="box_title"><span>留言备注</span></p>
					<textarea class="remark os_userMark" disabled="disabled"></textarea>
				</div>
				<div class="settlement_box">
					<div class="settlement">
						<p class="settlement_row">
							<span>商品总价：</span><i>￥<big class="os_amount"></big></i>
						</p>
						<p class="settlement_row">
							<span>服务费用：</span><i>￥<big class="os_serviceCharge"></big></i>
						</p>
						<p class="settlement_row total">
							<span>应付金额：</span><i>￥<big class="order_total"></big></i>
						</p>
						<button class="view_order">查看订单</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/order.js"></script>
</body>
</html>