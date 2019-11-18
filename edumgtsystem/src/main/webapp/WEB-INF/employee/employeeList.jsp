<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import=" com.seirin.util.MessageUtil"%>
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
<!---------------------------  复选框实现单选js文件  ------------------------------------>
<script type="text/javascript"  src="<%=basePath%>js/form.js" charset="utf-8"></script>

<script type="text/javascript">
    var path ="<%=basePath%>";
    
    //进入修改页面
	function updateEmployee() {
		
      var num = getCheckBoxValue('employee_id');
      if(num == null || num == ""){
    	  alert("请选择要修改的员工");
    	  return false;
      }else{
      window.location.href = path+ "employeeControl/getEmploeeById.action?employee_id="+num;
      }
}
	 //进入批量导入页面
	function daoruEmployee() {
		
    
      window.location.href = path+ "employeeControl/gotoDaoruEmployee.action";
      
}
	//按条件查询
	function  submitPostion() {
		
		var employee_id = $("#employee_id").val();
	
	
		//如果页面上area_id和department_id是“”时，就提交不到后台的方法报400错
		//表单的action提交
		$("#form1").submit();
	}
</script>
</head>
<body>

	<div class="title">
		<h2>员工管理</h2>
	</div>
	<div class="query">
		<div class="query-conditions ue-clear">
			<!-----------    查询条件  start   ---------->
			<div>
				<form
					action="<%=basePath%>employeeRoleControl/selectEmployeeRole.action"
					method="post" id="form1">
					用户姓名：<input type="text" id="employee_name" name="employee_name"
						class="{required:true}" maxlength="16" /> &nbsp;&nbsp;&nbsp; <a
						href="javascript:submitName()" class="confirm">查询</a>
				</form>
			</div>
			<!-----------    查询条件  end   ---------->
			<!-----------    按钮  start   ---------->
			<div style="position: absolute; right: 0; margin: -45px 30px 0 0">

				<a href="<%=basePath%>employeeControl/gotoAddEmployee.action"
					id="add" class="abtn"> <img
					src="<%=basePath%>images/add_btn.png" name="Image1" border="0"
					id="Image1" />
				</a> <a href="#" id="update" class="abtn"> <img
					src="<%=basePath%>images/revise_btn.png" border="0" id="Image2"
					onclick="updateEmployee()" />
				</a> <a href="#" id="update" class="abtn"> <img
					src="<%=basePath%>images/upload.bmp" border="0" id="Image2"
					onclick="daoruEmployee()" />
				</a>

			</div>
			<!------------ 按钮  end ---------->
		</div>
	</div>
	<div class="table-box">
		<table>
			<tr>
				<th class="num"></th>
				<th class="name">姓名</th>
				<th class="name">用户名</th>
				<th class="process">性别</th>
				<th class="process">所属区域</th>
				<th class="process">职称</th>
				<th class="process">性质</th>
				<th class="process">等级</th>
				<th class="process">手机</th>
			</tr>
			<c:forEach items="${requestScope.employeelist}" var="employee">
				<tr>
					<td class="num"><input type="checkbox" name="employee_id"
						id="employee_id" value="${employee.employee_id}" onClick="javascript:chooseOne(this,'employee_id');" ></td>
					<td class="name">${employee.employee_name}</td>
					<td class="name">${employee.employee_loginname}</td>
					<td class="process">
					 <c:if test="${employee.employee_sex == 0}">
					 男
					</c:if>
					 <c:if test="${employee.employee_sex == 1}">
					女
					</c:if>
					</td>
					<td class="process"> ${employee.area_name}</td>
					<td class="name">${employee.position_name}</td>
					<td class="name">
					<c:if test="${employee.employee_attribute == 0}">
					全职
					</c:if>
					<c:if test="${employee.employee_attribute == 1}">
				    兼职
					</c:if>
					</td>
					<td class="process">
					<c:if test="${employee.employee_level == 0}">
					初级
					</c:if>
					<c:if test="${employee.employee_level == 1}">
					中级
					</c:if>
					<c:if test="${employee.employee_level ==2}">
					高级
					</c:if>
					</td>
					<td class="process"> ${employee.employee_tel}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>