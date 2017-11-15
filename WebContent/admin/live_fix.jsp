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
	<span>首页 > 系统管理 > 直播管理 > 修改</span>
</div>
<div class="cnt_body">
	<p class="user_title">修改直播信息 <span class="update">更新时间：<i class="updateTime"></i></span></p>
	<div class="fill_block pdts_pics">
		<div class="pics_row"><span>直播标题</span><input class="field" name="title" placeholder="填写直播标题"></div>
		<div class="pics_row"><span>直播文字</span><textarea class="field" name="description" placeholder="填写直播内容，50字左右。"></textarea></div>
	</div>
	<div class="button_block pay_add_btn">
		<button class="submit">提　交</button>
	</div>
</div>

<script>
sysInit();

var postData={};
var liveId = getSysUrlParam('liveId');

$.ajax({
	url: DOMAIN + '/getOneMarketBoardInfo',
	type: 'GET',
	data: {
		id: liveId
	},
	success: function(res){
		postData = res;
		$('.field').each(function(){
			if($(this).is('i')){
				$(this).html(res[$(this).attr('name')]);
			}else{
				$(this).val(res[$(this).attr('name')]);
			}
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
			"id": liveId,
			"title":getVal("title"),
			"description":getVal("description")
		}
		$.ajax({
			url: DOMAIN + '/editMarketBoard',
			type: 'POST',
			data: JSON.stringify(postData),
			dataType: 'JSON',
			contentType : "application/json ; charset=utf-8",
			success: function(res){
				if(res.saved){
					alert('修改成功！');
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
});
</script>