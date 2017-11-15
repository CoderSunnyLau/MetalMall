<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_account.css">
<div class="cnt_header">
	<span>首页 > 系统管理 > 账户信息</span>
</div>
<div class="cnt_body c">
	<div class="account_cnt">
		<p class="user_title">用户基本信息</p>
		<div class="info_detail">
			<div class="user_info">
				<span class="avatar"><img src="../images/default_user.png" /></span>
				<span class="border_right">
					<p>用户名：<i class="login_name ba_loginName"></i></p>
					<p>操作员：<i class="ba_operatorRealName"></i></p>
				</span>
			</div>
			<div class="login_total">
				<p>登录次数：<i class="ba_loginCount"></i></p>
			</div>
			<div class="latest_login">
				<p>最近登录：<i class="ba_stringLatestLoginTime"></i></p>
			</div>
		</div>
	</div>
	<div class="account_cnt account_last">
		<p class="user_title">银行基本信息<span class="fix_btn to_fix">修改银行信息</span></p>
		<div class="company_info">
			<p><span>银行名称</span><input disabled="disabled" class="fix_field disabled ba_username" name="username"></p>
			<p><span>银行简称</span><input disabled="disabled" class="fix_field disabled ba_miniName" name="miniName"></p>
			<p><span>联系电话</span><input disabled="disabled" class="fix_field disabled ba_phone" name="phone"></p>
			<p><span>统一信用码</span><input disabled="disabled" class="fix_field disabled ba_uniformCreditCode" name="uniformCreditCode"></p>
			<p><span>总授信</span><i class="creditedAmountByBankId" style="padding-left:15px;">--</i></p>
			<p><span>银行说明</span><input disabled="disabled" class="fix_field disabled ba_description" name="description"></p>
			<p><span>银行操作员</span><input disabled="disabled" class="fix_field disabled ba_operatorRealName" name="operatorRealName"></p>
		</div>
	</div>
</div>
<script src="../js/b_account_info.js"></script>