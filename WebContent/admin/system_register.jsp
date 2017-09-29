<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<title>企业注册</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/system_login.css">
</head>
<body>
	<jsp:include page="../components/header.jsp">
		<jsp:param name="systemTitle" value="注册"/> 
	</jsp:include>
	<div class="page_body">
		<div class="page_cnt">
			<div class="cnt_header">
				<span>首页 > 企业注册</span>
			</div>
			<div class="register_body">
				<div class="company_info input_box">
					<p>企业信息</p>
					<div class="input_field">
						<span>企业全称</span><input type="text" name="" />
					</div>
					<div class="input_field">
						<span>企业简称</span><input type="text" name="">
					</div>
					<div class="input_field">
						<span>行业类别</span>
						<select>
							<option value="有限责任公司">有限责任公司</option>
							<option value="股份责任公司">股份责任公司</option>
						</select>
					</div>
					<div class="input_field">
						<span>法人代表</span><input type="text" name="">
					</div>
					<div class="input_field">
						<span>统一信用号</span><input type="text" name="">
					</div>
					<div class="input_field">
						<span>上传资料</span><input type="file" name="">
					</div>
				</div>
				<div class="user_info input_box">
					<p>账号信息</p>
					<div class="user_name input_field">
						<span>手机号码</span><input type="text" name="" />
					</div>
					<div class="user_valid input_field">
						<span>验证码</span><input type="text" name=""><button>获取验证码</button>
					</div>
					<div class="user_psd input_field">
						<span>设置密码</span><input type="password" name="">
					</div>
					<div class="user_psd input_field">
						<span>请再次输入密码</span><input type="password" name="">
					</div>
				</div>
				<button class="register_submit">提交注册</button>
			</div>
		</div>
	</div>
</body>
</html>