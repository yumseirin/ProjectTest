<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.min.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/browser.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.jqprint-0.3.js"
	charset="utf-8"></script>
<script type="text/javascript">
	function print() {
		$('#ss').jqprint();
	}
</script>
</head>
</head>
<body>
	<div id="ss1">123123</div>
	<div id="ss">
		<table border="1" width="300" id="aa">
			<tr>
				<td>用户名</td>
				<td>密码</td>
			</tr>
			<tr>
				<td>张三</td>
				<td>123</td>
			</tr>
			<tr>
				<td>李四</td>
				<td>456</td>
			</tr>
		</table>
	</div>
	<input type="button" value="打印" onclick="print()">
</body>
</html>