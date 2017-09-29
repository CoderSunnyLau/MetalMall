<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 系统管理 > 直播管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="live_add">新增</button></div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th>直播文字</th>
						<th>时间</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows">
					<tr>
						<td>工商银行1000015555555555</td>
						<td>2017-07-31 00:00:00</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr class="odd">
						<td>工商银行1000015555555555</td>
						<td>2017-07-31 00:00:00</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr>
						<td>工商银行1000015555555555</td>
						<td>2017-07-31 00:00:00</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	cntLoad($('.add_btn [jump="live_add"]'));
</script>