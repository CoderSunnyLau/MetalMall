<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 系统管理 > 参数管理 > 新增</span>
</div>
<div class="cnt_body parameter_add">
	<p class="user_title">新增/修改参数信息</p>
	<div class="fill_block pdts_pics">
		<div class="pics_row"><span>参数键名</span><input class="field" name="configKey" placeholder="填写参数Key"></div>
		<div class="pics_row"><span>参数值</span><input class="field" name="configValue" placeholder="填写参数Value"></div>
		<div class="pics_row"><span>参数类别</span><input class="field" name="configType" placeholder="填写参数type"></div>
		<div class="pics_row"><span>参数描述</span><textarea class="field" name="configDescription" placeholder="填写参数描述，100字以内。"></textarea></div>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
	</div>
</div>
<script>
sysInit();

if($('.cnt_body').hasClass('parameter_add')){
	$('.cnt_body').show();
	var postData={};

	$('.submit').click(function(){
		$(this).addClass('sent').html('正在提交...');
		
		postData = {
			"id":null,
			"configKey":getVal("configKey"),
			"configValue":getVal("configValue"),
			"configType":getVal("configType"),
			"configDescription":getVal("configDescription")
		}
		doSysKvCfgInfo();
	});
	
	//doSysKvCfgInfo
	var doSysKvCfgInfo = function(){
		$.ajax({
			url: DOMAIN + "/addSystemConfig",
			type: "POST",
			data: JSON.stringify(postData),
			dataType: 'JSON',
			contentType : "application/json ; charset=utf-8", 
			success: function(res){
				if(res.saved){
					alert('提交成功！');
					jump('admin','parameters');
				}else{
					alert('提交失败。');
					$('.submit').removeAttr('disabled').removeClass('sent');
				}
			},
			error: function(res){
				alert('提交失败，请重新提交。');
				$('.submit').removeAttr('disabled').removeClass('sent');
			}
		});
	}
}
</script>