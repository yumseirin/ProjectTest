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
	<!--------------------------- 引入三级联动js文件  ------------------------------------>
	<script type="text/javascript"
	src="<%=basePath%>js/position.js" charset="utf-8"></script>
	
<script type="text/javascript">
 var path="<%=basePath%>";
	//所属区域验证
	function checkquname() {
		var area_id = $("#area_id").val();
		if (area_id == null || area_id == "") {
			$("#areanamemsg").html("<font color='red'>所属区域不能为空</font>");
			return false;
		} else {

			$("#areanamemsg").html("");
			return true;
		}
	}
	//部门名称验证
	function checkdename() {

		var department_id = $("#department_id").val();
		if (department_id == null || department_id == "") {
			$("#denamemsg").html("<font color='red'>所属部门不能为空</font>");
			return false;
		} else {
			$("#denamemsg").html("");
			return true;
		}
	}
	
	//职位名称验证
	function checkponame() {

		var position_name = $("#position_name").val();
		if (position_name == null || position_name == "") {
			$("#ponamemsg").html("<font color='red'>职位名称不能为空</font>");
			return false;
		} else {
			$("#ponamemsg").html("");
			return true;
		}
	}

	function validate() {
		var b = true;
		if (!checkquname()) {
			b = false
		}
		;
		if (!checkdename()) {
			b = false
		}
		;
		if (!checkponame()) {
			b = false
		}
		;
		if (b == true) {

			//form表单的id, 提交表单 
			$("#form1").submit();
			//如下写法不要用，这样虽然请求可以提交过去，但数据传不到后台。
			// window.location.href=path+"areaControl/addArea.action";
		}
	}
</script>
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>positionControl/gotoPositionList.action">职称管理</a>
			&gt;&gt;添加职称
		</td>
	</tr>
</table>

<form action="<%=basePath%>positionControl/addPosition.action" method="post"
	id="form1">

	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">
		<tr>
			<td width="10" height="30" align="right">所属区域:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText" >
			<select   id="area_id" name="area_id" class="{required:true}"  style="color: red">
			 <option value="0">选择区域</option>
            <c:forEach items="${requestScope.areaList}"  var="area">
                 <option value="${area.area_id}">${area.area_name}</option>
            </c:forEach>
           </select><div id="areanamemsg" style="color: red"></div>
			</td>

		</tr>
		<tr>
			<td width="10" height="30" align="right">所属部门:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText">
				<select   id="department_id" name="department_id" class="{required:true}"  style="color: red" >
			    </select>
				<div id="denamemsg" style="color: red"></div></td>
       </tr>
		<tr>
			<td width="10" height="30" align="right">职位名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText"><input type="text"
				id="position_name" name="position_name"
				class="{required:true}" maxlength="16" onblur="checkponame()" />
				<div id="ponamemsg" style="color: red"></div></td>

		</tr>

		<tr>
			<td width="10" height="20">&nbsp;</td>
			<td valign="bottom"><img src="<%=basePath%>images/save_btn.png"
				width="60" height="20" onclick="validate()" /> <img
				src="<%=basePath%>images/cacel_btn.jpg" width="60" height="20"
				onclick="javascript:history.back()" /></td>

		</tr>
	</table>
</form>
</body>
</html>