<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=96">
<div class="cnt_header">
	<span>首页 > 系统管理 > 用戶管理 > 新增银行</span>
</div>
<div class="cnt_body">
	<p class="user_title">添加银行详情信息</p>
	<div class="fill_block">
		<p><span>登录名</span><input class="field" name="loginName" type="text"/></p>
		<p><span>密码</span><input class="field" name="password" type="password"/></p>
		<p><span>银行名称</span><input class="field" name="username" type="text" /></p>
		<p><span>简称</span><input class="field" name="miniName" type="text" /></p>
		<p>
			<span>地区</span>
			<select class="field" id="area" name="area">
				<option value="">请选择地区</option>
			</select>
		</p>
		<p><span>操作员名称</span><input class="field" name="operatorRealName" type="text" /></p>
		<p><span>手机号码</span><input class="field" name="phone" type="number" /></p>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
	</div>
</div>
<<script src="../libs/md5.js"></script>
<script>
	sysInit();
	
	$('.cnt_body').show();
	$.get('../data/config.json', function(res){
		optionConfigInit('area', res.area)
	});
	
	$('.submit').off();
	$('.submit').on('click', function(){
		var _params = getAllVal();
		console.log(_params)
		if(!_params){
			return;
		}else{
			_params.password = md5(_params.password);
			http.post('addBankUser', JSON.stringify(_params), function(res){
				if(res.saved){
					alert('添加成功！');
					jump('admin', 'banks');
				}
			});
		}
	});
	
</script>