<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"  src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript"  src="<%=basePath%>js/form.js" charset="utf-8"></script>
<script type="text/javascript">
    var path ="<%=basePath%>";
	function updateDepartment() {
		
      var num = getCheckBoxValue('department_id');
      if(num == null || num == ""){
    	  alert("请选择要修改的部门");
    	  return false;
      }else{
      window.location.href = path	+ "/departmentControl/selectDepartmentByid.action?department_id="+num;
      }
}
</script>
</head>
<body>

	<div class="title">
		<h2>部门管理</h2>
	</div>
	<div class="query">
		<div class="query-conditions ue-clear">
			<!-----------    按钮  start   ---------->
			<div style="position: absolute; right: 0; margin: -45px 30px 0 0">

				<a href="<%=basePath%>departmentControl/gotoAddDepartment.action" id="add"
					class="abtn"> <img src="<%=basePath%>images/add_btn.png"
					name="Image1" border="0" id="Image1" />
				</a> <a href="#" id="update" class="abtn"> <img
					src="<%=basePath%>images/revise_btn.png" border="0" id="Image2"  onclick="updateDepartment()"/>
				</a>
			</div>
			<!------------ 按钮  end ---------->
		</div>
	</div>
	<div class="table-box">
		<table>
			<tr>
				<th class="num"></th>
				<th class="name">部门名称</th>
				<th class="name">所属区域</th>
				<th class="process">部门描述</th>
			</tr>
			<c:forEach items="${requestScope.departmentlist }" var="department">
				<tr>
					<td class="num"><input type="checkbox" name="department_id"
						id="department_id" value="${department.department_id}" onClick="javascript:chooseOne(this,'department_id');" ></td>
					<td class="name">${department.department_name}</td>
					<td class="name">${department.area_name}</td>
					<td class="process">${department.department_description}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>