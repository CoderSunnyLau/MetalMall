<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_account.css?v=17">
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
					<p>用户名：<i class="login_name ca_loginName"></i></p>
					<p>操作员：<i class="ca_operatorRealName"></i></p>
				</span>
			</div>
			<div class="login_total">
				<p>登录次数：<i class="ca_loginCount"></i></p>
			</div>
			<div class="latest_login">
				<p>最近登录：<i class="ca_stringLatestLoginTime"></i></p>
			</div>
		</div>
	</div>
	<div class="account_cnt">
		<p class="user_title">企业基本信息<span class="fix_btn to_fix">修改企业信息</span></p>
		<div class="company_info">
			<p><span>企业名称</span><input disabled="disabled" class="fix_field disabled ca_username" name="username"></p>
			<p><span>企业简称</span><input disabled="disabled" class="fix_field disabled ca_miniName" name="miniName"></p>
			<p><span>企业简介</span><input disabled="disabled" class="fix_field disabled ca_description" name="description"></p>
			<p><span>统一信用码</span><input disabled="disabled" class="fix_field disabled ca_uniformCreditCode" name="uniformCreditCode"></p>
			<p><span>联系电话</span><input disabled="disabled" class="fix_field disabled ca_phone" name="phone"></p>
			<p><span>企业地址</span><input disabled="disabled" class="fix_field disabled ca_address" name="address"></p>
			<p><span>法人代表</span><input disabled="disabled" class="fix_field disabled ca_corporateName" name="corporateName"></p>
			<p><span>银行账户</span><input disabled="disabled" class="fix_field disabled ca_bankAccount" name="bankAccount"></p>
			<p><span>银行名称</span><input disabled="disabled" class="fix_field disabled ca_bankName" name="bankName"></p>
			<p><span>企业操作员</span><input disabled="disabled" class="fix_field disabled ca_operatorRealName" name="operatorRealName"></p>
		</div>
	</div>
	<div class="account_cnt">
		<p class="user_title">经营信息</p>
		<div class="company_info">
			<p><span>商品数</span><i class="ca_productCount"></i></p>
			<p><span>需求数</span><i class="ca_reqFormCount"></i></p>
			<p><span>供货笔数</span><i class="ca_sellOrderCount"></i></p>
			<!-- <p><span>供货交易额</span><i class="ca_"></i></p> -->
			<p><span>采购笔数</span><i class="ca_buyOrderCount"></i></p>
			<!-- <p><span>采购交易额</span><i class="ca_">加载中，请稍候...</i></p> -->
			<p><span>企业总资产（元）</span><i class="ca_totleAssets"></i></p>
			<p><span>企业净资产（元）</span><i class="ca_netAssets"></i></p>
		</div>
	</div>
	<div class="account_cnt account_last">
		<p class="user_title">企业资料</p>
		<div class="company_info">
			<div class="square_block">
				<form onsubmit="imgSubmit(this)" target="nojump">
					<div class="square">营业执照</div>
					<div class="hover_box businessLicenceImg" onclick="selImg(this)">上传营业执照</div>
					<input type="text" name="userId">
					<input type="text" name="useType" value="updateUserBusinessLicenceImg">
					<input type="file" name="uploadFile" onchange="imgSelected(this)">
					<input type="submit" name="submit">
				</form>
			</div>
			<div class="square_block">
				<form onsubmit="imgSubmit(this)" target="nojump">
					<div class="square">法人身份证</div>
					<div class="hover_box corporateRepImg" onclick="selImg(this)">上传法人身份证</div>
					<input type="text" name="userId">
					<input type="text" name="useType" value="updateUserCorporateRepImg">
					<input type="file" name="uploadFile" onchange="imgSelected(this)">
					<input type="submit" name="submit">
				</form>
			</div>
			<div class="square_block">
				<form onsubmit="imgSubmit(this)" target="nojump">
					<div class="square">银行开户许可证</div>
					<div class="hover_box openingBankAccPermitsImg" onclick="selImg(this)">上传银行开户许可证</div>
					<input type="text" name="userId">
					<input type="text" name="useType" value="updateUserOpeningBankAccPermitsImg">
					<input type="file" name="uploadFile" onchange="imgSelected(this)">
					<input type="submit" name="submit">
				</form>
			</div>
			<div class="square_block">
				<form onsubmit="imgSubmit(this)" target="nojump">
					<div class="square">经营许可证</div>
					<div class="hover_box businessCertImg" onclick="selImg(this)">上传经营许可证</div>
					<input type="text" name="userId">
					<input type="text" name="useType" value="updateUserBusinessCertImg">
					<input type="file" name="uploadFile" onchange="imgSelected(this)">
					<input type="submit" name="submit">
				</form>
			</div>
			<div class="square_block">
				<form onsubmit="imgSubmit(this)" target="nojump">
					<div class="square">去年财务报表</div>
					<div class="hover_box lastYearFinancialStmtImg" onclick="selImg(this)">上传去年财务报表</div>
					<input type="text" name="userId">
					<input type="text" name="useType" value="updateUserLastYearFinancialStmtImg">
					<input type="file" name="uploadFile" onchange="imgSelected(this)">
					<input type="submit" name="submit">
				</form>
			</div>
			<div class="square_block">
				<form onsubmit="imgSubmit(this)" target="nojump">
					<div class="square">上月财务报表</div>
					<div class="hover_box lastMonthFinancialStmtImg" onclick="selImg(this)">上传上月财务报表</div>
					<input type="text" name="userId">
					<input type="text" name="useType" value="updateUserLastMonthFinancialStmtImg">
					<input type="file" name="uploadFile" onchange="imgSelected(this)">
					<input type="submit" name="submit">
				</form>
			</div>
		</div>
	</div>
	<iframe name="nojump" style="display:none;"></iframe>
</div>
<script src="../libs/jquery-form.js"></script>
<script src="../js/c_account_info.js"></script>