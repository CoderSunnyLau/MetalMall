<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_account.css?a=5">
<div class="cnt_header">
	<span>首页 > 系统管理 > 修改密码</span>
</div>
<div class="cnt_body c">
	<p class="user_title">当前完成进度</p>
	<div class="rate_block">
		<div class="rate_line">
			<p class="check done"><i></i><span>验证身份</span></p>
			<div><i></i><span>修改登录密码</span></div>
			<div><i></i><span>完成</span></div>
		</div>
	</div>
<div class="pwd_cnt fill_block">
		<p class="input_row"><span>请输入原密码：</span><input class="old_pwd" type="password" /></p>
		<p class="input_row"><span>请输入新密码：</span><input class="new_pwd" type="password" /></p>
		<p class="input_row"><span>请再次输入新密码：</span><input class="re_pwd" type="password" /></p>
		<p class="input_row verify">
			<span>验证码：</span>
			<jsp:include page="../components/verify.jsp"></jsp:include>
			<i class="change_verify">看不清？点击图片换一张</i>
		</p>
		<button class="pwd_fix">提　交</button>
		<!-- <span class="check_tip">无法验证身份？试试<i>自助申诉</i></span> -->
	</div>
</div>
<script src="../libs/md5.js"></script>
<script>
	$('.cnt_body').show();
	
	sysInit();
	var successCallback = function(){
		$('.pwd_fix').click(function(){
			var _finished = false;
			$('.input_row').each(function(){
				if(!$(this).find('input').val()){
					console.log($(this))
					if($(this).find('input').attr('id') == "verify_input"){
						alert('请输入验证码');
						_finished = false;
						return false;
					}else{
						alert($(this).find('span').html());
						_finished = false;
						return false;
					}
				}else if($('.new_pwd').val() != $('.re_pwd').val()){
					alert('两次输入的密码不一致。');
					_finished = false;
					return false;
				}else{
					_finished = true;
				}
			});
			if(_finished){
				$.ajax({
					url: DOMAIN + '/changeUserPasswrod',
					type: 'POST',
					data: {
						userId: USER.id,
						newPassword: md5($('.new_pwd').val()),
						oldPassword: md5($('.old_pwd').val())
					},
					dataType: 'json',
					success: function(res){
						if(res.saved){
							alert('修改成功！');
							reload('bank');
						}else{
							alert('密码错误。');
						}
					}
				});
			}
		});
	}
</script>