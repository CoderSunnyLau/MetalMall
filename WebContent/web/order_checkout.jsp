<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>订单确认</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/order.css">
	<script src="../js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../components/header2.jsp"></jsp:include>
	<div class="page_body">
		<div class="page_cnt main_width">
			<div class="cnt_header">
				<span class="tip">填写并核对订单信息</span>
			</div>
			<div class="checkout">
				<div class="table_box">
					<p class="box_title">卖家企业</p>
					<p class="company_name">xxxxxx</p>
					<p class="box_title">商品明细</p>
					<table>
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
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="number" /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr><td class="sum" colspan="7"><b>￥<i>20000.00</i></b></td></tr>
						</tfoot>
					</table>
				</div>
				<div class="table_box">
					<p class="box_title">买家企业</p>
					<p class="company_name"></p>
					<p class="box_title">支付方式</p>
					<div class="payment_type">
						<select>
							<option>选择支付方式</option>
						</select>
						<select>
							<option>选择银行</option>
						</select>
						<select>
							<option>选择期限</option>
						</select>
					</div>
					<p class="box_title">我要备注</p>
					<textarea placeholder="请输入您要备注的信息"></textarea>
				</div>
				<div class="settlement_box">
					<div class="settlement">
						<p class="settlement_row">
							<span></span><i>￥20000.00</i>
						</p>
						<p class="settlement_row">
							<span></span><i>￥100.00</i>
						</p>
						<p class="settlement_row total">
							<span></span><b>￥20100.00</b>
						</p>
						<button class="submit">提交订单</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>