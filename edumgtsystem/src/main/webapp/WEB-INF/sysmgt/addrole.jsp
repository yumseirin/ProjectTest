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
<script type="text/javascript">

$(function(){
	//生成树
	$('#role_quanxian').combotree({    
		 url:'<%=basePath%>roleControl/getTreeData.action',
			required : true,
			multiple : true, //为true代表出来多选框
			prompt : '请选择下拉...',
			editable : true, //支持模糊查找
		});
	});

</script>
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>roleControl/gotoRoleList.action">角色管理</a>
			&gt;&gt;添加角色
		</td>
	</tr>
</table>

<form action="<%=basePath%>roleControl/addRoleAuthority.action" method="post"
	id="form1">

	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">
		<tr>
			<td width="10" height="30" align="right">角色名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText" >
			<input type="text"
				id="role_name" name="role_name"
				class="{required:true}" maxlength="16" onblur="checkrolename()" />
			<div id="rolenamemsg" style="color: red"></div>
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
			<td width="10" height="30" align="right"> 角色描述:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText">
			<input type="text"
				id="role_description" name="role_description"
				class="{required:true}" maxlength="16" onblur="checkdescription()" />
				<div id="descriptionmsg" style="color: red"></div></td>

		</tr>
		<tr>
			<td width="10" height="30" align="right"> 角色权限:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText">
				<select id="role_quanxian" name="role_quanxian"  style="width:200px;" ></select>  
				<div id="quanxianmsg" style="color: red"></div></td>

		</tr>

		<tr>
			<td width="10" height="20">&nbsp;</td>
			<td valign="bottom"><img src="<%=basePath%>images/save_btn.png"
				width="60" height="20" onclick="validate()" /> <img
				src="<%=basePath%>images/cacel_btn.jpg" width="60" height="20"
				onclick="javascript:history.back()" /></td>

		</tr>
	</table>
	<input type="hidden"  name="auid"  id="auid"  > 
</form>
</body>
</html>