<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.seirin.util.MessageUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ------------引入easyUI   css和js  包括easyui文件,JQ文件----------------- -->
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=basePath%>css/right.css" rel="stylesheet" type="text/css" />
<!-- ------------表单验证JS----------------- -->
<script type="text/javascript">
//密码验证
function checkpwd(){
	var employee_password = $("#employee_password").val();
	if (employee_password == null || employee_password == "") {
		$("#employee_passwordmsg").html("<font color='red'>密码不能为空</font>");
		return false;
	} else {
		$("#employee_passwordmsg").html("");
		return true;
	}
}
//确认密码验证
function checkpwd2(){
	var employee_password = $("#employee_password").val();
	var employee_password2 = $("#employee_password2").val();
	if (employee_password2 == null || employee_password2 == "") {
		$("#employee_password2msg").html("<font color='red'>密码不能为空</font>");
		return false;
	} else if(employee_password != employee_password2){
		$("#employee_password2msg").html("<font color='red'>密码不一致</font>");
		return false;
	} else {
		$("#employee_password2msg").html("");
		return true;
	}
}

function validate(){
	var b = true;

	if (!checkpwd()) { // 密码验证
		b = false; // alert(2);
	}
	if (!checkpwd2()) {// 确认密码验证

		b = false; // alert(1);
	}
	if (b == true) {
		alert("提交");
		// form表单的id, 提交表单
		$("#form1").submit();
	}
}

</script>
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>employeeRoleControl/gotoEmployeeRoleList.action">员工权限管理</a>
			&gt;&gt;修改员工密码
		</td>
	</tr>
</table>
<form action="<%=basePath%>employeeRoleControl/updateEmployeePwd.action"
	method="post" id="form1">
	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">
		<tr>
			<td width="10" height="30" align="right">新&nbsp;密&nbsp;码:</td>
			<td width="100" class="inputText"><input type="text"
				id="employee_password" name="employee_password" class="{required:true}" 
				maxlength="16" onblur="checkpwd()"/>
				<span id="employee_passwordmsg" style="color: red"></span></td>
		</tr>
		<tr>
			<td width="10" height="30" align="right">确认密码:</td>
			<td width="100" class="inputText"><input type="text"
				id="employee_password2" name="employee_password2" class="{required:true}" 
				maxlength="16" onblur="checkpwd2()"/>
				<span id="employee_password2msg" style="color: red"></span></td>
		</tr>
		<tr>
			<td width="10" height="20">&nbsp;</td>
			<td valign="bottom"><br />
			<br />
			<img src="<%=basePath%>images/save_btn.png" width="60" height="20"
				onclick="validate()" /> <img
				src="<%=basePath%>images/cacel_btn.jpg" width="60" height="20"
				onclick="javascript:history.back()" /></td>
		</tr>
	</table>
	<input type="hidden" name="employee_id" id="employee_id" value="${requestScope.employee_id }">
</form>
</body>
</html>