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

<!--------- 引入三级联动及表单验证   js文件  -------------- -->
<script type="text/javascript" src="<%=basePath%>/js/daoruemployee.js"
	charset="utf-8"></script>

<script type="text/javascript">
	    var path="<%=basePath%>";
</script>

</head>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>employeeControl/gotoEmployeeList.action">员工管理</a>
			&gt;&gt;批量上传
		</td>
	</tr>
</table>

<form id="form1" action="<%=basePath%>daoRuControl/daoru.action"
	method="post" enctype="multipart/form-data">

	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">

		<tr align="center">
			<td width="100" height="30">所属区域: <select id="employee_area"
				name="employee_area" class="{required:true}" style="color: red">
					<option value="0">请选择</option>
					<c:forEach items="${requestScope.area}" var="q">
						<option value="${q.area_id}">${q.area_name}</option>
					</c:forEach>
			</select> <span id="employee_areamsg" style="color: red"></span>
			</td>
		</tr>
		<tr align="center">
			<td width="100" class="inputText">所属部门: <select
				id="employee_dept" name="employee_dept" class="{required:true}"
				style="color: red">
					<option value="0">请选择</option>
			</select> <span id="employee_deptmsg" style="color: red"></span>
			</td>

		</tr>
		<tr align="center">
			<td width="100" height="30">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:
				<select id="position_id" name="position_id" class="{required:true}"
				style="color: red">
					<option value="0">请选择</option>

			</select> <span id="position_idmsg" style="color: red"></span>
			</td>
		</tr>
		<tr align="center">
			<td width="100" height="30">所属角色:<select id="role_id"
				name="role_id" class="{required:true}" style="color: red">
					<option value="0">请选择</option>
					<c:forEach items="${requestScope.role}" var="p">
						<option value="${p.role_id}">${p.role_name}</option>
					</c:forEach>
			</select> <span id="role_idmsg" style="color: red"></span>
			</td>
		</tr>
		<tr align="center">
			<td width="100" class="inputText">技术方向:<select
				id="employee_tech" name="employee_tech" class="{required:true}"
				style="color: red">
					<option value="0">请选择</option>
					<c:forEach items="${requestScope.tech}" var="t">
						<option value="${t.tech_id}">${t.tech_tname}</option>
					</c:forEach>
			</select> <span id="employee_techmsg" style="color: red"></span>
			</td>

		</tr>

		<tr align="center">
			<td width="100" class="inputText"><br />文件导入: <input type="file"
				id="upload" name="upload" class="{required:true}" maxlength="16" />
				<span id="exalmsg" style="color: red"></span></td>

		</tr>
		<tr align="center">
			<td width="100" class="inputText"><br />
			<br /> (<a href="<%=basePath%>file/employee.xls">模板下载</a>,请上传.xls文件)
			</td>
		</tr>
		<tr align="center">
			<td width="10" height="20" align="center"><br /> <br /> <img
				src="<%=basePath%>images/save_btn.png" width="60" height="20"
				onclick="submitFrom()" /> <img
				src="<%=basePath%>images/cacel_btn.jpg" width="60" height="20"
				onclick="javascript:history.back()" /></td>
		</tr>
		<tr>
			<td valign="bottom" align="center"></td>

		</tr>
	</table>
	<input type="hidden" name="auid" id="auid">
</form>
</body>
</html>