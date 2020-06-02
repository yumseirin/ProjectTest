<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="cp" value="${pageContext.request.contextPath}" />

<!-- jquery库 -->

<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8">
</script>

<!-- ====== easyui相关库   顺序别颠倒，是有序的 ========================== -->
<!--页面的样式-->
<link id="easyuiTheme" rel="stylesheet"
	href="${cp}/js/jquery-easyui-1.4.5/themes/default/easyui.css"
	type="text/css">
</link>
	
<!--图标的样式-->
<link rel="stylesheet"
	href="${cp}/js/jquery-easyui-1.4.5/themes/icon.css" type="text/css">
</link>

<!---->
<script type="text/javascript"
	src="${cp}/js/jquery-easyui-1.4.5/jquery.easyui.min.js" charset="utf-8">
</script>

<!--页面样式要显示中文就把easyui-lang-zh_CN.js引入-->
<script type="text/javascript"
	src="${cp}/js/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"
	charset="utf-8">
</script>
