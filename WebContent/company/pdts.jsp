<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 供货中心 > 商品管理</span>
</div>
<div class="cnt_body cnt_pdts">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="pdt_add">新增商品</button></div>
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="pdts_list">
			<table>
				<thead>
					<th style="width:20%;">商品名称</th>
					<th>商品类型</th>
					<th>规格</th>
					<th>材质</th>
					<th>库存</th>
					<th>当前状态</th>
					<th style="width:120px;">时间</th>
					<th>成交笔数</th>
					<th style="width:100px;">操作</th>
				</thead>
				<tbody class="pdts rows"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script src="../js/c_pdt.js"></script>