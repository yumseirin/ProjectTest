<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import=" com.seirin.util.MessageUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
<!---------------------------  复选框实现单选js文件  ------------------------------------>
<script type="text/javascript" src="<%=basePath%>js/form.js"
	charset="utf-8"></script>

<script type="text/javascript">
    var path ="<%=basePath%>";

	//进入修改页面
	function updateRole() {

		var num = getCheckBoxValue('role_id');
		if (num == null || num == "") {
			alert("请选择要修改的角色");
			return false;
		} else {
			window.location.href = path
					+ "roleControl/getAuthIdByRoleid.action?role_id=" + num;
		}
	}
	//禁用角色
	function disableRole() {

		var num = getCheckBoxValue('role_id');
		var role_state = document.getElementById('role_state').innerHTML;
		if (num == null || num == "") {
			alert("请选择要禁用的角色");
			return false;
		} else if (role_state =='无效') {
			alert("该角色已是无效状态");
			return false;
		} else {
			window.location.href = path
					+ "roleControl/disableRoleById.action?role_id=" + num;
		}
	}
	//启用角色
	function enableRole() {

		var num = getCheckBoxValue('role_id');
		var role_state = document.getElementById('role_state').innerHTML;
		if (num == null || num == "") {
			alert("请选择要启用的角色");
			return false;
		//} else if (role_state =='有效') {
			//alert("该角色已是有效状态");
			//return false;
		} else {
			window.location.href = path
					+ "roleControl/enableRoleById.action?role_id=" + num;
		}
	}
</script>
</head>
<body>

	<div class="title">
		<h2>角色管理</h2>
	</div>
	<div class="query">
		<div class="query-conditions ue-clear">
			<!-----------    按钮  start   ---------->
			<div style="position: absolute; right: 0; margin: -45px 30px 0 0">

				<a href="<%=basePath%>roleControl/gotoAddRole.action" id="add"
					class="abtn"> <img src="<%=basePath%>images/add_btn.png"
					name="Image1" border="0" id="Image1" />
				</a> <a href="#" id="update" class="abtn"> <img
					src="<%=basePath%>images/revise_btn.png" border="0" id="Image2"
					onclick="updateRole()" />
				</a> <a href="#" id="disable" class="abtn"> <img
					src="<%=basePath%>images/disable_btn.png" name="Image3" border="0"
					id="Image3" onclick="disableRole()" />
				</a> <a href="#" id="enable" class="abtn"> <img
					src="<%=basePath%>images/enable_btn.png" name="Image4" border="0"
					id="Image4" onclick="enableRole()" />
				</a>

			</div>
			<!------------ 按钮  end ---------->
		</div>
	</div>
	<div class="table-box">
		<table>
			<tr>
				<th class="num"></th>
				<th class="name">角色名称</th>
				<th class="process">角色说明</th>
				<th class="process">角色状态</th>
			</tr>
			<c:forEach items="${requestScope.roleList}" var="role">
				<tr>
					<td class="num"><input type="checkbox" name="role_id"
						id="role_id" value="${role.role_id}"
						onClick="javascript:chooseOne(this,'role_id');"></td>
					<td class="name">${role.role_name}</td>
					<td class="name">${role.role_description}</td>
					<td class="name" id="role_state"><font></font>
					<c:if test="${role.role_state == 0}">有效</c:if><c:if test="${role.role_state == 1}">无效</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>

</html>