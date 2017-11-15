<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<title>管理员用户登录-易金所</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/login.css?v=17">
</head>
<body>
	<jsp:include page="../components/header.jsp">
		<jsp:param name="systemTitle" value="易金所"/> 
	</jsp:include>
	<div class="page_body login_body system_login">
		<div class="main_width login_cnt">
			<div class="box_wrap">
				<div class="login_box vip_box">
					<div class="box_title">会员登录</div>
					<div class="input_field check_input" id="user_name">
						<span>账　号</span><input type="text" name="userName" placeholder="请输入用户名/手机号" />
						<i class="error"></i>
					</div>
					<div class="input_field check_input" id="user_psd">
						<span>密　码</span><input type="password" name="pwd" placeholder="请输入密码" />
						<i class="error"></i>
					</div>
					<div class="input_field user_valid" id="login_valid">
						<span>验证码</span>
						<jsp:include page="../components/verify.jsp"></jsp:include>
					</div>
						<a class="remember" href="javascript:void(0);"><i></i>记住密码</a>
					<button class="dologin pwd_login">登 录</button>
					<div class="row2">
						<a class="forget change_box" href="javascript:void(0);">忘记密码</a>
						<a class="register" href="../web/register.jsp">免费注册</a>
					</div>
					<a class="login_by_phone change_box" href="javascript:void(0);">手机号验证登录</a>
				</div>
				<div class="forget_box">
					<div class="box_title">找回密码</div>
					<div class="input_field check_input" id="phone_num">
						<span>手机号</span><input type="text" maxlength="11" name="" placeholder="请输入手机号" />
						<i class="error"></i>
					</div>
					<div class="input_field user_valid check_input" id="forget_valid">
						<span>验证码</span><input type="text" name="" placeholder="请输入验证码"><i class="error"></i><button class="valid_btn">获取验证码</button>
					</div>
					<button class="next_step change_box">下一步</button>
					<div class="row2">
						<a class="register" href="../web/register.jsp">免费注册</a>
						<a class="login change_box" href="javascript:void(0);">返回登录</a>
					</div>
				</div>
				<div class="setpsd_box">
					<div class="box_title">重置密码</div>
					<div class="input_field check_input" id="set_psd">
						<span>设置新密码</span><input type="password" name="" placeholder="请输入新密码" />
						<i class="error"></i>
					</div>
					<div class="input_field check_input" id="confirm_psd">
						<span>确认新密码</span><input type="password" name="" placeholder="请再次输入新密码" />
						<i class="error"></i>
					</div>
					<button>完 成</button>
					<div class="row2">
						<a class="register" href="../web/register.jsp">免费注册</a>
						<a class="login_2 change_box" href="javascript:void(0);">返回登录</a>
					</div>
				</div>
				<div class="phone_box login_box" style="display:none;">
					<div class="box_title">会员登录</div>
					<div class="input_field check_input" id="phone_num2">
						<span>手机号</span><input type="text" maxlength="11" name="" placeholder="请输入手机号" />
						<i class="error"></i>
					</div>
					<div class="input_field user_valid check_input" id="forget_valid2">
						<span>验证码</span><input type="text" class="check_code" placeholder="请输入验证码"><i class="error"></i><button class="valid_btn">获取验证码</button>
					</div>
					<button class="dologin phone_login">登 录</button>
					<a class="login_by_phone change_box" href="javascript:void(0);">账号密码登录</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp">
		<jsp:param value="false" name="show"/>
	</jsp:include>
	<script src="../js/login.js"></script>
</body>
</html>