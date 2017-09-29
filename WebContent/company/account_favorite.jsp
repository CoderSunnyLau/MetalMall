<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 系统管理 > 我的收藏</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="user_title">
			我的收藏
		</div>
		<div class="pdts_list">
			<table>
				<thead>
					<th style="width:20%;">商品名称</th>
					<th>商品类型</th>
					<th>规格</th>
					<th>材质</th>
					<th>库存</th>
					<th>时间</th>
					<th>单价</th>
					<th>操作</th>
				</thead>
				<tbody class="pdts rows">
					<tr>
						<td class="pdt_name">001号xxxxx电解铜</td>
						<td>电解铜</td>
						<td>xxxxx</td>
						<td>xxxxx</td>
						<td>5000</td>
						<td>2017-7-31</td>
						<td>1298</td>
						<td>查看</td>
					</tr>
					<tr class="odd">
						<td class="pdt_name">001号xxxxx电解铜</td>
						<td>电解铜</td>
						<td>xxxxx</td>
						<td>xxxxx</td>
						<td>5000</td>
						<td>2017-7-31</td>
						<td>1298</td>
						<td>查看</td>
					</tr>
				</tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script src="../js/system_pdts.js"></script>