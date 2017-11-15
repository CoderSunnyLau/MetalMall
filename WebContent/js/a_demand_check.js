sysInit();

var successCallback = function(){
	if($('.cnt_body').hasClass('demand_check')){
		$.ajax({
			url: DOMAIN + '/getAllReqFormsByPageOnBackend',
			type: 'GET',
			data: {
				'pageIndex': getSysUrlParam('pageIndex') || 0,
				'pageSize': 20
			},
			success: function(res){
				$('.cnt_body').show();
				for(var i = 0; i < res.content.length; i++){
					var demand = res.content[i];
					var _class = i % 2 == 0 ? '' : 'odd';
					var _operation = demand.approval == '待审核' ? '<a class="op pass">通过</a>|' : '';
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
			}
		});
		
		$('.demands').on('click', '.op', function(){
			if($(this).hasClass('pass')){
				$.ajax({
					url: DOMAIN + '/approvalRequirementForm',
					data: {'formId': parseInt($(this).parent().attr('demandId'))},
					type:'POST',
					dataType: 'json',
					success: function(res){
						console.log(res)
						if(res.success){
							alert('操作成功！');
							reload('admin');
						}
					}
				});
			}else{
				$('.cnt').load('../admin/' + $(this).attr('jump') + '.jsp');
				setUrlParameter('page', $(this).attr('jump'));
			}
		});
	}else{
	}
}