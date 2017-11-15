<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 系统管理 > 直播管理 > 新增</span>
</div>
<div class="cnt_body cnt_live_add">
	<p class="user_title">新增/修改直播信息</p>
	<div class="fill_block pdts_pics">
		<div class="pics_row"><span>直播标题</span><input name="title" placeholder="填写直播标题"></div>
		<div class="pics_row"><span>直播文字</span><textarea name="description" placeholder="填写直播内容，50字左右。"></textarea></div>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
	</div>
</div>
<script>
sysInit();

if($('.cnt_body').hasClass('cnt_live_add')){
	$('.cnt_body').show();
	var postData={};

	$('.submit').click(function(){
		$(this).addClass('sent').html('正在提交...');
		
		postData = {
			"id":null,
			"title":getVal("title"),
			"description":getVal("description")
		}
		doLiveInfo();
	});
	
	//doLiveInfo
	var doLiveInfo = function(){
		$.ajax({
			url: DOMAIN + "/addMarketBoard",
			type: "POST",
			data: JSON.stringify(postData),
			dataType: 'JSON',
			contentType : "application/json ; charset=utf-8", 
			success: function(res){
				if(res.saved){
					alert('提交成功！');
					jump('admin','live');
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