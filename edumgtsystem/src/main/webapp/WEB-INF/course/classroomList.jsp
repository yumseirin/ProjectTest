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
<link rel="stylesheet" href="<%=basePath%>css/info-mgt.css" />
<link rel="stylesheet" href="<%=basePath%>css/WdatePicker.css" />
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
<!---------------------------  复选框实现单选js文件  ------------------------------------>
<script type="text/javascript" src="<%=basePath%>js/form.js"
	charset="utf-8"></script>
<!--------------------------- 引入三级联动js文件  ------------------------------------>
<script type="text/javascript" src="<%=basePath%>js/position2.js"
	charset="utf-8"></script>

<script type="text/javascript">
    var path ="<%=basePath%>";

	//进入修改页面
	function updateClassRoom() {

		var num = getCheckBoxValue('classroom_cid');
		if (num == null || num == "") {
			alert("请选择要修改的教室");
			return false;
		} else {
			window.location.href = path
					+ "/classRoomControl/selectclassRoomByid.action?classroom_cid="
					+ num;
		}
	}
	//按条件查询
	function submitClassRoom() {

		var area_id = $("#area_id").val();
		//如果页面上area_id是""时，就提交不到后台的方法报400错
		//表单的action提交
		$("#form1").submit();
	}
</script>
</head>
<body>

	<div class="title">
		<h2>教室管理</h2>
	</div>
	<div class="query">
		<div class="query-conditions ue-clear">
			<!-----------    查询条件  start   ---------->
			<div class="conditions staff ue-clear">
				<form
					action="<%=basePath%>classRoomControl/selectClassRoomByInfo.action"
					method="post" id="form1">
					所属区域： <select id="area_id" name="area_id" class="{required:true}"
						style="color: red">
						<option value="0">全部</option>
						<c:forEach items="${requestScope.arealist}" var="area">

							<c:if test="${area.area_id  ==  requestScope.areaid}">
								<option value="${area.area_id}" selected>${area.area_name}</option>
							</c:if>
							<c:if test="${area.area_id  !=  requestScope.areaid}">
								<option value="${area.area_id}">${area.area_name}</option>
							</c:if>
						</c:forEach>
					</select> &nbsp;&nbsp;&nbsp; <a href="javascript:submitClassRoom()"
						class="confirm">查询</a>
				</form>
			</div>
			<!-----------    查询条件  end   ---------->
			<!-----------    按钮  start   ---------->
			<div style="position: absolute; right: 0; margin: -45px 30px 0 0">

				<a href="<%=basePath%>classRoomControl/gotoAddClassRoom.action"
					id="add" class="abtn"> <img
					src="<%=basePath%>images/add_btn.png" name="Image1" border="0"
					id="Image1" />
				</a> <a href="#" id="update" class="abtn"> <img
					src="<%=basePath%>images/revise_btn.png" border="0" id="Image2"
					onclick="updateClassRoom()" />
				</a>
			</div>
			<!------------ 按钮  end ---------->
		</div>
	</div>
	<div class="table-box">
		<table>
			<tr>
				<th class="num"></th>
				<th class="name">所属区域</th>
				<th class="name">教室名称</th>
				<th class="name">教室可容纳人数</th>
				<th class="process">教室状态</th>
			</tr>
			<c:forEach items="${requestScope.classroomlist}" var="classroom">
				<tr>
					<td class="num"><input type="checkbox" name="classroom_cid"
						id="classroom_cid" value="${classroom.classroom_cid}"
						onClick="javascript:chooseOne(this,'classroom_cid');"></td>
					<td class="name">${classroom.area_name}</td>
					<td class="name">${classroom.classroom_cname}</td>
					<td class="name">${classroom.classroom_cpeonumber}</td>
					<td class="process">
					<c:if
					test="${classroom.classroom_cstatus == 0}">
					可用
					</c:if>
					<c:if
					test="${classroom.classroom_cstatus == 1}">
					不可用
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>