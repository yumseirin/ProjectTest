<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.seirin.util.MessageUtil"%>
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
<!-- ------------JQuery  JS----------------- -->
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
<!-- ------------表单验证JS----------------- -->
<!--------------------------- 引入三级联动js文件  ------------------------------------>
<script type="text/javascript" src="<%=basePath%>js/addemployee.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var path="<%=basePath%>";
</script>
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>employeeControl/gotoEmployeeList.action">员工管理</a>
			&gt;&gt;修改员工
		</td>
	</tr>
</table>

<form action="<%=basePath%>employeeControl/updateEmployee.action"
	method="post" id="form1">
	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">
		<tr>
			<td width="120" height="30" rowspan="8"></td>
		</tr>
		<tr>
			<td width="10" height="30" align="left">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:<input
				type="text" id="employee_name" name="employee_name"
				value="${requestScope.employee.employee_name }"
				class="{required:true}" maxlength="16" onblur="checkemployee_name()" />
				<span id="employee_namemsg" style="color: red"></span>
			</td>
			<td width="100" class="inputText">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:
				<select id="employee_sex" name="employee_sex"
				class="{required:true}" style="color: red"
				onblur="checkemployee_level()">
					<c:if test="${requestScope.employee.employee_sex == 0}">
						<option value="<%=MessageUtil.EMPLOYEE_SEX_MAN%>" selected>男</option>
						<option value="<%=MessageUtil.EMPLOYEE_SEX_WOMAN%>">女</option>
					</c:if>
					<c:if test="${requestScope.employee.employee_sex == 1}">
						<option value="<%=MessageUtil.EMPLOYEE_SEX_MAN%>">男</option>
						<option value="<%=MessageUtil.EMPLOYEE_SEX_WOMAN%>" selected>女</option>
					</c:if>
			</select> <span id="employee_sexmsg" style="color: red"></span>
			</td>
		</tr>
		<tr>
			<td width="10" height="30" align="left">用&nbsp;&nbsp;户&nbsp;&nbsp;名:<input
				type="text" id="employee_loginname" name="employee_loginname"
				value="${requestScope.employee.employee_loginname }"
				class="{required:true}" maxlength="16"
				onblur="checkemployee_loginname()" /> <span
				id="employee_loginnamemsg" style="color: red"></span>
			</td>
			<td width="100" class="inputText">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input
				type="password" id="employee_password" name="employee_password"
				value="${requestScope.employee.employee_password }"
				class="{required:true}" maxlength="16"
				onblur="checkemployee_password()" /> <span
				id="employee_passwordmsg" style="color: red"></span>
			</td>
		</tr>
		<tr>
			<td width="10" height="30" align="left">所属区域: <select
				id="employee_area" name="employee_area" class="{required:true}"
				style="color: red" onchange="checkarea_id();">
					<option value="0">请选择</option>
					<c:forEach items="${requestScope.arealist}" var="area">
						<c:if test="${requestScope.employee.area_name == area.area_name}">
							<option value="${area.area_id}" selected>${area.area_name}</option>
						</c:if>
						<c:if test="${requestScope.employee.area_name != area.area_name}">
							<option value="${area.area_id}">${area.area_name}</option>
						</c:if>
					</c:forEach>

			</select> <span id="employee_areamsg" style="color: red"></span>
			</td>
			<td width="100" class="inputText">部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门:
				<select id="employee_dept" name="employee_dept"
				class="{required:true}" style="color: red"
				onblur="checkemployee_dept()">
					<option value="0">请选择</option>
					<c:forEach items="${requestScope.departmentlist}" var="dept">
						<c:if
							test="${requestScope.employee.employee_dept == dept.department_id}">
							<option value="${dept.department_id}" selected>${dept.department_name}</option>
						</c:if>
						<c:if
							test="${requestScope.employee.employee_dept != dept.department_id}">
							<option value="${dept.department_id}">${dept.department_name}</option>
						</c:if>
					</c:forEach>
			</select> <span id="employee_deptmsg" style="color: red"></span>
			</td>
		</tr>
		<tr>
			<td width="10" height="30" align="left">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:<select
				id="position_id" name="position_id" class="{required:true}"
				style="color: red" onblur="checkposition_id()">
					<option value="0">请选择</option>
					<c:forEach items="${requestScope.positionlist}" var="pt">
						<c:if
							test="${requestScope.employee.position_id == pt.position_id}">
							<option value="${pt.position_id}" selected>${pt.position_name}</option>
						</c:if>
						<c:if
							test="${requestScope.employee.position_id != pt.position_id}">
							<option value="${pt.position_id}">${pt.position_name}</option>
						</c:if>
					</c:forEach>


			</select> <span id="position_idmsg" style="color: red"></span>
			</td>
			<td width="100" class="inputText">技术方向:<select
				id="employee_tech" name="employee_tech" class="{required:true}"
				style="color: red" onblur="checkemployee_tech()">
					<option value="0">请选择</option>
					<c:forEach items="${requestScope.techlist}" var="t">
						<c:if test="${requestScope.employee.employee_tech == t.tech_id}">
							<option value="${t.tech_id}" selected>${t.tech_tname}</option>
						</c:if>
						<c:if test="${requestScope.employee.employee_tech != t.tech_id}">
							<option value="${t.tech_id}">${t.tech_tname}</option>
						</c:if>
					</c:forEach>
			</select> <span id="employee_techmsg" style="color: red"></span>
			</td>
		</tr>
		<tr>
			<td width="10" height="30" align="left">等&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:
				<select id="employee_level" name="employee_level"
				class="{required:true}" style="color: red"
				onblur="checkemployee_level()">
					<c:if test="${requestScope.employee.employee_level == 0}">
						<option value="<%=MessageUtil.EMPLOYEE_LEVEL_CHUJI%>" selected>初级</option>
						<option value="<%=MessageUtil.EMPLOYEE_LEVEL_ZHONGJI%>">中级</option>
						<option value="<%=MessageUtil.EMPLOYEE_LEVEL_GAOJI%>">高级</option>
						
					</c:if>
					<c:if test="${requestScope.employee.employee_level == 1}">
						<option value="<%=MessageUtil.EMPLOYEE_LEVEL_CHUJI%>">初级</option>
						<option value="<%=MessageUtil.EMPLOYEE_LEVEL_ZHONGJI%>" selected>中级</option>
						<option value="<%=MessageUtil.EMPLOYEE_LEVEL_GAOJI%>">高级</option>
					</c:if>
					<c:if test="${requestScope.employee.employee_level == 2}">
						<option value="<%=MessageUtil.EMPLOYEE_LEVEL_CHUJI%>">初级</option>
						<option value="<%=MessageUtil.EMPLOYEE_LEVEL_ZHONGJI%>">中级</option>
						<option value="<%=MessageUtil.EMPLOYEE_LEVEL_GAOJI%>" selected>高级</option>
					</c:if>
			</select> <span id="employee_levelmsg" style="color: red"></span>
			</td>
			<td width="100" class="inputText">出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;差:<select
				id="employee_business" name="employee_business"
				class="{required:true}" style="color: red"
				onblur="checkemployee_business()">
					<c:if test="${requestScope.employee.employee_business == 0}">
						<option value="<%=MessageUtil.EMPLOYEE_BUSINESS_JIESHOU%>"
							selected>接受</option>
						<option value="<%=MessageUtil.EMPLOYEE_BUSINESS_BUJIESHOU%>"
							>不接受</option>
					</c:if>
					<c:if test="${requestScope.employee.employee_business == 1}">
						<option value="<%=MessageUtil.EMPLOYEE_BUSINESS_JIESHOU%>"
							>接受</option>
						<option value="<%=MessageUtil.EMPLOYEE_BUSINESS_BUJIESHOU%>"
							selected>不接受</option>
					</c:if>
			</select> <span id="employee_businessmsg" style="color: red"></span>
			</td>
		</tr>
		<tr>
			<td width="10" height="30" align="left">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质:
				<select id="employee_attribute" name="employee_attribute"
				class="{required:true}" style="color: red"
				onblur="checkemployee_attribute()">
				<c:if test="${requestScope.employee.employee_attribute == 0}">
					<option value="<%=MessageUtil.EMPLOYEE_ATTRIBUTE_QUANZHI%>" selected>全职</option>
					<option value="<%=MessageUtil.EMPLOYEE_ATTRIBUTE_JIANZHI%>">兼职</option>
				</c:if>
				<c:if test="${requestScope.employee.employee_attribute == 1}">
					<option value="<%=MessageUtil.EMPLOYEE_ATTRIBUTE_QUANZHI%>">全职</option>
					<option value="<%=MessageUtil.EMPLOYEE_ATTRIBUTE_JIANZHI%>" selected>兼职</option>
				</c:if>
			</select> <span id="employee_attributemsg" style="color: red"></span>
			<td width="100" class="inputText">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:<input
				type="text" id="employee_email" name="employee_email"
				class="{required:true}"  value="${requestScope.employee.employee_email }"
				onblur="checkemployee_email()" /> <span
				id="employee_emailmsg" style="color: red"></span>
			</td>
		</tr>
		<tr>
			<td width="10" height="50" align="left">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:<input
				type="text" id="employee_tel" name="employee_tel"
				value="${requestScope.employee.employee_tel }"
				class="{required:true}" maxlength="16" onblur="checkemployee_tel()" />
				<span id="employee_telmsg" style="color: red"></span>
			</td>
			<td width="100" height="50" class="inputText">微&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信:<input
				type="text" id="employee_wechat" name="employee_wechat"
				value="${requestScope.employee.employee_wechat }"
				class="{required:true}" maxlength="16"
				onblur="checkemployee_wechat()" /> <span id="employee_wechatmsg"
				style="color: red"></span>
			</td>
		</tr>
		<tr>
			<td width="10" height="20" align="right"><br /> <br /> <img
				src="<%=basePath%>images/save_btn.png" width="60" height="20"
				onclick="validate()" /></td>
			<td valign="bottom"><img src="<%=basePath%>images/cacel_btn.jpg"
				width="60" height="20" onclick="javascript:history.back()" /></td>
		</tr>
	</table>
	<input type="hidden" value="${requestScope.employee.employee_id }"
		name="employee_id" id="employee_id">
</form>
</body>
</html>