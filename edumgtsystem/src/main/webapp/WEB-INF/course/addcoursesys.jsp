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
<!--------- 引入表单验证   js文件  -------------- -->
<script type="text/javascript" src="<%=basePath%>/js/daorucoursesys.js"
	charset="utf-8"></script>

<script type="text/javascript">
	    var path="<%=basePath%>";
</script>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="31" class="right_tittle">您的位置：<a
				href="<%=basePath%>coursesysControl/selectCoursesys.action">标准课程体系</a>
				&gt;&gt;添加课程体系
			</td>
		</tr>
	</table>

	<form id="form1"
		action="<%=basePath%>coursesysControl/daorucoursesys.action"
		method="post" enctype="multipart/form-data">
		<table width="100%" border="0" align="left" cellspacing="0"
			cellpadding="0" bordercolor="red">
			<tr align="center">
				<td width="100" class="inputText">&nbsp;&nbsp;技术方向:&nbsp;&nbsp;<select
					id="tech_id" name="tech_id" class="{required:true}"
					style="color: red" onblur="checktech_id()">
						<option value="">请选择</option>
						<c:forEach items="${requestScope.techlist}" var="tech">
							<option value="${tech.tech_id}">${tech.tech_tname}</option>
						</c:forEach>
				</select> <span id="tech_idmsg" style="color: red"></span>
				</td>
			</tr>
			<tr align="center">
				<td width="100" height="30" class="inputText">课程体系名称:<input
					type="text" id="coursesys_csname" name="coursesys_csname"
					class="{required:true}" maxlength="16"
					onblur="checkcoursesys_csname()" /> <span id="coursesys_csnamemsg"
					style="color: red"></span>
				</td>
			</tr>
			<tr align="center">
				<td width="100" class="inputText"><br />文件导入: <input
					type="file" id="upload" name="upload" class="{required:true}"
					maxlength="16" /> <span id="exalmsg" style="color: red"></span></td>
			</tr>
			<tr align="center">
				<td width="100" class="inputText"><br /> <br /> (<a
					href="<%=basePath%>file/coursesys.xls">模板下载</a>,请上传.xls文件)</td>
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
	</form>
</body>
</html>