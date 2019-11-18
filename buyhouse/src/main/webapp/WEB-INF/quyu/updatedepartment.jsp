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

<link href="<%=basePath%>css/right.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript">
 var path="<%=basePath%>";
	//部门名称验证
 function checkname(){
	   	var department_name = $("#department_name").val();
	   	if(department_name == null || department_name ==""){
	   		 $("#namemsg").html("<font color='red'>部门名称不能为空</font>");
	   	  return false;
	   	}else{
	   		
	   		$("#namemsg").html("");
	   	  return true;
	   	}
 }
//部门描述验证
 function checkcode(){
	
	   	var department_description = $("#department_description").val();
	   	if(department_description == null || department_description ==""){
	  		  $("#codemsg").html("<font color='red'>部门描述不能为空</font>");
	  		  return false;
	    	}else{
	   		 $("#codemsg").html("");
	   		return true;
		   } 
 }
 
function validate(){
	var b=true;
	if(!checkname()){b= false};
	if(!checkcode()){b= false};
 
	 if(b == true){
		//form表单的id, 提交表单 
		$("#form1").submit();
		//如下写法不要用，这样虽然请求可以提交过去，但数据传不到后台。
		// window.location.href=path+"quyuControl/addQuyu.action";
	 }
}
</script>
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>departmentControl/gotoDepartmentList.action">部门管理</a>
			&gt;&gt;添加部门
		</td>
	</tr>
</table>

<form action="<%=basePath%>departmentControl/updateDepartment.action"  method="post"  id="form1">

	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">
		
		<tr>
			<td width="10" height="30" align="right">所属区域:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText" >
			<select   id="area_id" name="area_id" class="{required:true}"  style="color: red">
            <c:forEach items="${requestScope.quyulist}"  var="quyu">
                  <c:if test="${quyu.area_id == requestScope.department.area_id}">
                     <option value="${quyu.area_id}" selected>${quyu.area_name}</option>
                  </c:if>
                   <c:if test="${quyu.area_id != requestScope.department.area_id}">
                     <option value="${quyu.area_id}" >${quyu.area_name}</option>
                  </c:if>
               
            </c:forEach>
           </select>
			</td>
   </tr>
		<tr>
			<td width="10" height="30" align="right">部门名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText"><input type="text"
				id="department_name" name="department_name" class="{required:true}"
				maxlength="16"  onblur="checkname()" value="${requestScope.department.department_name}"/>
				<div id="namemsg" style="color: red"></div></td>

		</tr>
		<tr>
			<td width="10" height="30" align="right">部门描述:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText"><input type="text"
				id="department_description" name="department_description" class="{required:true}"
				maxlength="16"  onblur="checkcode()"  value="${requestScope.department.department_description}"/>
				<div id="codemsg" style="color: red"></div>
		</td>
 	</tr>

		<tr>
			<td width="10" height="20">&nbsp;</td>
			<td valign="bottom">
			<img src="<%=basePath%>images/save_btn.png"
				width="60" height="20" onclick="validate()" /> 
				
			<img
				src="<%=basePath%>images/cacel_btn.jpg" width="60" height="20"
				onclick="javascript:history.back()" /></td>
             
		</tr>
	</table>
	  <input type="hidden"
				id="department_id" name="department_id"  value="${requestScope.department.department_id}"/>
</form>
</body>
</html>