$.get('../data/bank_home.json', function(res){
	var param = [
		'applyCount',
		'creditedCompanyCount',
		'creditedAmount',
		'finishedOrderAmount'
	];
	doFill(res, param, 'bh_');
});