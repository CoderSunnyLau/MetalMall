<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 需求中心 > 需求单管理</span>
</div>
<div class="cnt_body demand">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="demand_add">新增需求单</button></div>
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th style="min-width:60px;">名称</th>
						<th style="width:55px;">商品类型</th>
						<th style="min-width:40px;">规格</th>
						<th style="width:60px;">材质</th>
						<th style="width:55px;">需求数量</th>
						<th style="width:80px;">预算（元）</th>
						<th>时间</th>
						<th style="width:55px;">审核状态</th>
						<th style="width:55px;">处理状态</th>
						<th style="width:45px;">申请数</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows demands"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script src="../js/c_demand.js"></script>