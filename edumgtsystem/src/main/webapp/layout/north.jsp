<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'north.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>css/base.css" />
	<link rel="stylesheet" href="<%=basePath%>css/info-mgt.css" />

  </head>
  
  <body>
  <div><img alt="" src="<%=basePath%>images/logo.png"></div>
  <div style="text-align: right;"><font size="5" color="red">欢迎您，${sessionScope.user.employee_name }！<a href="${pageContext.request.contextPath}/loginControl/loginOff.action">退出</a></font></div>
  </body>
</html>
