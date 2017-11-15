<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 资信中心 > 订单资信申请</span>
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
					<th style="width:55px;">订单编号</th>
					<th>商品名称</th>
					<th>卖家企业</th>
					<th>买家企业</th>
					<th style="width:55px;">订单状态</th>
					<th style="width:55px;">单价</th>
					<th style="width:55px;">数量</th>
					<th style="width:55px;">商品总价</th>
					<th style="width:55px;">服务费</th>
					<th style="width:55px;">订单总价</th>
					<th style="width:120px;" class="operation">操作</th>
				</thead>
				<tbody class="rows orders"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script src="../js/b_credit.js"></script>