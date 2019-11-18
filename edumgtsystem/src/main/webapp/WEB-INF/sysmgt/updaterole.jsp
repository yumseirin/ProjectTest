<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.seirin.util.MessageUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   //把后台权限得到进行循环，放在一个字符串中(1,2,3,4)）
	int[] authidarr = (int[]) request.getAttribute("authidarr");
	String str = "";
	for (int i : authidarr) {
		str += i + ",";

	}
%>
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
	
	//选中节点的值,如果选中的是父节点，那么下面所有子节点也被选中，回显要标值是一个串,多选权限用数组(1,2,3,4)形式
	$('#role_quanxian').combotree('setValue', [<%=str%>]);
	
	});

</script>
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>roleControl/gotoRoleList.action">角色管理</a>
			&gt;&gt;修改角色
		</td>
	</tr>
</table>

<form action="<%=basePath%>roleControl/updateRoleAuthority.action" method="post"
	id="form1">

	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">
		<tr>
			<td width="10" height="30" align="right">角色名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText" >
			<input type="text"
				id="role_name" name="role_name"
				class="{required:true}" maxlength="16" onblur="checkrolename()"  value="${requestScope.role.role_name}"/>
			<div id="rolenamemsg" style="color: red"></div>
			</td>

		</tr>
		<tr>
			<td width="10" height="30" align="right">状&nbsp;&nbsp;态:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText">
				<select   id="role_state" name="role_state" class="{required:true}"  style="color: red" >
				<c:if test="${requestScope.role.role_state == 0}">
				 <option value="<%=MessageUtil.ROLE_STATE_YOUXIAO%>" selected>有效</option>
				</c:if>
			   <c:if test="${requestScope.role.role_state == 1}">
			     <option value="<%=MessageUtil.ROLE_STATE_WUXIAO%>" selected>无效</option>
			     </c:if>
			     
			  <c:if test="${requestScope.role.role_state != 0}">
				 <option value="<%=MessageUtil.ROLE_STATE_YOUXIAO%>" >有效</option>
				</c:if>
			   <c:if test="${requestScope.role.role_state != 1}">
			     <option value="<%=MessageUtil.ROLE_STATE_WUXIAO%>" >无效</option>
			     </c:if>
				
			    </select>
				</td>
       </tr>
		<tr>
			<td width="10" height="30" align="right"> 角色描述:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText">
			<input type="text"
				id="role_description" name="role_description"
				class="{required:true}" maxlength="16" onblur="checkdescription()" value="${requestScope.role.role_description}" />
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
	<!-- 修改后的权限id,拼成串 -->
	<input type="hidden"  name="auid"  id="auid"  value="<%=str%>"> 
	<!-- 角色id-->
	<input type="hidden"  name="role_id"  id="role_id"  value="${requestScope.role.role_id}" > 
</form>
</body>
</html>