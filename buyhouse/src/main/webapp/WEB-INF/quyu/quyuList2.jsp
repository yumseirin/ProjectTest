<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>css/base.css" />
<link rel="stylesheet" href="<%=basePath%>css/info-mgt.css" />
<link rel="stylesheet" href="<%=basePath%>css/WdatePicker.css" />
</head>
<body>

	<div class="title">
		<h2>员工权限管理</h2>
	</div>
	<div class="query">
		<div class="query-conditions ue-clear">
			<div class="conditions staff ue-clear">
				<label>用户帐号：</label> <input type="text" placeholder="可以直接输入或选择" />
				<a href="javascript:;" class="confirm">查询</a>
			</div>

			<!-- 按钮 -->
			<div style="position: absolute; right: 0; margin: -45px 30px 0 0">

				<a href="javascript:void(0);" id="add" class="abtn"> <img
					src="<%=basePath%>images/add_btn.png" name="Image1" border="0" id="Image1" />
				</a> <a href="#" id="update" class="abtn"> <img
					src="<%=basePath%>images/revise_btn.png" border="0" id="Image2" />
				</a> <a href="#" id="disable" class="abtn"> <img
					src="<%=basePath%>images/disable_btn.png" border="0" id="Image4" />
				</a> <a href="#" id="able" class="abtn"> <img
					src="<%=basePath%>images/enable_btn.png" border="0" id="Image5" />
				</a>


				<sec:authorize ifAllGranted="ROLE_ADMIN_RESTPASS">
					<a href="updatePassword.html" id="restPassword" class="abtn"
						style="width: 80px;"> <img src="<%=basePath%>images/ResetPassword.png"
						border="0" id="Image6"
						onmouseover="MM_swapImage('Image6','','${cp }/images/ResetPassword_1.png',1)"
						onmouseout="MM_swapImgRestore()" />
					</a>
				</sec:authorize>
			</div>

		</div>
	</div>
	<div class="table-box">
		<table>
			<thead>
				<tr>
					<th class="num"><input type="checkbox" name=""></th>
					<th class="name">名称</th>
					<th class="process">账户</th>
					<th class="node">角色</th>
					<th class="time">状态</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="num"><input type="checkbox" name=""></td>
					<td class="name">肖海鹏</td>
					<td class="process">xiaohaipeng</td>
					<td class="node">讲师</td>
					<td class="time">有效</td>

				</tr>
				<tr>
					<td class="num"><input type="checkbox" name=""></td>
					<td class="name">王小莉</td>
					<td class="process">wangxiaoli</td>
					<td class="node">普通用户</td>
					<td class="time">有效</td>

				</tr>
				<tr>
					<td class="num"><input type="checkbox" name=""></td>
					<td class="name">肖海鹏</td>
					<td class="process">xiaohaipeng</td>
					<td class="node">讲师</td>
					<td class="time">有效</td>

				</tr>
				<tr>
					<td class="num"><input type="checkbox" name=""></td>
					<td class="name">张国建</td>
					<td class="process">zhangguojian</td>
					<td class="node">普通用户</td>
					<td class="time">无效</td>

				</tr>
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear"></div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript">
	$(".select-title").on("click", function() {
		$(".select-list").hide();
		$(this).siblings($(".select-list")).show();
		return false;
	})
	$(".select-list").on(
			"click",
			"li",
			function() {
				var txt = $(this).text();
				$(this).parent($(".select-list")).siblings($(".select-title"))
						.find("span").text(txt);
			})

	$('.pagination').pagination(100, {
		callback : function(page) {
			alert(page);
		},
		display_msg : true,
		setPageNo : true
	});

	$("tbody").find("tr:odd").css("backgroundColor", "#eff6fa");

	showRemind('input[type=text], textarea', 'placeholder');
</script>
</body>
</html>