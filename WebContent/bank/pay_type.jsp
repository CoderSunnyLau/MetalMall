<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 银行中心 > 支付方式</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="pay_add">新增</button></div>
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th>银行名称</th>
						<th>支付方式</th>
						<th>支付期限</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows">
					<tr>
						<td>中国银行</td>
						<td>白条分期</td>
						<td>2017-12-31</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr class="odd">
						<td>中国银行</td>
						<td>白条分期</td>
						<td>2017-12-31</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr>
						<td>中国银行</td>
						<td>白条分期</td>
						<td>2017-12-31</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	cntLoad($('.add_btn [jump="pay_add"]'), 'bank');
</script>