<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<style>
	.update{
		float:right;
		font-size:12px;
		color:#888;
		margin-right:15px;
	}
</style>
<div class="cnt_header">
	<span>首页 > 系统管理 > 参数管理 > 修改</span>
</div>
<div class="cnt_body">
	<p class="user_title">修改参数信息 <span class="update">更新时间：<i class="updateTime"></i></span></p>
	<div class="fill_block pdts_pics">
		<div class="pics_row"><span>参数键名</span><input class="field" name="configKey" placeholder="填写参数Key"></div>
		<div class="pics_row"><span>参数值</span><textarea class="field" name="configValue" placeholder="填写参数Value"></textarea></div>
		<div class="pics_row"><span>参数类别</span><input class="field" name="configType" placeholder="填写参数type"></div>
		<div class="pics_row"><span>参数描述</span><textarea class="field" name="configDescription" placeholder="填写参数描述，100字以内。"></textarea></div>
	</div>
	<div class="button_block pay_add_btn">
		<button class="submit">提　交</button>
	</div>
</div>

<script>
sysInit();

var postData={};
var paramId = getSysUrlParam('paramId');

$.ajax({
	url: DOMAIN + '/getOneSystemConfig',
	type: 'GET',
	data: {
		id: paramId
	},	success: function(res){
		console.log(res)
		postData = res;
		$('.field').each(function(){
			$(this).val(res[$(this).attr('name')]);
		});
		doFill(res, ['updateTime'], '');
		$('.cnt_body').show();
	}
});

$('.submit').click(function(){
	var _f = false;
	$('.field').each(function(){
		if($(this).val()){
			_f = true;
		}else{
			_f = false;
			alert('信息输入不全，请填写完成后再次提交。');
			return false;
		}
	});
	if(_f){
		$(this).addClass('sent').html('正在提交...');
		
		postData = {
			"id": Number(paramId),
			"configKey":getVal("configKey"),
			"configValue":getVal("configValue"),
			"configType":getVal("configType"),
			"configDescription":getVal("configDescription")
		}
		$.ajax({
			url: DOMAIN + '/editSystemConfig',
			type: 'POST',
			data: JSON.stringify(postData),
			dataType: 'JSON',
			contentType : "application/json ; charset=utf-8",
			success: function(res){
				if(res.saved){
					alert('修改成功！');
					jump('admin','parameters', 'paramId');
				}else{
					alert('提交失败。');
					$('.submit').removeAttr('disabled').removeClass('sent').html('提 交');
				}
			},
			error: function(res){
				alert('提交失败，请重新提交。');
				$('.submit').removeAttr('disabled').removeClass('sent').html('提 交');
			}
		});
	}
});
</script>