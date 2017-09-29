<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=96">
<div class="cnt_header">
	<span>首页 > 系统管理 > 用户管理 > 新增/修改</span>
</div>
<div class="cnt_body">
	<p class="user_title">新增/修改用户信息</p>
	<div class="fill_block">
		<p><span>用户名称</span><input type="text" /></p>
		<p><span>用户密码</span><input type="text" /></p>
		<p><span>确认密码</span><input type="text" /></p>
		<p><span>用户姓名</span><input type="text" /></p>
		<p><span>用户角色</span>
			<select>
				<option value="admin">系统管理员</option>
				<option value="company">企业操作员</option>
				<option value="bank">银行操作员</option>
			</select>
		</p>
		<p><span>所属机构</span><select></select></p>
	</div>
	<div class="fill_block pdts_state">
		<ul>
			<li><span>新增人：</span><i class="username">王大伟</i><span>新增时间：</span><i>2017-07-31 10:00:00</i></li>
			<li><span>修改人：</span><i class="username">王大伟</i><span>修改时间：</span><i>2017-07-31 10:00:00</i></li>
		</ul>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
	</div>
</div>