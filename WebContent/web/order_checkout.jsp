<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>订单确认</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/order.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="mall" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="mall">
		<div class="page_cnt main_width">
			<div class="cnt_header">
				<span class="tip">填写并核对订单信息</span>
			</div>
			<div class="checkout">
				<div class="table_box">
					<p class="box_title"><span>卖家企业</span></p>
					<p class="company_name os_username"></p>
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
								<th>数量（件）</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="op_name"></td>
								<td class="op_material"></td>
								<td class="op_specification"></td>
								<td class="op_weight"></td>
								<td class="op_totalweight op_weight"></td>
								<td class="op_price"></td>
								<td><button class="set_count count_btn">修改</button><input class="op_count" type="number" value="1" disabled="disabled" /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr><td class="sum" colspan="7">商品总计：<big>￥<i class="op_amount op_price"></i></big></td></tr>
						</tfoot>
					</table>
				</div>
				<div class="table_box">
					<p class="box_title"><span>买家企业</span></p>
					<p class="company_name"><span class="ob_username">--</span> | 电话：<span class="ob_phone"></span></p>
					<p class="box_title"><span>支付方式</span></p>
					<div class="payment_type">
						<select id="pay_type">
							<option value="0">选择支付方式</option>
						</select>
						<select id="sel_bank">
							<option value="0">选择银行</option>
						</select>
						<select id="sel_deadline">
							<option value="0">选择期限</option>
						</select>
					</div>
					<p class="box_title"><span>我要备注</span></p>
					<textarea class="remark" placeholder="请输入您要备注的信息"></textarea>
				</div>
				<div class="settlement_box">
					<div class="settlement">
						<p class="settlement_row">
							<span>商品总价：</span><i>￥<big class="op_amount op_price">--.--</big></i>
						</p>
						<p class="settlement_row">
							<span>服务费用：</span><i>￥<big>100.00</big></i>
						</p>
						<p class="settlement_row total">
							<span>应付金额：</span><b>￥<big class="total_money">--.--</big></b>
						</p>
						<button class="submit">提交订单</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/order.js"></script>
</body>
</html>