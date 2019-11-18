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
	function addtab(names, url) {

		if ($("#tt2").tabs('exists', '员工权限管理')) { //判断选项卡 是否重复 有则返回false
			alert("不可重复打开选项卡");

		} else {
			// 添加一个未选中状态的选项卡面板----在方法表中的add里有如下写好的方法
			$('#tt2')
					.tabs(
							'add',
							{
								title : names,
								selected : true,//false 没有直接打开  ture是直接打开了
								closable : true, //让标签后面带X号,可以关闭
								//不能用href，因为href只加载body中的内容
								//content:'text.html' 这样写只把text.html这句话加载到页面上了
								//这里用user.html 这里加查询,这里height设置成98%就行，要不出滚动条
								content : "<iframe frameborder='0' width='100%' height='98%' marginheight='3' marginwidth='2' scrolling='auto' src='${pageContext.request.contextPath}/"
										+ url + "'></iframe>"

							});

		}
	}
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
</script>
<script type="text/javascript">
	function valicheckFrom() {
		//校验码验证
		var code = $("#code").val();
		var f = false;

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
								f = true;
							}
						},
						error : function(jqXHR) {
							alert("发生错误：" + jqXHR.status);
						}
					});
		} else {
			$("#codemsg").html("<font color='red'>请输入校验码</font>");
		}
		return f;
	}
</script>
<script type="text/javascript">
	function piliangdaoru() {
		$.ajax({
			url : "${pageContext.request.contextPath}"
					+ "/daoRuControl/daoru.action",
			type : "POST",
			cache : false,
			data : new FormData($('#form1')[0]),
			processData : false,
			contentType : false,
			dataType : "json",
			success : function(data) {
				alert(data.msg);
			},
			error : function(jqXHR) {
				alert("发生错误：" + jqXHR.status);
			}
		});
	}
</script>
</head>
<!--手册 Layout（布局）里-->
<body class="easyui-layout">
	<div
		data-options="region:'north',href:'${pageContext.request.contextPath}/layout/north.jsp',title:'欢迎使用教务排课系统',split:true"
		style="height: 100px;"></div>

	<div
		data-options="region:'west',href:'${pageContext.request.contextPath}/layout/west.jsp',title:'主菜单',split:true"
		style="width: 200px;"></div>
	<div data-options="region:'center',title:'center title'"
		style="padding: 5px; background: #eee;">

		<div id="tt2" class="easyui-tabs" data-options="fit:true">
			<div title="内容" style="padding: 20px; display: none;">
				<form action="">
					验证码： <input id="code" type="text">
					<!-- 一进入页面，通过src自动调用控制层生成证验码 -->
					<img id="imageCode"
						src="<%=request.getContextPath()%>/checkCodeControl/getImage.action"
						title="看不清，点击换一张" style="cursor: pointer;" /> <span id="codemsg"></span>
					<br> <input type="button" value="验证"
						onclick="valicheckFrom();">
				</form>
				<br>
				<form id="form1" action="<%=basePath%>daoRuControl/daoru.action"
					method="post" enctype="multipart/form-data">
					<table width="100%" border="0" align="left" cellspacing="0"
						cellpadding="0" bordercolor="red">
						<tr align="center">
							<td width="100" class="inputText"><br />文件导入: <input
								type="file" id="upload" name="upload" class="{required:true}"
								maxlength="16" /> <span id="exalmsg" style="color: red"></span>

							</td>

						</tr>
						<tr align="center">
							<td width="100" class="inputText"><br /> <br /> (<a
								href="<%=basePath%>file/employee.xls">模板下载</a>,请上传.xls文件)</td>
						</tr>
						<tr align="center">
							<td width="10" height="20" align="center"><br /> <br /> <input
								type="button" value="提交" onclick="piliangdaoru()"></td>
						</tr>
						<tr >
							<td valign="bottom" align="center"></td>
						</tr>
						<tr align="center">
							<td><a
								href="${pageContext.request.contextPath}/daoRuControl/daochu.action">文件导出</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>