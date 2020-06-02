<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import=" com.seirin.util.MessageUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<script type="text/javascript">
    var path ="<%=basePath%>";

	//进入修改页面
	function updateCousesys() {

		var num = getCheckBoxValue('coursesys_csid');
		if (num == null || num == "") {
			alert("请选择要修改的课程体系");
			return false;
		} else {
			window.location.href = path
					+ "coursesysControl/gotoUpdateCoursesys.action?coursesys_csid="
					+ num;
		}
	}
	//删除
	function deleteCousesys() {

		var num = getCheckBoxValue('coursesys_csid');
		if (num == null || num == "") {
			alert("请选择要删除的课程体系");
			return false;
		} else {
			window.location.href = path
					+ "coursesysControl/deleteCoursesys.action?coursesys_csid="
					+ num;
		}
	}
</script>
</head>
<body>

	<div class="title">
		<h2>课程体系</h2>
	</div>
	<div class="query">
		<div class="query-conditions ue-clear">
			<!-----------    按钮  start   ---------->
			<div style="position: absolute; right: 0; margin: -45px 30px 0 0">

				<a href="<%=basePath%>coursesysControl/gotoAddCousesys.action"
					id="add" class="abtn"> <img
					src="<%=basePath%>images/add_btn.png" name="Image1" border="0"
					id="Image1" />
				</a> <a href="#" id="update" class="abtn"> <img
					src="<%=basePath%>images/revise_btn.png" border="0" id="Image2"
					onclick="updateCousesys()" />
				</a> <a href="#" id="delete" > <img 
					src="<%=basePath%>images/close1.png" border="0" id="Image3"
					onclick="deleteCousesys()" />
				</a>

			</div>
			<!------------ 按钮  end ---------->
		</div>
	</div>
	<div class="table-box">
		<table>
			<tr>
				<th class="num"></th>
				<th class="name">课程体系名称</th>
				<th class="name">技术方向</th>
			</tr>
			<c:forEach items="${requestScope.coursesyslist}" var="coursesys">
				<tr>
					<td class="num"><input type="checkbox" name="coursesys_csid"
						id="coursesys_csid" value="${coursesys.coursesys_csid}"
						onClick="javascript:chooseOne(this,'coursesys_csid');"></td>
					<td class="name"><a
						href="<%=basePath%>coursesysControl/daochuCousesys.action?coursesys_csid=${coursesys.coursesys_csid}">
						${coursesys.coursesys_csname}</a></td>
					<td class="name">${coursesys.tech_tname}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>