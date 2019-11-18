<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>排课系统</title>
<!-- common.jsp引用css和js -->
<%@ include file="/common/common.jsp"%>

<script type="text/javascript">
   var prjContextPath='<%=request.getContextPath()%>';
	$(function() {
		//如果点击验证码图片会有onclick事件
		$('#imageCode').click(function() {
			refreshCheckCode();
		});
	});
	//生成验证码
	function refreshCheckCode() {
		var append = '?clearCache=' + new Date().getTime() + 'a'
				+ Math.random();
		$('#imageCode').attr('src', $('#imageCode').attr('src') + append);
	}
	function valicheckFrom() {
		//用户名验证
		var employee_loginname = $("#employee_loginname").val();
		if (employee_loginname == null || employee_loginname == "") {
			$("#employee_loginnamemsg").html("<font color='red'>用户名不能为空</font>");
			return false;
		} else {
			$("#employee_loginnamemsg").html("");
		}
		//密码验证
		var employee_password = $("#employee_password").val();
		if (employee_password == null || employee_password == "") {
			$("#employee_passwordmsg").html("<font color='red'>密码不能为空</font>");
			return false;
		} else {
			$("#employee_passwordmsg").html("");
		}
		//校验码验证
		var code = $("#code").val();
		if (code.length != 0) {
			$.ajax({
						type : "POST",
						url : prjContextPath
								+ "/checkCodeControl/validate.action",
						data : {
							checkcode : $('#code').val()
						},
						dataType : "json",
						success : function(data) {
							if (data.success == 1) {
								$("#codemsg").html(
										"<font color='red'>校验码输入不正确</font>");
								$.messager.show({
									title : '警告',
									msg : '校验码输入不正确。',
									timeout : 5000,
									showType : 'slide'
								});
							} else {
								$("#codemsg").html(
										"<font color='green'>校验码输入正确</font>");
								//表单提交
								submitFom();
							}
						},
						error : function(jqXHR) {
							alert("发生错误：" + jqXHR.status);
						}
					});
		} else {
			$("#codemsg").html("<font color='red'>请输入校验码</font>");
		}
	}
	//表单提交
	function submitFom() {
		$.post(prjContextPath + "/userControl/isLoginNamePwd2.action", {
			employee_loginname : $('#employee_loginname').val(),
			employee_password : $('#employee_password').val()
		},function(data) {
					if (data != null && data != "") {
						//跳转到WEB-INF下index.jsp页面
						window.location.href = prjContextPath
								+ "/layout2.jsp";
						//alert("employee_loginname="+data.employee_loginname);
						//alert("employee_password="+data.employee_password);
					} else {
						//用户把用户名密码输入的不正确，所以没法登录
						$("#codemsg").html(
								"<font color='red'>用户名或密码不正确，请重新输入！</font>");
					}
				});
	}
</script>
</head>
<body>
	登录：
	<br />
	<form>
		用户名：<input type="text" name="employee_loginname" id="employee_loginname"> <span
			id="employee_loginnamemsg"></span><br /> 
		密&emsp;码：<input type="password" name="employee_password"
			id="employee_password"> <span id="employee_passwordmsg"></span><br /> 
		校验码：<input
			type="text" name="code" id="code" />
		<!-- 一进入页面，通过src自动调用控制层生成证验码 -->
		<img id="imageCode"
			src="<%=request.getContextPath()%>/checkCodeControl/getImage.action"
			title="看不清，点击换一张" style="cursor: pointer;" /> <span id="codemsg"></span><br />
		<input type="button" id="submit" value="提交" onclick="valicheckFrom()">
	</form>

</body>
</html>
