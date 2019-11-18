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
		var username = $("#username").val();
		if (username == null || username == "") {
			$("#usernamemsg").html("<font color='red'>用户名不能为空</font>");
			return false;
		} else {
			$("#usernamemsg").html("");
		}
		//密码验证
		var pwd = $("#pwd").val();
		if (pwd == null || pwd == "") {
			$("#pwdmsg").html("<font color='red'>密码不能为空</font>");
			return false;
		} else {
			$("#pwdmsg").html("");
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
		$.post(prjContextPath + "/userControl/isLoginNamePwd.action", {
			username : $('#username').val(),
			pwd : $('#pwd').val()
		},function(data) {
					if (data != null && data != "") {
						//跳转到WEB-INF下index.jsp页面
						window.location.href = prjContextPath
								+ "/layout.jsp";
						//alert("username="+data.username);
						//alert("pwd="+data.pwd);
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
		用户名：<input type="text" name="username" id="username"> <span
			id="usernamemsg"></span><br /> 
		密&emsp;码：<input type="password" name="pwd"
			id="pwd"> <span id="pwdmsg"></span><br /> 
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
