<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 金融中心 > 金融管理 > 新增金融</span>
</div>
<div class="cnt_body">
	<p class="user_title">添加金融详情信息</p>
	<div class="fill_block">
		<p><span>名称</span><input type="text" /></p>
		<p><span>类型</span>
			<select>
				<option>请选择类型</option>
			</select>
		</p>
		<p><span>银行</span>
			<select>
				<option>请选择银行</option>
			</select>
		</p>
	</div>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>金融介绍</span>
			<div><jsp:include page="../components/ueditor.jsp"></jsp:include></div>
		</div>
	</div>
	<div class="fill_block pdts_state">
		<p><span>审核状态</span><i>待审核</i><i>已审核</i></p>
		<ul>
			<li><span>新增人：</span><i class="username">王大伟</i><span>新增时间：</span><i>2017-07-31 10:00:00</i></li>
			<li><span>修改人：</span><i class="username">王大伟</i><span>修改时间：</span><i>2017-07-31 10:00:00</i></li>
		</ul>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
	</div>
</div>