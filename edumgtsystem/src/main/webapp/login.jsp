<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>排课系统</title>
<!-- common.jsp引用css和js -->
<%@ include file="/common/common.jsp"%>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/cloud.js" type="text/javascript"></script>
<script type="text/javascript">
if (window != top)
	top.location.href = location.href;
</script>
<script language="javascript">
        $(function () {
            $('.loginbox').css({
                'position': 'absolute',
                'left': ($(window).width() - 692) / 2
            });
            $(window).resize(function () {
                $('.loginbox').css({
                    'position': 'absolute',
                    'left': ($(window).width() - 692) / 2
                });
            })
        });
    </script>

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
			$("#employee_loginnamemsg")
					.html("<font color='red'>用户名不能为空</font>");
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
			$
					.ajax({
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
		$.post(prjContextPath + "/loginControl/isLoginNamePwd.action", {
			employee_loginname : $('#employee_loginname').val(),
			employee_password : $('#employee_password').val()
		},
				function(data) {
					if (data != null && data != "") {
						//跳转到WEB-INF下index.jsp页面
						window.location.href = prjContextPath
								+ "/loginControl/gotoIndex.action";
					} else {
						//用户把用户名密码输入的不正确，所以没法登录
						$("#codemsg").html(
								"<font color='red'>用户名或密码不正确，请重新输入！</font>");
					}
				});
	}
</script>
</head>
<body
	style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
	>
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>

	<div class="logintop">
		<span>欢迎登录教务管理系统</span>
		<ul>
			<li><a href="#">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<br />
		<div class="loginbox loginbox1">
			<ul>
				<li><input type="text" name="employee_loginname"
					id="employee_loginname" class="loginuser"> <span
					id="employee_loginnamemsg"></span><br /></li>
				<li><input type="password" name="employee_password"
					id="employee_password" class="loginpwd"> <span
					id="employee_passwordmsg"></span><br /></li>
				<li class="yzm"><span><input type="text" name="code" id="code"
					value="验证码" onclick="JavaScript:this.value=''"/></span>
					<!-- 一进入页面，通过src自动调用控制层生成证验码 --> 
					<cite><img id="imageCode"
					src="<%=request.getContextPath()%>/checkCodeControl/getImage.action"
					title="看不清，点击换一张" style="cursor: pointer;" width="100%" height="100%"/><span id="codemsg"></span>
					</cite>
				</li>
				<li><input type="button" class="loginbtn" id="submit" value="提交"
					onclick="valicheckFrom()"></li>
			</ul>
		</div>
	</div>
</body>
</html>
