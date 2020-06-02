<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import=" com.seirin.util.MessageUtil"%>
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
<link rel="stylesheet" href="<%=basePath%>css/info-reg.css" />
<link rel="stylesheet" href="<%=basePath%>css/WdatePicker.css" />
<style type="text/css">
.chaxunbtn {text-decoration: none;border: solid 1px;	}
.chaxunbtn {display:inline-table;line-height:24px;padding:0 9px;border-radius:2px;font-family:Arial, Helvetica, sans-serif !important;}
.chaxunbtn {color: #000000;border-color:#8EB2D2; background:#eaf4fa;}
.chaxunbtn :hover {color:#023054;border-color:#8EB2D2;background:#B8DFFB;}
</style>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
<!---------------------------  复选框实现单选js文件  ------------------------------------>
<script type="text/javascript" src="<%=basePath%>js/form.js"
	charset="utf-8"></script>
<!---------------------------------统计图js文件---------------------------------------->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/charts/fusioncharts.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/charts/fusioncharts.charts.js" charset="utf-8"></script>

<script type="text/javascript">
 var path ="<%=basePath%>";

	//进入修改页面
	function updateEmployee() {

		var num = getCheckBoxValue('employee_id');
		if (num == null || num == "") {
			alert("请选择要修改的员工");
			return false;
		} else {
			window.location.href = path
					+ "employeeControl/getEmploeeById.action?employee_id="
					+ num;
		}
	}
	//进入详情页面
	function employeeInfo(){
		var num = getCheckBoxValue('employee_id');
		if (num == null || num == "") {
			alert("请选择要查看详情的员工");
			return false;
		} else {
			window.location.href = path
					+ "employeeControl/gotoEmployeeInfo.action?employee_id="
					+ num;
		}
	}
	//进入批量导入页面
	function daoruEmployee() {

		window.location.href = path
				+ "employeeControl/gotoDaoruEmployee.action";

	}
	//按条件查询
	function submitName() {

		//var employee_id = $("#employee_id").val();
		$("#form1").submit();
	}
	//跳转
	function submitGotoPage() {

		//var employee_id = $("#employee_id").val();
		$("#form2").submit();
	}
	function reset(){
		$(" #employee_name").val("");
	}
	
</script>
<script type="text/javascript">
function closeshow(){
	var tongjitu = document.getElementById("tongjitu");
	tongjitu.style.display="none";
}
function show(){ 
	var tongjitu = document.getElementById("tongjitu");
	tongjitu.style.display="block";
	 $.ajax({
			url : "<%=basePath%>/employeeControl/getdata.action",
			success : function(data) {		
				//$.messager.progress('close');
				FusionCharts.ready(function() {
					var revenueChart = new FusionCharts({
						"type" : "pie2d",
						"renderAt" : "tongjitu",//id的值
						"width" : "100%",
						"height" : "400",
						"dataFormat" : "json",
						"dataSource": {
					        "chart": {
					            "caption": "公司人员分布",
					            "subCaption": "临清教育集团",
					            "xAxisName": "区域",
					            "yAxisName": "员工人数",
					            "theme": "fint"
					         },
					        "data": data
					      }
					});
					revenueChart.render();
				})
			}
		});
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
			<div class="ue-clear">
				<form
					action="<%=basePath%>employeeControl/selectEmployeePaging.action"
					method="post" id="form1">
					用户姓名：<input type="text" id="employee_name" name="employee_name"
						class="{required:true}" maxlength="16"
						value="${requestScope.employee_name}" /> &nbsp;&nbsp;&nbsp; 
						<a href="javascript:submitName()" class="chaxunbtn" >查询</a>
						<a href="#" onclick="reset()" class="chaxunbtn">置空</a>
						<a href="#" onclick="show()" class="chaxunbtn">查看员工分布图</a>
						<a href="#" onclick="closeshow()" class="chaxunbtn">关闭员工分布图</a>
				</form>
			</div>
			<!-----------    查询条件  end   ---------->
			<!-----------    按钮  start   ---------->
			<div style="position: absolute; right: 0; margin: -45px 30px 0 0">

				<a href="<%=basePath%>employeeControl/gotoAddEmployee.action"
					id="add" class="abtn"> <img
					src="<%=basePath%>images/add_btn.png" name="Image1" border="0"
					id="Image1" />
				</a><a href="#" id="revise" class="abtn"> <img
					src="<%=basePath%>images/revise_btn.png" border="0" id="Image2"
					onclick="updateEmployee()" />
				</a><a href="#" id="info" class="abtn"> <img
					src="<%=basePath%>images/info2.png" border="0" id="Image3"
					onclick="employeeInfo()" />
				</a><a href="#" id="upload" class="abtn"> <img
					src="<%=basePath%>images/upload.bmp" border="0" id="Image4"
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
						id="employee_id" value="${employee.employee_id}"
						onClick="javascript:chooseOne(this,'employee_id');"></td>
					<td class="name">${employee.employee_name}</td>
					<td class="name">${employee.employee_loginname}</td>
					<td class="process"><c:if test="${employee.employee_sex == 0}">
					 男
					</c:if> <c:if test="${employee.employee_sex == 1}">
					女
					</c:if></td>
					<td class="process">${employee.area_name}</td>
					<td class="name">${employee.position_name}</td>
					<td class="name"><c:if
							test="${employee.employee_attribute == 0}">
					全职
					</c:if> <c:if test="${employee.employee_attribute == 1}">
				    兼职
					</c:if></td>
					<td class="process"><c:if
							test="${employee.employee_level == 0}">
					初级
					</c:if> <c:if test="${employee.employee_level == 1}">
					中级
					</c:if> <c:if test="${employee.employee_level ==2}">
					高级
					</c:if></td>
					<td class="process">${employee.employee_tel}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="pagination">
		<div class="pxofy">
			 <span>共${totalCount}条结果， 分成 ${totalPage}页显示， 当前第 ${page}页</span>
		</div>
		<div class="pxofy">
			<a
				href="<%=basePath%>employeeControl/selectEmployeePaging.action?page=1&employee_name=${employee_name}">首页</a>
			<c:choose>
				<c:when test="${page>1}">
					<a class="prev"
						href="<%=basePath%>employeeControl/selectEmployeePaging.action?page=${page-1}&employee_name=${employee_name}">上页</a>
				</c:when>
				<c:otherwise>
	               	<span class="prev">上页</span>
	            </c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page<totalPage}">
					<a class="next"
						href="<%=basePath%>employeeControl/selectEmployeePaging.action?page=${page+1}&employee_name=${employee_name}">下页</a>
				</c:when>
				<c:otherwise>
	               	<span class="next">下页</span>
	            </c:otherwise>
			</c:choose>
			<a
				href="<%=basePath%>employeeControl/selectEmployeePaging.action?page=${totalPage}&semployee_name=${employee_name}">末页</a>
			<div class="goto">
				<form action="<%=basePath%>employeeControl/selectEmployeePaging.action" method="post" id="form2" style="display:inline;">
					<span>跳到第</span> <input type="text" id="pagenum" name="page" class="text" /><span>页</span>
					<a href="#" class="goto" onclick="javascript:submitGotoPage()">跳转</a> <input
						type="hidden" name="employee_name" value="${employee_name}"/>
				</form>
			</div>
		</div>
	</div><br><br>
	<div id="tongjitu" style="display:none"></div>
</body>

</html>