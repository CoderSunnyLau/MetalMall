<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 资信中心 > 企业授信</span>
</div>
<div class="cnt_body bank">
	<div class="part">
		<div class="search_bar">
			<!--<div class="add_btn"><button class="white_btn" jump="credit_add">新增</button></div>-->
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div>
		</div>
		<div class="pdts_list">
			<table>
				<thead>
					<th style="width:200px;">企业名称</th>
					<th>企业区域</th>
					<th>联系电话</th>
					<th>供货笔数</th>
					<!-- <th>供货交易额</th> -->
					<th>采购笔数</th>
					<!-- <th>采购交易额</th> -->
					<th>银行名称</th>
					<th>授信额度</th>
					<th>状态</th>
					<th style="width:155px;">操作</th>
				</thead>
				<tbody class="rows credit_list"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	sysInit();
	cntLoad($('[jump="credit_add"]'), 'bank');
	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getCreditInfoByBankId',
			type: 'GET',
			data: {
				id: USER.id,
				pageIndex: getUrlParameter('pageIndex') || 0,
				pageSize: 20
			},
			success: function(res){
				$('.cnt_body').show();
				$('.credit_list').empty();
				if(res.content.length){
					for(var i = 0; i < res.content.length; i++){
						var item = res.content[i];
						var _class = i % 2 == 0 ? '' : 'odd';
						var _operation = item.status == '申请中' ? '<a class="op pass">通过</a>|<a class="to_fix op" jump="credit_fix">修改</a>|' : '';
						var _download = item.clientEssentialFiles ? '<a class="op download" href="' + item.clientEssentialFiles + '">下载附件</a>|' : '';
						$('.credit_list').append(
							'<tr class="' + _class + 
							'"><td>' + item.companyName +
							'</td><td>' + item.companyArea +
							'</td><td>' + item.phone +
							'</td><td>' + item.companySalesCount +
							'</td><td>' + item.companyBuyCount +
							'</td><td>' + item.bankName +
							'</td><td class="creditAmount">' + item.creditAmount +
							'</td><td>' + item.status +
							'</td><td creditId="' + item.id + '">' + _operation + 
							//'<a class="op to_fix">修改</a>|'
							_download + '<a class="op to_del">删除</a></td></tr>'
						);
					}
				}else{
					noRes($('.credit_list'));
				}
				cntLoad($('.to_fix[jump="credit_fix"]'), 'bank');
				$('.credit_list').on('click', '.op', function(){
					var _this = $(this),
					creditId = _this.parent().attr('creditId'),
					_postUrl, postData = {};
					if($(this).hasClass('to_fix')){
						console.log(creditId)
						setUrlParameter('creditId', creditId);
					}else{
						if($(this).hasClass('pass')){
							_postUrl = '/approveCreditByBank';
							postData = {
									creditInfoId: creditId,
									creditAmount: Number(_this.parents('tr').find('.creditAmount').html())
							};
						}else if($(this).hasClass('to_del')){
							_postUrl = '/deleteCreditInfo';
							postData = {
									creditInfoId: creditId
							}
						}
						$.ajax({
							url: DOMAIN + _postUrl,
							type: 'POST',
							data: postData,
							dataType: 'JSON',
							success: function(r){
								alert('操作成功！');
								reload('bank');
							}
						});
					}
				});
				pageInit(res.totalPages);
			}
		});
	}
</script>