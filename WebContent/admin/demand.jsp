<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 需求中心 > 需求单管理</span>
</div>
<div class="cnt_body demand">
	<div class="part">
		<div class="search_bar">
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th>名称</th>
						<th>商品类型</th>
						<th>规格</th>
						<th>材质</th>
						<th>需求数量</th>
						<th>预算（元）</th>
						<th>时间</th>
						<th>审核状态</th>
						<th>处理状态</th>
						<th>申请数</th>
						<th class="operation" style="width:120px;">操作</th>
					</tr>
				</thead>
				<tbody class="rows demands"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script src="../js/a_demand.js"></script>