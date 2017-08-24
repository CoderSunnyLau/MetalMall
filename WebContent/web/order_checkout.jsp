<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>订单确认</title>
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
				<span class="tip">填写并核对订单信息</span>
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
								<td><input class="amount" type="number" value="1" /></td>
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
					<p class="box_title"><span>我要备注</span></p>
					<textarea class="remark" placeholder="请输入您要备注的信息"></textarea>
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