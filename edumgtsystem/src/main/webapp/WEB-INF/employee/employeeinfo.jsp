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

<script type="text/javascript">
    var path ="<%=basePath%>";
</script>
</head>
<body>

	<div class="title">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="31" class="right_tittle">您的位置：<a
				href="<%=basePath%>employeeControl/gotoEmployeeList.action">员工管理</a>
				&gt;&gt;员工详情
			</td>
		</tr>
	</table>
	</div>
	
	<div class="table-box">
		<table>
			<tr>
				<th class="name">姓名:</th>
				<td class="name">${employee.employee_name}</td>
				<th class="process">性别:</th>
				<td class="process"><c:if test="${employee.employee_sex == 0}">
					 男
					</c:if> <c:if test="${employee.employee_sex == 1}">
					女
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="name">用户名:</th>
				<td class="name">${employee.employee_loginname}</td>
				<th class="process">性质:</th>
				<td class="name"><c:if
							test="${employee.employee_attribute == 0}">
					全职
					</c:if> <c:if test="${employee.employee_attribute == 1}">
				    兼职
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="process">所属区域:</th>
				<td class="process">${employee.area_name}</td>
				<th class="process">部门:</th>
				<td class="process">${employee.position_name}</td>
			</tr>
			<tr>
				<th class="process">职称:</th>
				<td class="process">${employee.position_name}</td>
				<th class="process">技术方向:</th>
				<td class="process">${employee.tech_tname}</td>
			</tr>
			<tr>
				<th class="process">等级:</th>
				<td class="process"><c:if
							test="${employee.employee_level == 0}">
					初级
					</c:if> <c:if test="${employee.employee_level == 1}">
					中级
					</c:if> <c:if test="${employee.employee_level ==2}">
					高级
					</c:if></td>
				<th class="process">出差:</th>
				<td class="process"><c:if
							test="${employee.employee_business == 0}">
					接受
					</c:if> <c:if test="${employee.employee_business == 1}">
					不接受
					</c:if> </td>
			</tr>
			<tr>
				<th class="process">手机:</th>
				<td class="process">${employee.employee_tel}</td>
				<th class="process">微信:</th>
				<td class="process">${employee.employee_wechat}</td>
			</tr>
			
		</table>
		<br><br>
		<a href="javascript:history.back()" class="chaxunbtn" >返回</a>
	</div>
	
</body>

</html>