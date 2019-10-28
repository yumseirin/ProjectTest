<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
    <form action="<%=basePath%>userControl/login.action" method="post">
        <table align="center">
            <tr>
           		 <td height=200>
           		 	<font  color="red">${requestScope.msg}</font>
           		 </td>
            </tr>
            <tr>
            	<td>用户名:<input type="text"  name="uname"/>  
            	</td>
            </tr>
            <tr><td>密&nbsp;&nbsp;&nbsp;码:<input type="password"  name="pwd"/></td></tr>
            <tr><td colspan=2 align="center"> <input type="submit" value="提交"/>&nbsp;&nbsp;<a href="<%=basePath%>userControl/zhuce.action">注册</a></td></tr>
        </table>
    </form>
  </body>
</html>
