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

		<title>My JSP 'register.jsp' starting page</title>

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
		<form action="<%=basePath%>userControl/zhuce2.action" method="post">
			<table align="center">
				<tr>
					<td height=200></td>
				</tr>
				<tr>
					<td>
						用户名:
						<input type="text" name="uname" />
					</td>
				</tr>
				<tr>
					<td>
						密码:
						<input type="password" name="pwd" />
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="注册" />
						&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</form>
		<form action="<%=basePath%>userControl/zhuce2.action" method="post">
			<table align="center">
				<tr>
					<td height=200></td>
				</tr>
				<tr>
					<td>
						用户名:
						<input type="text" name="uname" />
					</td>
				</tr>
				<tr>
					<td>
						密码:
						<input type="password" name="pwd" />
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="注册" />
						&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
