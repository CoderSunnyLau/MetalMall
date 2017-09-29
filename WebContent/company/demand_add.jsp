<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 需求中心 > 需求单管理 > 新增需求单</span>
</div>
<div class="cnt_body">
	<p class="user_title">添加需求单详情信息</p>
	<div class="fill_block">
		<p><span>名称</span><input type="text" /></p>
		<p><span>材质</span><input type="text" /></p>
		<p><span>规格</span><input type="text" /></p>
		<p><span>所需数量</span><input type="text" /></p>
		<p><span>单位</span><input type="text" /></p>
		<p><span>商品类型</span>
			<select>
				<option>请选择商品类型</option>
			</select>
		</p>
		<p><span>所属企业</span>
			<select>
				<option></option>
			</select>
		</p>
		<p><span>联系电话</span><input type="text" /></p>
		<p><span>地区</span>
			<select>
				<option>请选择地区</option>
			</select>
		</p>
		<p><span>预算</span><input type="text" />~<input type="text" /></p>
	</div>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>需求单介绍</span>
			<div><jsp:include page="../components/ueditor.jsp"></jsp:include></div>
		</div>
	</div>
	<div class="fill_block pdts_state">
		<p><span>审核状态</span><i>待审核</i></p>
		<ul>
			<li><span>新增人：</span><i class="username">王大伟</i><span>新增时间：</span><i>2017-07-31 10:00:00</i></li>
			<li><span>修改人：</span><i class="username">王大伟</i><span>修改时间：</span><i>2017-07-31 10:00:00</i></li>
		</ul>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
		<button class="preview white_btn" onclick="return $EDITORUI['edui22']._onClick(event, this);">预　览</button>
	</div>
</div>