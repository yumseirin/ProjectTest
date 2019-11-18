//==========导入电子表格JS==========================

function submitFrom() {

	if (checktech_id() == false) {
		return false;
	}
	if (checkcoursesys_csname() == false) {
		return false;
	}
	if (checkupload() == false) {
		return false;
	}
	$.ajax({
		url : path + "coursesysControl/daorucoursesys.action",
		type : "POST",
		cache : false,
		data : new FormData($('#form1')[0]),
		processData : false,
		contentType : false,
		dataType : "json",
		success : function(data) {
			alert(data.msg);
			window.location.href = path + 'coursesysControl/gotocoursesysList.action';
		},
		error : function(jqXHR) {
			alert("发生错误：" + jqXHR.status);
		}
	});
}

// ========== 表单验证============================================================

// 技术方向验证
function checktech_id() {

	var tech_id = $("#tech_id").val();

	if (tech_id == null || tech_id == "") {
		$("#tech_idmsg").html("<font color='red'>技术方向不能为空</font>");
		return false;
	} else {
		$("#tech_idmsg").html("");
		return true;
	}
}

// 课程体系名称验证
function checkcoursesys_csname() {

	var coursesys_csname = $("#coursesys_csname").val();
	if (coursesys_csname == null || coursesys_csname == "") {
		$("#coursesys_csnamemsg").html("<font color='red'>课程体系名称不能为空</font>");
		return false;
	} else {
		$("#coursesys_csnamemsg").html("");
		return true;
	}
}

//上传文件验证
function checkupload() {

	var upload = $("#upload").val();
	if (upload == null || upload == "") {
		$("#exalmsg").html("<font color='red'>上传文件不能为空</font>");
		return false;
	} else {
		$("#exalmsg").html("");
		return true;
	}
}


