<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 资信中心 > 资信申请</span>
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
		<div class="pdts_list">
			<table>
				<thead>
					<th>订单编号</th>
					<th>商品名称</th>
					<th>卖家企业</th>
					<th>买家企业</th>
					<th>订单状态</th>
					<th>单价</th>
					<th>数量</th>
					<th>商品总价</th>
					<th>服务费</th>
					<th>订单总价</th>
					<th class="operation">操作</th>
				</thead>
				<tbody class="rows">
					<tr>
						<td>xxxxx</td>
						<td>广州</td>
						<td>1855555555</td>
						<td>xxxx</td>
						<td>50</td>
						<td>52980000</td>
						<td>31</td>
						<td>1298000</td>
						<td>工商银行</td>
						<td>申请中</td>
						<td><a>同意</a>|<a>拒绝</a>|<a>详情</a>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script src="../js/credit.js"></script>