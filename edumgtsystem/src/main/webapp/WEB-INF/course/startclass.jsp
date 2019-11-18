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
<link rel="stylesheet" href="<%=basePath%>css/base.css" />
<link rel="stylesheet" href="<%=basePath%>css/info-reg.css" />
<link rel="stylesheet" href="<%=basePath%>css/WdatePicker.css" />
<!-- ------------JQuery  JS----------------- -->
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
<!--------------------------- 引入三级联动与表单验证js文件  ------------------------------------>
<script type="text/javascript" src="<%=basePath%>js/startclass.js"
	charset="utf-8"></script>
<!-- ----------------------引入时间控件--------------------------- -->
<script type="text/javascript"
	src="<%=basePath%>js/My97DatePicker/WdatePicker.js">
</script>
<script type="text/javascript">
    var path ="<%=basePath%>";
</script>
</head>
<body>
	<div class="title">
		<h2>开班管理</h2>
	</div>
	<form action="<%=basePath%>startClassControl/addStartClass.action"
		method="post" id="form1">
		<div whidth="100%">
			<table width="100%" border="0" align="left" cellspacing="0"
				cellpadding="0" bordercolor="red">
				<tr>
					<td width="120" height="30" rowspan="8"></td>
				</tr>
				<tr>
					<td width="100" class="inputText">技术方向: 
					<select id="tech_id"
						name="tech_id" class="{required:true}" style="color: red"
						onblur="checktech_id()">
							<option value="0">请选择</option>
							<c:forEach items="${requestScope.techlist}" var="tech">
								<option value="${tech.tech_id}">${tech.tech_tname}(${tech.tech_time})</option>
							</c:forEach>
					</select> <span id="tech_idmsg" style="color: red"></span>
					</td>
					<td width="10" height="30" align="left">选择区域: <select
						id="startclass_region" name="startclass_region"
						class="{required:true}" style="color: red"
						onchange="checkstartclass_region()">
							<option value="0">请选择</option>
							<c:forEach items="${requestScope.arealist}" var="area">
								<option value="${area.area_id}">${area.area_name}</option>
							</c:forEach>
					</select> <span id="startclass_regionmsg" style="color: red"></span>
					</td>
				</tr>
				<tr>
					<td width="100" class="inputText">班级性质: <select
						id="startclass_snature" name="startclass_snature"
						class="{required:true}" style="color: red"
						onblur="checkstartclass_snature()">
							<option value="">请选择</option>
							<option value="<%=MessageUtil.STARTCLASS_NATURE_JIUYE%>">就业</option>
							<option value="<%=MessageUtil.STARTCLASS_NATURE_SHIXUN%>">实训</option>
							<option value="<%=MessageUtil.STARTCLASS_NATURE_XIAONEISHISHI%>">校内实施</option>
					</select> <span id="startclass_snaturemsg" style="color: red"></span>
					</td>
					<td width="10" height="30" align="left">讲&nbsp;&nbsp;&emsp;&nbsp;&nbsp;师:
						<select id="startclass_classtutor" name="startclass_classtutor"
						class="{required:true}" style="color: red" onclick="techandregion()"
						onchange="checkstartclass_classtutor()">
							<option value="">请选择</option>
					</select> <span id="startclass_classtutormsg" style="color: red"></span>
					</td>
				</tr>
				<tr>
					<td width="10" height="30" align="left">助&nbsp;&nbsp;&emsp;&nbsp;&nbsp;教:
						<select id="startclass_teahingassient"
						name="startclass_teahingassient" class="{required:true}"
						style="color: red" onclick="techandregion()" 
						onchange="checkstartclass_teahingassient()">
							<option value="">请选择</option>
					</select> <span id="startclass_teahingassientmsg" style="color: red"></span>
					</td>
					<td width="10" height="30" align="left">班&nbsp;&nbsp;主&nbsp;&nbsp;任:
						<select id="startclass_teacher" name="startclass_teacher"
						class="{required:true}" style="color: red" onclick="techandregion()"
						onchange="checkstartclass_teacher()">
							<option value="">请选择</option>
					</select> <span id="startclass_teachermsg" style="color: red"></span>
					</td>
				</tr>
				<tr>
					<td width="10" height="30" align="left">开班日期:
					<input
						type="text" id="startclass_sstarttime"
						name="startclass_sstarttime" class="{required:true}"
						maxlength="16" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						onblur="checkstartclass_sstarttime()" /> <span
						id="startclass_sstarttimemsg" style="color: red"></span>
					</td>
					<td width="10" height="30" align="left">结束日期:
					<input
						type="text" id="startclass_sendtime" name="startclass_sendtime"
						class="{required:true}" maxlength="16"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						onblur="tech_time()" /> <span
						id="startclass_sendtimemsg" style="color: red"></span>
					</td>
				</tr>
				<tr>
					<td width="100" class="inputText">人&nbsp;&nbsp;&emsp;&nbsp;&nbsp;数:<input
						type="text" id="startclass_speonumber"
						name="startclass_speonumber" class="{required:true}"
						maxlength="16" onblur="checkstartclass_speonumber()" /> <span
						id="startclass_speonumbermsg" style="color: red"></span>
					</td>
					<td width="10" height="30" align="left">选择教室: <select
						id="classroom_cid" name="classroom_cid" class="{required:true}"
						style="color: red" onclick="peonumberandregion()" 
						onchange="checkclassroom_cid()">
							<option value="0">请选择</option>
					</select> <span id="classroom_cidmsg" style="color: red"></span>
					</td>
				</tr>
				<tr>
					<td width="100" class="inputText"><div
							style="width: 52px; float: left">学校信息:</div>
						<div>
							<textarea id="startclass_school" name="startclass_school"
								cols="20" rows="3" style="overflow: hidden;"></textarea>
						</div> <span id="startclass_schoolsmsg" style="color: red"></span></td>
					<td></td>
				</tr>
				<tr>
					<td width="10" height="20" align="right"><br /> <img
						src="<%=basePath%>images/save_btn.png" width="60" height="20"
						onclick="validate()" /></td>
					<td valign="bottom"><br />
					<img src="<%=basePath%>images/cacel_btn.jpg" width="60" height="20"
						onclick="javascript:reset()" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>