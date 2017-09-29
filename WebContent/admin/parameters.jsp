<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 系统管理 > 参数管理</span>
</div>
<div class="cnt_body">
	<div class="part">
		<div class="search_bar">
			<div class="add_btn"><button class="white_btn" jump="parameter_add">新增</button></div>
		</div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th>参数ID</th>
						<th>参数标识</th>
						<th>参数键名</th>
						<th>参数键值</th>
						<th>备注</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows">
					<tr>
						<td>100</td>
						<td>GOODS_TYPE</td>
						<td>TONG_1_1</td>
						<td>电解铜</td>
						<td>电解铜TONG_1_1</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr class="odd">
						<td>100</td>
						<td>GOODS_TYPE</td>
						<td>TONG_1_1</td>
						<td>电解铜</td>
						<td>电解铜TONG_1_1</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
					<tr>
						<td>100</td>
						<td>GOODS_TYPE</td>
						<td>TONG_1_1</td>
						<td>电解铜</td>
						<td>电解铜TONG_1_1</td>
						<td><a>修改</a>|<a>删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	cntLoad($('.add_btn [jump="parameter_add"]'));
</script>