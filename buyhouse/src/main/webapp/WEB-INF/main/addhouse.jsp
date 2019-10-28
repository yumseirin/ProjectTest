<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'addhouse.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<form action="<%=basePath%>houseControl/saveHouse.action"
			method="post" enctype="multipart/form-data">
			<table align="center">
				<tr>
					<td height=200></td>
				</tr>
				<tr>
					<td>
						您好，
						<font color="red">${sessionScope.uname } </font>
						<a href="userControl/loginOff.action"> 退出</a>
					</td>
				</tr>
				<tr>
					<td>
						房子名:
						<input type="text" name="name" />
					</td>
				</tr>
				<tr>
					<td>
						详情:
						<input type="text" name="des" />
					</td>
				</tr>
				<tr>
					<td>
						房图:
						<input type="file" name="pic2" />
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="提交" />
						&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
