<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>

<script src="../libs/excanvas.js"></script>
<input type="text" name="" id="verify_input" placeholder="请输入验证码"><i class="error"></i>
<div id="verify_img" style="width:115px;height:40px;">
	<canvas id="verifyCanvas" width="115" height="40" style="cursor: pointer;" title="点击更换验证码"></canvas>
</div>
<script src="../libs/gVerify.js"></script>
<script>
	var verifyCode = new GVerify("verify_img");
	var verifyInput = document.getElementById("verify_input");
	verifyInput.onblur = function(){
		var res = verifyCode.validate(verifyInput.value);
		if(res){
			verifyInput.nextSibling.innerHTML = "";
			verifyInput.nextSibling.className = "";
		}else{
			verifyInput.nextSibling.className = "error";
			if(verifyInput.value == ""){
				verifyInput.nextSibling.innerHTML = "请输入验证码";
			}else{
				verifyInput.nextSibling.innerHTML = "您输入的验证码有误";
			}
		}
	}
	verifyInput.onfocus = function(){
		verifyInput.nextSibling.innerHTML = "";
	}
</script>
