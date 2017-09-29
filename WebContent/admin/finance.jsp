<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 金融中心 > 金融管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="finance_add">新增</button></div>
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="pdts_list">
			<table>
				<thead>
					<th>金融名称</th>
					<th>银行</th>
					<th>类型</th>
					<th>申请数</th>
					<th>状态</th>
					<th>日期</th>
					<th class="operation">操作</th>
				</thead>
				<tbody class="rows">
					<tr>
						<td>xxxxx</td>
						<td>广州</td>
						<td>1855555555</td>
						<td>xxxx</td>
						<td>申请中</td>
						<td>xxxx</td>
						<td><a>申请列表</a>|<a>修改</a>|<a>删除</a>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	cntLoad($('.add_btn [jump="finance_add"]'));
</script>