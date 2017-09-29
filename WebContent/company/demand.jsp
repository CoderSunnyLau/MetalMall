<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="cnt_header">
	<span>首页 > 需求中心 > 需求单管理</span>
</div>
<div class="cnt_body">
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
						<th>名称</th>
						<th>商品类型</th>
						<th>规格</th>
						<th>材质</th>
						<th>需求数量</th>
						<th>预算</th>
						<th>时间</th>
						<th>当前状态</th>
						<th>处理状态</th>
						<th>申请数</th>
						<th class="operation">操作</th>
					</tr>
				</thead>
				<tbody class="rows">
					<tr>
						<td>0001</td>
						<td class="pdt_name">电解铜</td>
						<td>电解铜</td>
						<td>xxxxx</td>
						<td>5000</td>
						<td>10000</td>
						<td>1298</td>
						<td>10000</td>
						<td>1298</td>
						<td class="order_money">￥11298.00</td>
						<td><a>确认</a>|<a>取消</a>|<a>详情</a>
					</tr>
					<tr class="odd">
						<td>0001</td>
						<td class="pdt_name">电解铜</td>
						<td>电解铜</td>
						<td>xxxxx</td>
						<td>5000</td>
						<td>10000</td>
						<td>1298</td>
						<td>10000</td>
						<td>1298</td>
						<td class="order_money">￥11298.00</td>
						<td><a>确认</a>|<a>取消</a>|<a>详情</a>
					</tr>
					<tr>
						<td>0001</td>
						<td class="pdt_name">电解铜</td>
						<td>电解铜</td>
						<td>xxxxx</td>
						<td>5000</td>
						<td>10000</td>
						<td>1298</td>
						<td>10000</td>
						<td>1298</td>
						<td class="order_money">￥11298.00</td>
						<td><a>确认</a>|<a>取消</a>|<a>详情</a>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script src="../js/system_demand.js"></script>