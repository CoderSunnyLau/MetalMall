$.get('../data/bank_home.json', function(res){
	res.creditedAmount = parseInt(res.creditedAmount / 1000);
	res.finishedOrderAmount = parseInt(res.finishedOrderAmount / 1000);
	var param = [
		'applyCount',
		'creditedCompanyCount',
		'creditedAmount',
		'finishedOrderAmount'
	];
	doFill(res, param, 'bh_');
});