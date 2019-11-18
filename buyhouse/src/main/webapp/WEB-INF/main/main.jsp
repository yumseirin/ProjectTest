<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'main.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function go() {
		var num = document.getElementById("index").value;
		alert(num);
		location.href = "houseControl/paging.action?page=" + num;
	}
	function a() {
		location.href = "loginFmbAction_paging?page=" + num;
	}
</script>

</head>

<body>
	<CENTER>
		<c:if test="${sessionScope.uname ==null }">
 		您好，<font color="red">游客</font>
			<a href="userControl/goLogin.action">去登录</a>
		</c:if>
		<c:if test="${sessionScope.uname !=null }">
 		您好，<font color="red">${sessionScope.uname }</font>
			<a href="userControl/loginOff.action"> 退出</a>
		</c:if>
		<a href="paikelogin.jsp">排课系统</a>
		<a href="paikelogin2.jsp">排课系统2</a>
		<table width="70%" border="2px" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">序号</td>
				<td align="center">房名</td>
				<td align="center">房图1</td>
				<td align="center">房图2</td>
				<td align="center">详情</td>
				<c:if test="${sessionScope.uname!=null }">
					<td align="center">操作</td>
				</c:if>
			</tr>
			<c:forEach var="h" varStatus="status" items="${requestScope.list}">

				<tr>
					<td align="center">${status.index+1 }</td>
					<td align="center">${h.name}</td>
					<td align="center"><img
						src="<%=basePath%>houseControl/getHouseImg.action?id=${h.id } "
						width="100" height="100" /></td>
					<td align="center"><img
						src="<%=basePath%>houseControl/getHouseImg2.action?id=${h.id } "
						width="100" height="100" /></td>
					<td align="center">${h.des }</td>
					<c:if test="${sessionScope.uname !=null }">
						<td align="center"><a
							href="<%=basePath%>houseControl/order.action?houseid=${h.id}">购买</a>
						</td>
					</c:if>
				</tr>

			</c:forEach>

		</table>
		共${requestScope.yeshu}页&nbsp;&nbsp;&nbsp;&nbsp;当前页${requestScope.page}&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="houseControl/paging.action?page=1">首页</a>&nbsp;&nbsp;&nbsp; <a
			href="houseControl/paging.action?page=${requestScope.page-1 }">上一页</a>&nbsp;&nbsp;&nbsp;
		<a href="houseControl/paging.action?page=${requestScope.page+1 }">下一页</a>&nbsp;&nbsp;&nbsp;
		<a href="houseControl/paging.action?page=${requestScope.yeshu}">末页</a>
		<input type="text" id="index"> <input type="button" value="跳转"
			onclick="go()">
	</CENTER>
</body>
</html>
