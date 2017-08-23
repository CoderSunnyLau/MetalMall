<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<title>用户登录</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
	<jsp:include page="../components/header3.jsp">
		<jsp:param name="systemTitle" value="登录"/> 
	</jsp:include>
	<div class="page_body login_body">
		<div class="page_cnt login_cnt">
			<div class="box_wrap">
				<div class="login_box">
					<div class="box_title">登录</div>
					<div class="input_field" id="user_name">
						<span>账　号</span><input type="text" name="" />
						<i class="error"></i>
					</div>
					<div class="input_field" id="user_psd">
						<span>密　码</span><input type="password" name="">
						<i class="error"></i>
					</div>
					<div class="input_field user_valid" id="login_valid">
						<span>验证码</span><input type="text" name=""><i class="error"></i><img src="" />
					</div>
					<button class="dologin">登 录</button>
					<div class="row2">
						<a class="forget change_box" href="javascript:void(0);">忘记密码</a>
						<a class="register" href="./register.jsp">免费注册</a>
					</div>
				</div>
				<div class="forget_box">
					<div class="box_title">找回密码</div>
					<div class="input_field" id="phone_num">
						<span>手机号</span><input type="text" maxlength="11" name="" />
						<i class="error"></i>
					</div>
					<div class="input_field user_valid" id="forget_valid">
						<span>验证码</span><input type="text" name=""><i class="error"></i><button class="valid_btn">获取验证码</button>
					</div>
					<button class="next_step change_box">下一步</button>
					<div class="row2">
						<a class="register" href="#">免费注册</a>
						<a class="login change_box" href="javascript:void(0);">返回登录</a>
					</div>
				</div>
				<div class="setpsd_box">
					<div class="box_title">重置密码</div>
					<div class="input_field" id="set_psd">
						<span>设置新密码</span><input type="password" name="">
						<i class="error"></i>
					</div>
					<div class="input_field" id="confirm_psd">
						<span>确认新密码</span><input type="password" name="">
						<i class="error"></i>
					</div>
					<button>完成</button>
					<div class="row2">
						<a class="register" href="#">免费注册</a>
						<a class="login_2 change_box" href="javascript:void(0);">返回登录</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/system_login.js"></script>
</body>
</html>