<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_account.css?a=9">
<div class="cnt_header">
	<span>首页 > 系统管理 > 账户安全</span>
</div>
<div class="cnt_body c">
	<div class="cnt_top">
		<div class="user_info">
			<div class="avatar"><img src="../images/bg.png" /></div>
			<p class="user_row">用户名称：<i class="user_id">lalla</i></p>
			<p class="user_row">用户姓名：<i class="user_name">哈哈哈</i></p>
		</div>
		<div class="security_level">
			<p class="user_title">您当前账户的安全等级</p>
			<div class="level_block">
				<div class="level_bar"><span class="level_percent"><i>70%</i></span></div>
				<span class="level_text">安全程度：<i class="level middle">中</i></span>
			</div>
		</div>
	</div>
	<div class="cnt_bottom">
		<div class="cnt_row">
			<p class="row_name">登录密码</p>
			<p class="row_desc">安全性高的密码可以使账户更加安全。建议您定期修改密码，设置一个至少包含字母、数字及符号中的两项，且长度超过6位数的密码。</p>
			<p class="row_state state_set">已设置</p>
			<p class="row_set"><a>修改</a></p>
		</div>
		<div class="cnt_row">
			<p class="row_name">手机绑定</p>
			<p class="row_desc">
				<span class="phone_bind bound">您已绑定手机号<i class="phone_num">155****0523</i>，</span>
				<span class="phone_bind bind">您还未绑定任何手机号，</span>
				<span>手机号码可以直接用于登录、找回密码等。</span>
			</p>
			<p class="row_state state_no">未设置</p>
			<p class="row_set"><a>设置</a></p>
		</div>
	</div>
</div>