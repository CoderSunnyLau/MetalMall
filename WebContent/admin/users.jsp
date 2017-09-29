<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 系统管理 > 用户管理</span>
</div>
<div class="cnt_body">
	<div class="part users">
		<div class="search_bar">
			<div class="add_btn">
				<button class="white_btn" jump="user_add">新 增</button>
				<!-- <button class="white_btn" jump="user_add_compnay">新增企业用户</button>
				<button class="white_btn" jump="user_add_bank">新增银行用户</button> -->
			</div>
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div></div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th>用户角色</th>
						<th>用户名称</th>
						<th>用户姓名</th>
						<th>所属机构</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows">
					<tr>
						<td>系统管理员</td>
						<td>sdlkfjslfk</td>
						<td>张三</td>
						<td>鞍钢集团</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr class="odd">
						<td>系统管理员</td>
						<td>sdlkfjslfk</td>
						<td>张三</td>
						<td>鞍钢集团</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr>
						<td>系统管理员</td>
						<td>sdlkfjslfk</td>
						<td>张三</td>
						<td>鞍钢集团</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	cntLoad($('.add_btn [jump="user_add"]'));
</script>