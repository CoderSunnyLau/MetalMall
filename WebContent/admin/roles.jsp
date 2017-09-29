<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 系统管理 > 角色管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="role_add">新增</button></div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th>角色名称</th>
						<th>角色类型</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows">
					<tr>
						<td>系统管理员</td>
						<td>系统管理员</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr class="odd">
						<td>企业操作员</td>
						<td>企业操作员</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr>
						<td>银行操作员</td>
						<td>银行操作员</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	cntLoad($('.add_btn [jump="role_add"]'));
</script>