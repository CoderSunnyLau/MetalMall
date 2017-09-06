<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<div class="page_box">
	<button class="near_page page_btn">上一页</button>
	<ul class="pages">
		<li class="page">1</li>
		<li class="page crr_page">2</li>
		<li class="page">3</li>
		<li class="page">4</li>
		<li class="page">5</li>
	</ul>
	<button class="near_page page_btn">下一页</button>
	<div class="change_page">
		<span>到</span><input type="number" /><span>页</span>
		<button class="page_btn">确 定</button>
	</div>
</div>