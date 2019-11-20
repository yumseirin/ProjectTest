<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	//区域名称验证
 function checkname(){
	   	var area_name = $("#area_name").val();
	   	if(area_name == null || area_name ==""){
	   		 $("#namemsg").html("<font color='red'>区域名称不能为空</font>");
	   	  return false;
	   	}else{
	   		
	   		$("#namemsg").html("");
	   		test2();
	   	  return true;
	   	}
 }
//区域编码验证
 function checkcode(){
	
	   	var area_code = $("#area_code").val();
	   	if(area_code == null || area_code ==""){
	  		  $("#codemsg").html("<font color='red'>区域编码不能为空</font>");
	  		  return false;
	    	}else{
	   		 $("#codemsg").html("");
	   		 test();
	   		return true;
		   } 
 }
 
function test(){
		
		var area_code =$("#area_code").val();
	 $.ajax({
			type : "POST",
			url : path
					+ "/areaControl/validate.action",
			data : {
				area_code : area_code,
			},
			dataType : "json",
			success : function(data) {
				if (data.success == 1) {
					$("#codemsg").html("<font color='red'>编码已经存在</font>");
					flag= false;
				}
				
				if (data.success == 0) {
					$("#codemsg").html("<font color='green'>编码可以使用</font>");
					flag= true;	
				}
			}
		});
	 return flag;
}
function test2(){
		
		var area_name =$("#area_name").val();
	 $.ajax({
			type : "POST",
			url : path
					+ "/areaControl/validate2.action",
			data : {
				area_name : area_name,
			},
			dataType : "json",
			success : function(data) {
				if (data.success == 1) {
					$("#namemsg").html("<font color='red'>区域已经存在</font>");
					flag2= false;
				}
				
				if (data.success == 0) {
					$("#namemsg").html("<font color='green'>名称可以使用</font>");
					flag2= true;	
				}
			}
		});
	 return flag2;
}
 
function validate(){
	var b=true;
	if(!checkname()){b= false};
	if(!checkcode()){b= false};
 
	 if(b == true){
		
		//form表单的id, 提交表单 
		$("#form1").submit();
		//如下写法不要用，这样虽然请求可以提交过去，但数据传不到后台。
		// window.location.href=path+"areaControl/addArea.action";
	 }
}
</script>
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="31" class="right_tittle">您的位置：<a
			href="<%=basePath%>areaControl/gotoAreaList.action">区域管理</a>
			&gt;&gt;添加区域
		</td>
	</tr>
</table>

<form action="<%=basePath%>areaControl/addArea.action"  method="post"  id="form1">

	<table width="100%" border="0" align="left" cellspacing="0"
		cellpadding="0" bordercolor="red">
		<tr>
			<td width="10" height="30" align="right">区域名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText"><input type="text"
				id="area_name" name="area_name" class="{required:true}"
				maxlength="16"  onblur="checkname()"/>
				<div id="namemsg" style="color: red"></div></td>

		</tr>
		<tr>
			<td width="10" height="30" align="right">区域编码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="100" class="inputText"><input type="text"
				id="area_code" name="area_code" class="{required:true}"
				maxlength="16"  onblur="checkcode()"/>
				<div id="codemsg" style="color: red"></div></td>

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
</form>
</body>
</html>