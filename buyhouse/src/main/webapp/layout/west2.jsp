<%@ page language="java" import="java.util.*,com.vo.Authority" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<!-- jquery库 -->

<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8">
</script>
    
	</head>

	<body>
 
		<!--  ==================手风琴菜单（从Accordion（分类）里）strart==========================  
				data-options="fit:true"  加在最外层的div让最外层适合父容器 
			-->
			
			
	<div id="aa" class="easyui-accordion" data-options="fit:true"
			style="width: 300px; height: 200px;">
		
	<!-- 先查找出一级分类，把一级分类的名字显示出来 -->		
   <c:forEach items="${applicationScope.oneFenlei}"  var="au">
	 
	 <div title="${au.AUTHORITY_NAME}" data-options="iconCls:'icon-reload',selected:true"
				style="padding: 10px;">
				<ul id="tt" class="easyui-tree">
			<!-- 再查找二级分类，二级分类的父亲ID 如果等于一级分类ID，说明，这个二级分类属于这个一级分类下的，那就把二级分类显示出来 -->		
		<c:forEach items="${applicationScope.twoFenlei}"  var="au1">
			<c:if test="${au1.AUTHORITY_PARENT_ID == au.AUTHORITY_ID}">
			    <li>
						<span><a onclick="addtab('${au1.AUTHORITY_NAME}','${au1.AUTHORITY_URL}','${au1.AUTHORITY_ID}')">${au1.AUTHORITY_NAME}</a></span>
					</li>
			</c:if>
	     </c:forEach>
		</ul>
	</div>
	
  </c:forEach>

</div>
		
  <!--  ==================手风琴end==========================           -->
	</body>
</html>
