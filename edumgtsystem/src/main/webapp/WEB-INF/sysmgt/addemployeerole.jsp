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
<script type="text/javascript"    src="<%=basePath%>js/addrole.js" charset="utf-8"></script>
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>employeeRoleControl/gotoEmployeeRoleList.action">员工权限管理</a>
			&gt;&gt;添加员工权限
		</td>
	</tr>
</table>

<form action="<%=basePath%>roleControl/addRoleAuthority.action" method="post"
	id="form1">

	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">
		<tr>
			<td width="10" height="30" align="right">用户帐户:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText" >
			<input type="text"
				id="role_name" name="role_name"
				class="{required:true}" maxlength="16" onblur="checkrolename()" />
			<div id="rolenamemsg" style="color: red"></div>
			</td>

		</tr>
		<tr>
			<td width="10" height="30" align="right">用户名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText" >
			<input type="text"
				id="role_name" name="role_name"
				class="{required:true}" maxlength="16" onblur="checkrolename()" />
			<div id="rolenamemsg" style="color: red"></div>
			</td>

		</tr>
		<tr>
			<td width="10" height="30" align="right">角&nbsp;&nbsp;色:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText">
				<select   id="role_id" name="role_id" class="{required:true}"  style="color: red" >
				<c:forEach items="${requestScope.roleList}" var="r">
			         <option value="${r.role_id}">${r.role_name}</option>
			     </c:forEach>
			    </select>
				</td>
       </tr>
		<tr>
			<td width="10" height="30" align="right">状&nbsp;&nbsp;态:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText">
				<select   id="role_state" name="role_state" class="{required:true}"  style="color: red" >
			    <option value="<%=MessageUtil.ROLE_STATE_YOUXIAO%>">有效</option>
			     <option value="<%=MessageUtil.ROLE_STATE_WUXIAO%>">无效</option>
			    </select>
				</td>
       </tr>
		

		<tr>
			<td width="10" height="20">&nbsp;</td>
			<td valign="bottom"><br/><br/><img src="<%=basePath%>images/save_btn.png"
				width="60" height="20" onclick="validate()" /> <img
				src="<%=basePath%>images/cacel_btn.jpg" width="60" height="20"
				onclick="javascript:history.back()" /></td>

		</tr>
	</table>
	<input type="hidden"  name="auid"  id="auid"  > 
</form>
</body>
</html>