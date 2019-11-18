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
</script>
</head>
<body>

	<div class="title">
		<h2>所有班级</h2>
	</div>
	<div class="table-box">
		<table>
			<tr>
				<th class="num"></th>
				<th class="name">班级编号</th>
				<th class="name">教室编号</th>
				<th class="name">班级人数</th>
				<th class="process">学习方向</th>
				<th class="process">讲师</th>
				<th class="process">助教</th>
				<th class="process">班主任</th>
				<th class="process">开班时间</th>
				<th class="process">结束时间</th>
				<th class="process">班级性质</th>
				<th class="process">班级状态</th>
				<th class="process">课程表</th>
			</tr>
			<c:forEach items="${requestScope.startclasslist}" var="startclass">
				<tr>
					<td class="num"><input type="checkbox" name="startclass_sid"
						id="startclass_sid" value="${startclass.startclass_sid}"
						onClick="javascript:chooseOne(this,'startclass_sid');"></td>
					<td class="name">${startclass.startclass_sno}</td>
					<td class="name">${startclass.classroom_cid}</td>
					<td class="name">${startclass.startclass_speonumber}</td>
					<td class="process">${startclass.tech_tname}</td>
					<td class="process">${startclass.classtutor_name}</td>
					<td class="process">${startclass.teahingassient_name}</td>
					<td class="process">${startclass.teacher_name}</td>
					<td class="process"><fmt:formatDate
							value="${startclass.startclass_sstarttime}" pattern="yyyy-MM-dd" />
					</td>
					<td class="process"><fmt:formatDate
							value="${startclass.startclass_sendtime}" pattern="yyyy-MM-dd" />
					</td>
					<td class="process"><c:if
							test="${startclass.startclass_snature == 0}">就业</c:if> <c:if
							test="${startclass.startclass_snature == 1}">实训</c:if> <c:if
							test="${startclass.startclass_snature == 2}">校内实施</c:if></td>
					<td class="process"><c:if
							test="${startclass.startclass_sstatus == 0}">正在上课</c:if> <c:if
							test="${startclass.startclass_sstatus == 1}">未开课</c:if> <c:if
							test="${startclass.startclass_sstatus == 2}">已结课</c:if></td>
					<td class="process"><a
						href="<%=basePath%>businessControl/gotoClassCourse.action?startclass_sid=${startclass.startclass_sid}">查看课程体系</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>