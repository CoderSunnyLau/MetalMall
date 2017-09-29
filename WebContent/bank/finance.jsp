<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 金融中心 > 支付方式</span>
</div>
<div class="cnt_body">
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
						<th>金融名称</th>
						<th>银行</th>
						<th>类型</th>
						<th>申请数</th>
						<th>状态</th>
						<th>日期</th>
						<th class="operation" style="width:120px;">操作</th>
					</tr>
				</thead>
				<tbody class="rows">
					<tr>
						<td>工行超级白条</td>
						<td>工商银行</td>
						<td>分期白条</td>
						<td>10</td>
						<td>未审核</td>
						<td>2017-12-31</td>
						<td><a>申请列表</a>|<a>修改</a>|<a>删除</a></td>
					</tr>
					<tr class="odd">
						<td>工行超级白条</td>
						<td>工商银行</td>
						<td>分期白条</td>
						<td>10</td>
						<td>未审核</td>
						<td>2017-12-31</td>
						<td><a>申请列表</a>|<a>修改</a>|<a>删除</a></td>
					</tr>
					<tr>
						<td>工行超级白条</td>
						<td>工商银行</td>
						<td>分期白条</td>
						<td>10</td>
						<td>未审核</td>
						<td>2017-12-31</td>
						<td><a>申请列表</a>|<a>修改</a>|<a>删除</a></td>
					</tr>
					<tr class="odd">
						<td>工行超级白条</td>
						<td>工商银行</td>
						<td>分期白条</td>
						<td>10</td>
						<td>未审核</td>
						<td>2017-12-31</td>
						<td><a>申请列表</a>|<a>修改</a>|<a>删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	cntLoad($('.add_btn [jump="finance_add"]'), 'bank');
</script>