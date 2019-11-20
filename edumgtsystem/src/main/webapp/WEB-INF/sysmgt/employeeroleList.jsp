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
<style type="text/css">
.chaxunbtn {text-decoration: none;border: solid 1px;	}
.chaxunbtn {display:inline-table;line-height:24px;padding:0 9px;border-radius:2px;font-family:Arial, Helvetica, sans-serif !important;}
.chaxunbtn {color: #000000;border-color:#8EB2D2; background:#eaf4fa;}
.chaxunbtn :hover {color:#023054;border-color:#8EB2D2;background:#B8DFFB;}
</style>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
<!---------------------------  复选框实现单选js文件  ------------------------------------>
<script type="text/javascript" src="<%=basePath%>js/form.js"
	charset="utf-8"></script>

<script type="text/javascript">
    var path ="<%=basePath%>";

	//进入修改页面
	function updateEmployeeRole() {

		var num = getCheckBoxValue('employee_id');
		if (num == null || num == "") {
			alert("请选择要修改的员工");
			return false;
		} else {
			window.location.href = path
					+ "employeeRoleControl/gotoUpdateEmployeeRole.action?employee_id="
					+ num;
		}
	}
	//禁用员工
	function disableEmployee() {

		var num = getCheckBoxValue('employee_id');
		var status = document.getElementById('employee_status').innerHTML;
		if (num == null || num == "") {
			alert("请选择要禁用的员工");
			return false;
		} else if (status == '禁用') {
			alert("该员工已是禁用状态");
			return false;
		} else {
			window.location.href = path
					+ "employeeRoleControl/disableEmployeeById.action?employee_id="
					+ num;
		}
	}
	//启用员工
	function enableEmployee() {

		var num = getCheckBoxValue('employee_id');
		var status = document.getElementById('employee_status').innerHTML;
		if (num == null || num == "") {
			alert("请选择要启用的员工");
			return false;
		} else if (status == '可用') {
			alert("该员工已是可用状态");
			return false;
		} else {
			window.location.href = path
					+ "employeeRoleControl/enableEmployeeById.action?employee_id="
					+ num;
		}
	}
	//修改密码
	function updateEmployeePwd() {

		var num = getCheckBoxValue('employee_id');
		if (num == null || num == "") {
			alert("请选择要修改密码的员工");
			return false;
		} else {
			window.location.href = path
					+ "employeeRoleControl/gotoUpdateEmployeePwd.action?employee_id="
					+ num;
		}
	}
	//按条件查询
	function submitName() {
		//表单的action提交
		$("#form1").submit();
	}
</script>
</head>
<body>

	<div class="title">
		<h2>员工权限管理</h2>
	</div>
	<div class="query">
		<div class="query-conditions ue-clear">
			<!-----------    查询条件  start   ---------->
			<div>
				<form
					action="<%=basePath%>employeeRoleControl/selectEmployeeRole.action"
					method="post" id="form1">
					用户姓名：<input type="text" id="employee_name" name="employee_name"
						class="{required:true}" maxlength="16" /> &nbsp;&nbsp;&nbsp; <a
						href="javascript:submitName()" class="chaxunbtn">查询</a>
				</form>
			</div>
			<!-----------    查询条件  end   ---------->
			<!-----------    按钮  start   ---------->
			<div style="position: absolute; right: 0; margin: -45px 30px 0 0">


				<a href="#" id="update" class="abtn"> <img
					src="<%=basePath%>images/revise_btn.png" border="0" id="Image1"
					onclick="updateEmployeeRole()" />
				</a> <a href="#" id="disable" class="abtn"> <img
					src="<%=basePath%>images/disable_btn.png" name="Image2" border="0"
					id="Image2" onclick="disableEmployee()" />
				</a> <a href="#" id="enable" class="abtn"> <img
					src="<%=basePath%>images/enable_btn.png" name="Image3" border="0"
					id="Image3" onclick="enableEmployee()" />
				</a> <a href="#" id="ResetPassword" class="abtn"> <img
					src="<%=basePath%>images/ResetPassword.png" name="Image4"
					border="0" id="Image4" onclick="updateEmployeePwd()" />
				</a>
			</div>
			<!------------ 按钮  end ---------->
		</div>
	</div>
	<div class="table-box">
		<table>
			<tr>
				<th class="num"></th>
				<th class="name">姓名</th>
				<th class="name">帐户名</th>
				<th class="process">角色名</th>
				<th class="process">员工状态</th>
			</tr>
			<c:forEach items="${requestScope.employeeroleList}"
				var="employeerole">
				<tr>
					<td class="num"><input type="checkbox" name="employee_id"
						id="employee_id" value="${employeerole.employee_id}"
						onClick="javascript:chooseOne(this,'employee_id');"></td>
					<td class="name">${employeerole.employee_name}</td>
					<td class="name">${employeerole.employee_loginname}</td>
					<td class="process"><c:choose>
					<c:when test="${employeerole.role_name==null}">
					普通员工
					</c:when>
					<c:otherwise>
					${employeerole.role_name}
					</c:otherwise>
					</c:choose></td>
					<td class="process" id="employee_status"><c:if test="${employeerole.employee_status == 1}">可用</c:if> <c:if test="${employeerole.employee_status == 0}">禁用</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>

</html>