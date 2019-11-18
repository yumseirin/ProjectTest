<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	//按条件查询
	function submitPostion() {

		var role_id = $("#role_id").val();
		var department_id = $("#department_id").val();

		//如果页面上area_id和department_id是“”时，就提交不到后台的方法报400错
		//表单的action提交
		$("#form1").submit();
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
				<th class="name">人(数量)</th>
				<th class="process">角色说明</th>
				<th class="process">角色状态</th>
			</tr>
			<c:forEach items="${requestScope.roleList}" var="role">
				<tr>
					<td class="num"><input type="checkbox" name="role_id"
						id="role_id" value="${role.role_id}"
						onClick="javascript:chooseOne(this,'role_id');"></td>
					<td class="name">${role.role_name}</td>
					<td class="name">3</td>
					<td class="process">${role.role_description}</td>
					<td class="process"><c:if test="${role.role_state == 0}">
					 有效
					 </c:if> <c:if test="${role.role_state == 1}">
					 无效
					 </c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>