<%@page import="com.seirin.util.MessageUtil"%>
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

<link href="<%=basePath%>css/right.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript">
 var path="<%=basePath%>";
	//教室名称验证
	function checkname() {
		var classroom_cname = $("#classroom_cname").val();
		if (classroom_cname == null || classroom_cname == "") {
			$("#namemsg").html("<font color='red'>教室名称不能为空</font>");
			return false;
		} else {
			$("#namemsg").html("");
			return true;
		}
	}
	//教室容纳人数验证
	function checkpeonumber() {
		var classroom_cpeonumber = $("#classroom_cpeonumber").val();
		if (classroom_cpeonumber == null || classroom_cpeonumber == "") {
			$("#peonumbermsg").html("<font color='red'>教室容纳人数不能为空</font>");
			return false;
		} else {
			$("#peonumbermsg").html("");
			return true;
		}
	}
	function validate() {
		var b = true;
		if (!checkname()) {
			b = false
		}
		if (!checkpeonumber()) {
			b = false
		}
		if (b == true) {
			$("#form1").submit();
		}
	}
</script>
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>classRoomControl/gotoClassRoomList.action">教室管理</a>
			&gt;&gt;修改教室
		</td>
	</tr>
</table>

<form action="<%=basePath%>classRoomControl/updateClassRoom.action"
	method="post" id="form1">

	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">
		<tr>
			<td width="10" height="30" align="right">所属区域:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText"><select id="area_id"
				name="area_id" class="{required:true}" style="color: red">
					<c:forEach items="${requestScope.arealist}" var="area">
						<c:if test="${requestScope.classroom.area_id == area.area_id}">
							<option value="${area.area_id}" selected>${area.area_name}</option>
						</c:if>
						<c:if test="${requestScope.classroom.area_id != area.area_id}">
							<option value="${area.area_id}">${area.area_name}</option>
						</c:if>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td width="10" height="30" align="right">教室名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText"><input type="text"
				id="classroom_cname" name="classroom_cname" class="{required:true}"
				maxlength="16" onblur="checkname()"
				value="${requestScope.classroom.classroom_cname }" />
				<div id="namemsg" style="color: red"></div></td>

		</tr>
		<tr>
			<td width="10" height="30" align="right">教室容纳人数:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText"><input type="text"
				id="classroom_cpeonumber" name="classroom_cpeonumber"
				class="{required:true}" maxlength="16" onblur="checkpeonumber()"
				value="${requestScope.classroom.classroom_cpeonumber }" />
				<div id="peonumbermsg" style="color: red"></div></td>

		</tr>
		<tr>
			<td width="10" height="30" align="right">教室状态:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText"><select id="classroom_cstatus"
				name="classroom_cstatus" class="{required:true}" style="color: red">
				<c:if test="${requestScope.classroom.classroom_cstatus==0 }">
					<option value="<%=MessageUtil.CLASSROM_CSTATUS_KEYONG %>" selected>可用</option>
					<option value="<%=MessageUtil.CLASSROM_CSTATUS_BUKEYONG %>" >不可用</option>
				</c:if>
				<c:if test="${requestScope.classroom.classroom_cstatus==1 }">
					<option value="<%=MessageUtil.CLASSROM_CSTATUS_KEYONG %>" >可用</option>
					<option value="<%=MessageUtil.CLASSROM_CSTATUS_BUKEYONG %>" selected>不可用</option>
				</c:if>
				</select>
				<div id="peonumbermsg" style="color: red"></div></td>
		</tr>

		<tr>
			<td width="10" height="20">&nbsp;</td>
			<td valign="bottom"><img src="<%=basePath%>images/save_btn.png"
				width="60" height="20" onclick="validate()" /> <img
				src="<%=basePath%>images/cacel_btn.jpg" width="60" height="20"
				onclick="javascript:history.back()" /></td>

		</tr>
	</table>
	<input type="hidden" id="classroom_cid" name="classroom_cid"
		value="${requestScope.classroom.classroom_cid}" />
</form>
</body>
</html>