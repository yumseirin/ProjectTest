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
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="31" class="right_tittle">您的位置：<a
				href="<%=basePath%>businessControl/gotoClasses.action">所有班级 </a>
				&gt;&gt;课程表
			</td>
		</tr>
	</table>
	</div>
	
	<div class="table-box">
		<table>
			<tr>
				<th class="name">课程名称</th>
				<th class="name">周开始时间</th>
				<th class="name">周结束时间</th>
			</tr>
			<c:forEach items="${requestScope.classcourselist}" var="classcourse">
				<tr>
					<td class="name">${classcourse.classcourse_name}</td>
					<td class="name"><fmt:formatDate
							value="${classcourse.classcourse_starttime}" pattern="yyyy-MM-dd" /></td>
					<td class="name"><fmt:formatDate
							value="${classcourse.classcourse_endtime}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>