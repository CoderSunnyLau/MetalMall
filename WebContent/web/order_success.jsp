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
					<p class="company_name">xxxxxx</p>
					<p class="box_title"><span>商品明细</span></p>
					<table class="pdts_list">
						<thead>
							<tr>
								<th>商品名</th>
								<th>材质</th>
								<th>规格</th>
								<th>件重（斤）</th>
								<th>重量（斤）</th>
								<th>单价（元）</th>
								<th>数量（件）</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>电解铜</td>
								<td>asdi35k</td>
								<td>4.75*150</td>
								<td>1000</td>
								<td>400</td>
								<td>500</td>
								<td><input class="amount" type="number" value="1" disabled="disabled" style="border:none;" /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr><td class="sum" colspan="7">商品总计：<b>￥<i>20000.00</i></b></td></tr>
						</tfoot>
					</table>
				</div>
				<div class="table_box">
					<p class="box_title"><span>买家企业</span></p>
					<p class="company_name">广州钢材集团 | 电话：8888888</p>
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
								<td>反向保理</td>
								<td>工商银行</td>
								<td>2个月</td>
								<td colspan="3"></td>
							</tr>
						</table>
					</div>
					<p class="bank_credit">银行授信：<span>1000000.00</span></p>
					<p class="box_title"><span>留言备注</span></p>
					<textarea class="remark" disabled="disabled"></textarea>
				</div>
				<div class="settlement_box">
					<div class="settlement">
						<p class="settlement_row">
							<span>商品总价：</span><i>￥20000.00</i>
						</p>
						<p class="settlement_row">
							<span>服务费用：</span><i>￥100.00</i>
						</p>
						<p class="settlement_row total">
							<span>应付金额：</span><b>￥20100.00</b>
						</p>
						<a><button class="view_order">查看订单</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/order.js"></script>
</body>
</html>