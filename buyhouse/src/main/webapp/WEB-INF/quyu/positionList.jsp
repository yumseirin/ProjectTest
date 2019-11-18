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
<!---------------------------  复选框实现单选js文件  ------------------------------------>
<script type="text/javascript"  src="<%=basePath%>js/form.js" charset="utf-8"></script>
<!--------------------------- 引入三级联动js文件  ------------------------------------>
<script type="text/javascript"
	src="<%=basePath%>js/position2.js" charset="utf-8"></script>

<script type="text/javascript">
    var path ="<%=basePath%>";
    
    //进入修改页面
	function updatePosition() {
		
      var num = getCheckBoxValue('position_id');
      if(num == null || num == ""){
    	  alert("请选择要修改的职称");
    	  return false;
      }else{
      window.location.href = path	+ "/positionControl/selectPositionByid.action?position_id="+num;
      }
}
	//按条件查询
	function  submitPostion() {
		
		var area_id = $("#area_id").val();
		var department_id = $("#department_id").val();
	
		//如果页面上area_id和department_id是“”时，就提交不到后台的方法报400错
		//表单的action提交
		$("#form1").submit();
	}
</script>
</head>
<body>

	<div class="title">
		<h2>职称管理</h2>
	</div>
	<div class="query">
		<div class="query-conditions ue-clear">
			<!-----------    查询条件  start   ---------->
		<div class="conditions staff ue-clear">
		<form action="<%=basePath%>positionControl/selectPositionByInfo.action" method="post"  id="form1">
			所属区域：
				 <select   id="area_id" name="area_id" class="{required:true}"  style="color: red">
			        <option value="0">全部</option>
                       <c:forEach items="${requestScope.quyuList}"  var="quyu">
                                 
                                   <c:if test="${quyu.area_id  ==  requestScope.areaid}">
                                     <option value="${quyu.area_id}" selected>${quyu.area_name}</option>
                                     </c:if>
                                       <c:if test="${quyu.area_id  !=  requestScope.areaid}">
                                     <option value="${quyu.area_id}" >${quyu.area_name}</option>
                                         </c:if>
                       </c:forEach>
                    </select>
               &nbsp;&nbsp;&nbsp;
             所属部门：
                  <select   id="department_id" name="department_id" class="{required:true}"  style="color: red" >
                    <option value="0">全部</option>
                    <c:forEach items="${requestScope.department }" var="de">
                          <c:if test="${de.department_id == requestScope.depid}">
							<option value="${de.department_id}" selected>${de.department_name}</option>
						</c:if>
						 <c:if test="${de.department_id != requestScope.depid}">
							<option value="${de.department_id}">${de.department_name}</option>
					</c:if>
                    </c:forEach>
			    </select> &nbsp;&nbsp;&nbsp;
				<a href="javascript:submitPostion()" class="confirm">查询</a>
		</form>
			</div>
			<!-----------    查询条件  end   ---------->
			<!-----------    按钮  start   ---------->
			<div style="position: absolute; right: 0; margin: -45px 30px 0 0">

				<a href="<%=basePath%>positionControl/gotoAddPosition.action" id="add"
					class="abtn"> <img src="<%=basePath%>images/add_btn.png"
					name="Image1" border="0" id="Image1" />
				</a> <a href="#" id="update" class="abtn"> <img
					src="<%=basePath%>images/revise_btn.png" border="0" id="Image2"  onclick="updatePosition()"/>
				</a>
			</div>
			<!------------ 按钮  end ---------->
		</div>
	</div>
	<div class="table-box">
		<table>
			<tr>
				<th class="num"></th>
				<th class="name">所属区域</th>
				<th class="name">所属部门</th>
				<th class="process">职位名称</th>
			</tr>
			<c:forEach items="${requestScope.positionlist}" var="position">
				<tr>
					<td class="num"><input type="checkbox" name="position_id"
						id="position_id" value="${position.position_id}" onClick="javascript:chooseOne(this,'position_id');" ></td>
					<td class="name">${position.area_name}</td>
					<td class="name">${position.department_name}</td>
					<td class="process">${position.position_name}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>