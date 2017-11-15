sysInit();

var successCallback = function(){
	if($('.cnt_body').hasClass('demand')){
		$.ajax({
			url: DOMAIN + '/getAllReqFormsByPageOnBackend',
			type: 'GET',
			data: {
				'pageIndex': getSysUrlParam('pageIndex') || 0,
				'pageSize': 20
			},
			success: function(res){
				$('.cnt_body').show();
				$('.demands').empty();
				for(var i = 0; i < res.content.length; i++){
					var demand = res.content[i];
					var _class = i % 2 == 0 ? '' : 'odd';
					var _operation = demand.approval == '已审核' ? '<a class="op apply_list">申请列表</a>|' : '';
					_operation = (demand.status == '已申请' ?  '<a class="op deal">处理</a>|' : '') +  _operation;
					$('.demands').append(
						'<tr class="' + _class + 
						'"><td>' + demand.name + 
						'</td><td>' + demand.productType +
						'</td><td>' + demand.specification +
						'</td><td>' + demand.material +
						'</td><td>' + demand.quantityReqrm +
						'</td><td>' + demand.minBudget + '~' + demand.maxBudget +
						'</td><td>' + demand.addTime +
						'</td><td>' + demand.approval +
						'</td><td>' + demand.status +
						'</td><td>' + demand.applicantCount +
						'</td><td demandId="' + demand.id + '">' + _operation + '<a class="op view" jump="demand_detail">详情</a></td></tr>'
					);
				}
				pageInit(res.totalPages);
			}
		});
		
		$('.demands').on('click', '.op', function(){
			var demandId = $(this).parent().attr('demandId')
			if($(this).hasClass('deal')){
				var postData = {
					'formId': parseInt(demandId),
					'status': '已完成'
				}
				$.ajax({
					url: DOMAIN + "/changeFormStatus",
					type: "POST",
					data: postData,
					dataType: 'JSON',
					success: function(res){
						if(res.success){
							alert('提交成功！');
							reload('admin');
						}else{
//							alert(res.message);
						}
					},
					error: function(res){
						alert('操作失败，请重试。');
					}
				});
			}else if($(this).hasClass('view')){
				jump('admin', {
					page: 'demand_detail',
					demandId: demandId,
					prepage: 'demand'
				});
			}else if($(this).hasClass('apply_list')){
				jump('admin', {
					page: 'demand_list',
					demandId: demandId
				});
			}
		});
	}else{
	}
}