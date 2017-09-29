<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 订单中心 > 采购订单</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="search">
			<span>订单号：</span><input type="text" placeholder="请输入订单号"/>
			<span>状态：</span>
			<select>
				<option>请选择状态</option>
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
					<th>所属企业</th>
					<th class="tab_4">订单状态</th>
					<th class="tab_4">单价</th>
					<th class="tab_4">数量</th>
					<th class="tab_4">商品总价</th>
					<th class="tab_4">服务费</th>
					<th class="tab_4">订单总价</th>
					<th class="operation">操作</th>
				</thead>
				<tbody class="rows">
					<tr>
						<td>0001</td>
						<td class="pdt_name">001号xxxxx电解铜</td>
						<td>电解铜</td>
						<td>xxxxx</td>
						<td>xxxxx</td>
						<td>5000</td>
						<td>2</td>
						<td>10000</td>
						<td>1298</td>
						<td class="order_money">￥11298.00</td>
						<td><a>订单详情</a></td>
					</tr>
					<tr class="odd">
						<td>0001</td>
						<td class="pdt_name">001号xxxxx电解铜</td>
						<td>电解铜</td>
						<td>xxxxx</td>
						<td>xxxxx</td>
						<td>5000</td>
						<td>2</td>
						<td>10000</td>
						<td>1298</td>
						<td class="order_money">￥11298.00</td>
						<td><a>订单详情</a></td>
					</tr>
					<tr>
						<td>0001</td>
						<td class="pdt_name">001号xxxxx电解铜</td>
						<td>电解铜</td>
						<td>xxxxx</td>
						<td>xxxxx</td>
						<td>5000</td>
						<td>2</td>
						<td>10000</td>
						<td>1298</td>
						<td class="order_money">￥11298.00</td>
						<td><a>订单详情</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>