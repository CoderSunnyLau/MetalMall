<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
	.hide{display:none;}
	.tips{
		margin-top:30px;
		color:#999;
		border:1px dashed #DDD;
		padding-top:10px;
		text-indent:10px;
		float:left;
	}
	.tips p{line-height:35px;float:left;clear:both;padding:0 60px;}
	.credit_block, .tips{overflow:hidden;}
	.float{float:left;}
	span.tip{
		width:auto;
		color:#999;
		padding:0;
	}
	.sel_btn{
		width:260px;
		height:30px;
		display:inline-block;
		border:1px solid #DDD;
		margin:10px 10px 0 0;
		text-indent:10px;
		line-height:30px;
		color:#999;
		cursor:pointer;
		font-size:12px;
		overflow:hidden;
	}
</style>
<div class="cnt_header">
	<span>首页 > 资信中心 > 我的授信 > 申请授信</span>
</div>
<div class="cnt_body">
	<p class="user_title">企业授信</p>
	<div class="fill_block credit_block">
		<p class="select_bank">
			<span>银行：</span>
			<select id="sel_bank" onchange="bankChange(this)"><option value="">请选择银行</option></select>
		</p>
		<div class="select_bank">
			<span class="float">授信基础资料：</span>
			<form class="form" enctype="multipart/form-data" onsubmit="fileSubmit(this)" target="nojump" style="display:inline-block;">
				<input class="hide" type="text" name="userId">
				<input class="hide" type="text" name="useType" value="applyForBankCredit">
				<input class="hide" type="text" name="extraParameter">
				<input class="hide" type="file" name="uploadFile" onchange="imgSelected(this)">
				<input class="hide" type="submit" name="submit">
			</form>
			<div class="sel_btn float" onclick="selFile()">请点击此处选择文件</div>
			<span class="tip">请上传.zip或.rar压缩文件</span>
			<iframe name="nojump" class="hide"></iframe>
		</div>
		<button class="up_btn credit_add" onclick="uploadFile()">申 请</button>
		<div class="tips">
			<div>温馨提示：为了能加快审核，您上传的压缩包中，应当包含但不限于以下这些授信基础资料：</div><br>
			<div class="float">
				<p>1.营业制造</p>
				<p>2.组织机构代码证</p>
				<p>3.税务登记证</p>
				<p>4.法人代表证明书</p>
				<p>5.法人代表授权委托书</p>
				<p>6.法人代表身份证</p>
				<p>7.被授权人身份证</p>
				<p>8.公司章程</p>
				<p>9.注册验资报告</p>
				<p>10.董事会决议</p>
				<p>11.董事会签字样本</p>
			</div>
			<div class="float">
				<p>12.贷款卡及在其他银行授信情况说明</p>
				<p>13.实际控制人及财务负责人简历</p>
				<p>14.公司简介及经营情况介绍（包括公司经营产品及主要竞争对手、行业情况等）</p>
				<p>15.公司组织结构</p>
				<p>16.前五大供货商及销售商</p>
				<p>17.近期财务报表</p>
				<p>18.近三年审计报表</p>
				<p>19.纳税申报表</p>
				<p>20.纳税证明</p>
				<p>21.购销合同</p>
				<p>22.购销发票</p>
			</div>
		</div>
	</div>
</div>
<script src="../libs/jquery-form.js"></script>
<script>
sysInit();

var getData = {};
var successCallback = function(){
	$('[name="userId"]').val(USER.id);
	$.ajax({
		url: DOMAIN + '/getAllBanksNameAndId',
		type: 'GET',
		success: function(res){
			getData =  res;
			var bankList = [];
			for(i in res){
				bankList.push(i);
			}
			$('#sel_bank').html('<option value="">请选择银行</option>');
			optionConfigInit('sel_bank', bankList);
			$('.cnt_body').show();
		}
	});
}

var selFile = function(){
	if(!$('#sel_bank').val()){
		alert('请先选择银行。');
	}else{
		$('[name="uploadFile"]').trigger('click');
	}
}

var bankChange = function(el){
	$el = $(el);
	$('[name="extraParameter"]').val(getData[$el.val()]);
}

var imgSelected = function(el){
	if(el.value.indexOf('.zip') > 0 || el.value.indexOf('.rar') > 0){
		$('.sel_btn').html(el.value);
		$('.up_btn').removeClass('sent').removeAttr('disabled').html('申 请');
	}else{
		alert('只能上传.zip或.rar格式的压缩文件。');
		el.value = "";
		$('.sel_btn').html("请点击此处选择文件");
		return false;
	}
}

var uploadFile = function(){
	if($('[name="uploadFile"]').val()){
		$('[name="submit"]').trigger('click');
	}else if(!$('#sel_bank').val()){
		alert('请选择银行。');
	}else{
		alert('请选择需要上传的文件。');
		return false;
	}
}

var fileSubmit = function(el){
	var $el = $(el);
	$('.up_btn').addClass('sent').attr('disabled', 'disabled').html('正在提交...');
	$el.ajaxSubmit({
	    type: 'post',
	    url: DOMAIN + '/uploadFileForUser',
	    dataType: 'JSON',
	    success: function(res){
	    	console.log(res)
	        if(res.saved){
	        	alert('提交成功！');
	        	$('.up_btn').html('提交成功');
	        	jump('company','credit');
	        }else{
	        	alert('操作失败，请重试。');
	        	$('.up_btn').removeClass('sent').removeAttr('disabled').html('申 请');
	        }
	    },
	    error: function(){
        	alert('操作失败，请重试。');
        	$('.up_btn').removeClass('sent').removeAttr('disabled').html('申 请');
        }
	});
}
</script>