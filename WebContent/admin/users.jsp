<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="cnt_header">
	<span>首页 > 系统管理 > 用户管理</span>
</div>
<div class="cnt_body">
	<div class="part users">
		<div class="search_bar">
		 	<div class="add_btn">
				<button class="white_btn" jump="user_add_admin">新增管理员</button>
				<button class="white_btn" jump="bank_add">新增银行用户</button>
			</div>
			<div class="search">
				<input type="text" placeholder="请输入关键词" />
				<button>搜 索</button>
			</div></div>
		<div class="orders_list">
			<table>
				<thead>
					<tr>
						<th>用户角色</th>
						<th>用户名称</th>
						<th>用户姓名</th>
						<th width="350">所属机构</th>
					</tr>
				</thead>
				<tbody class="rows user_list"></tbody>
			</table>
		</div>
		<jsp:include page="../components/page.jsp"></jsp:include>
	</div>
</div>
<script>
	cntLoad($('.add_btn [jump="user_add_admin"]'));
	cntLoad($('.add_btn [jump="bank_add"]'));
	sysInit();
	$.ajax({
		url: DOMAIN + '/getAllRoleUsers',
		type: 'GET',
		data: {
			pageIndex: getSysUrlParam('pageIndex') || 0,
			pageSize: 20
		},
		success: function(res){
			$('.cnt_body').show();
			$('.user_list').empty();
			for(var i = 0; i < res.content.length; i++){
				var item = res.content[i];
				var _role = item.roleType == 'company' ? '企业用户' : (item.roleType == 'bank' ? '银行用户' : '管理员');
				var _class = i % 2 == 0 ? '' : 'odd';
				$('.user_list').append(
					'<tr class="' + _class + 
					'"><td>' + _role +
					'</td><td>' + item.loginName +
					'</td><td>' + item.operatorRealName +
					'</td><td>' + item.username + '</td></tr>'
				);
			}
			pageInit(res.totalPages);
		}
	});
</script>