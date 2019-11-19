//==========三级联动================================
$(function() {

	$("#startclass_region").change(function() {
		techandregion();
		// 根据技术方向和区域找讲师
		tech_region_classtutor();
		// 根据技术方向和区域找助教
		tech_region_teahingassient();
		// 根据技术方向和区域找班主任
		tech_region_teacher();
	});
	$("#startclass_speonumber").blur(function() {
		if (peonumberandregion())
			// 根据人数查教室
			peonumber_classroom();
	});
});

function tech_region_classtutor() {

	$.ajax({
		type : "POST",
		url : path + "startClassControl/selectClasstutor.action",
		data : {
			tech_id : $('#tech_id').val(),
			startclass_region : $('#startclass_region').val()
		},
		dataType : "json",
		success : function(data) {
			var cs = "<option value=\"\">请选择</option>";
			// -------------------讲师-------------------
			if (data != null && data != "") {

				for (var i = 0; i < data.length; i++) {

					cs += "<option value=" + data[i].employee_id + ">"
							+ data[i].employee_name + "("
							+ data[i].employee_num + ")" + "</option>";
				}
			}
			// 清空原有内容
			$("#startclass_classtutor").html("");
			// 追加新的内容
			$("#startclass_classtutor").append(cs);

		},
		error : function(jqXHR) {
			alert("发生错误：" + jqXHR.status);
		}
	});
}

function tech_region_teahingassient() {
	$.ajax({
		type : "POST",
		url : path + "startClassControl/selectTeahingassient.action",
		data : {
			tech_id : $('#tech_id').val(),
			startclass_region : $('#startclass_region').val()
		},
		dataType : "json",
		success : function(data) {
			var cs = "<option value=\"\">请选择</option>";
			// -------------------助教-------------------
			if (data != null && data != "") {

				for (var i = 0; i < data.length; i++) {

					cs += "<option value=" + data[i].employee_id + ">"
							+ data[i].employee_name + "("
							+ data[i].employee_num + ")" + "</option>";
				}
			}
			// 清空原有内容
			$("#startclass_teahingassient").html("");
			// 追加新的内容
			$("#startclass_teahingassient").append(cs);
		},
		error : function(jqXHR) {
			alert("发生错误：" + jqXHR.status);
		}
	});
}
function tech_region_teacher() {
	$.ajax({
		type : "POST",
		url : path + "startClassControl/selectTeacher.action",
		data : {
			tech_id : $('#tech_id').val(),
			startclass_region : $('#startclass_region').val()
		},
		dataType : "json",
		success : function(data) {
			var cs = "<option value=\"\">请选择</option>";

			// -------------------班主任-------------------
			if (data != null && data != "") {

				for (var i = 0; i < data.length; i++) {

					cs += "<option value=" + data[i].employee_id + ">"
							+ data[i].employee_name + "("
							+ data[i].employee_num + ")" + "</option>";
				}
			}
			// 清空原有内容
			$("#startclass_teacher").html("");
			// 追加新的内容
			$("#startclass_teacher").append(cs);
		},
		error : function(jqXHR) {
			alert("发生错误：" + jqXHR.status);
		}
	});
}

function peonumber_classroom() {

	$.ajax({
		type : "POST",
		url : path + "startClassControl/selectClassRoomByStartClass.action",
		data : {
			startclass_speonumber : $('#startclass_speonumber').val(),
			startclass_region : $('#startclass_region').val()
		},
		dataType : "json",
		success : function(data) {
			var cs = "<option value=\"\">请选择</option>";
			// -------------------教室-------------------
			if (data != null && data != "") {

				for (var i = 0; i < data.length; i++) {

					cs += "<option value=" + data[i].classroom_cid + ">"
							+ data[i].classroom_cname + "("
							+ data[i].classroom_cpeonumber + ")" + "</option>";
				}
			}
			// 清空原有内容
			$("#classroom_cid").html("");
			// 追加新的内容
			$("#classroom_cid").append(cs);

		},
		error : function(jqXHR) {
			alert("发生错误：" + jqXHR.status);
		}
	});
}

function tech_time(){
	if (checktech_id() == false) {
		return false;
	}
	if (checkstartclass_sstarttime() == false) {
		return false;
	}
	if (checkstartclass_sendtime() == false) {
		return false;
	}
	$.ajax({
		type : "POST",
		url : path + "startClassControl/judgeTechTime.action",
		data : {
			tech_id : $('#tech_id').val(),
			startclass_sstarttime : $('#startclass_sstarttime').val(),
			startclass_sendtime : $('#startclass_sendtime').val()
		},
		dataType : "json",
		success : function(data) {
			if(data.msg!="0"){
				alert(data.msg);
				return false;
			}else{
				return true;
			}
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

	if (tech_id == null || tech_id == "" || tech_id == "0") {
		$("#tech_idmsg").html("<font color='red'>请选择技术方向</font>");
		return false;
	} else {
		$("#tech_idmsg").html("");
		return true;
	}
}

// 所属区域验证
function checkstartclass_region() {

	var startclass_region = $("#startclass_region").val();
	if (startclass_region == null || startclass_region == ""
			|| startclass_region == "0") {
		$("#startclass_regionmsg").html("<font color='red'>请选择区域</font>");
		return false;
	} else {
		$("#startclass_regionmsg").html("");
		return true;
	}
}

// 班级性质验证
function checkstartclass_snature() {

	var startclass_snature = $("#startclass_snature").val();
	if (startclass_snature == null || startclass_snature == "") {
		$("#startclass_snaturemsg").html("<font color='red'>请选择班级性质</font>");
		return false;
	} else {
		$("#startclass_snaturemsg").html("");
		return true;
	}
}

// 验证技术方向与区域
function techandregion() {

	if (checktech_id() && checkstartclass_region()) {
		return true;
	} else {
		alert("请选择技术方向与区域！")
		return false;
	}
}

// 讲师验证
function checkstartclass_classtutor() {

	var startclass_classtutor = $("#startclass_classtutor").val();
	if (startclass_classtutor == null || startclass_classtutor == "") {
		$("#startclass_classtutormsg").html("<font color='red'>请选择讲师</font>");
		return false;
	} else {
		$("#startclass_classtutormsg").html("");
		return true;
	}
}

// 助教验证
function checkstartclass_teahingassient() {

	var startclass_teahingassient = $("#startclass_teahingassient").val();
	if (startclass_teahingassient == null || startclass_teahingassient == "") {
		$("#startclass_teahingassientmsg").html(
				"<font color='red'>请选择助教</font>");
		return false;
	} else {
		$("#startclass_teahingassientmsg").html("");
		return true;
	}
}

// 班主任验证
function checkstartclass_teacher() {

	var startclass_teacher = $("#startclass_teacher").val();
	if (startclass_teacher == null || startclass_teacher == "") {
		$("#startclass_teachermsg").html("<font color='red'>请选择班主任</font>");
		return false;
	} else {
		$("#startclass_teachermsg").html("");
		return true;
	}
}

// 开班日期验证
function checkstartclass_sstarttime() {

	var startclass_sstarttime = $("#startclass_sstarttime").val();
	if (startclass_sstarttime == null || startclass_sstarttime == "") {
		$("#startclass_sstarttimemsg").html("<font color='red'>请选择开班日期</font>");
		return false;
	} else {
		$("#startclass_sstarttimemsg").html("");
		return true;
	}
}

// 结束日期验证
function checkstartclass_sendtime() {
	var startclass_sendtime = $("#startclass_sendtime").val();
	if (startclass_sendtime == null || startclass_sendtime == "") {
		$("#startclass_sendtimemsg").html("<font color='red'>请选择结束日期</font>");
		return false;
	} else {
		$("#startclass_sendtimemsg").html("");
		return true;
	}
}

// 人数验证
function checkstartclass_speonumber() {

	var startclass_speonumber = $("#startclass_speonumber").val();
	if (startclass_speonumber == null || startclass_speonumber == "") {
		$("#startclass_speonumbermsg").html("<font color='red'>人数不能为空</font>");
		return false;
	} else if (!/^[1-9][0-9]*$/.test(startclass_speonumber)){
		$("#startclass_speonumbermsg").html("<font color='red'>请输入非零正整数！</font>");
		return false;
	} else {
		$("#startclass_speonumbermsg").html("");
		return true;
	}
}

// 教室验证
function checkclassroom_cid() {

	var classroom_cid = $("#classroom_cid").val();
	if (classroom_cid == null || classroom_cid == "") {
		$("#classroom_cidmsg").html("<font color='red'>请选择教室</font>");
		return false;
	} else {
		$("#classroom_cidmsg").html("");
		return true;
	}
}

// 人数和区域验证
function peonumberandregion() {
	if (checkstartclass_speonumber() && checkstartclass_region()) {
		return true;
	} else {
		alert("请填写人数和区域！")
		return false;
	}
}

// 提交验证
function validate() {

	var b = true;

	if (!checktech_id()) { // 技术方向验证
		b = false; // alert(2);
	}
	if (!checkstartclass_region()) {// 所属区域验证

		b = false; // alert(1);
	}

	if (!checkstartclass_snature()) { // 班级性质验证
		b = false; // alert(3);
	}
	if (!checkstartclass_classtutor()) { // 讲师验证
		b = false; // alert(4);
	}
	if (!checkstartclass_teahingassient()) { // 助教验证
		b = false; // alert(5);
	}
	if (!checkstartclass_teacher()) { // 班主任验证
		b = false; // alert(6);
	}
	if (!checkstartclass_sstarttime()) { // 开班日期验证
		b = false; // alert(7);
	}
	if (!checkstartclass_sendtime()) { // 结束日期验证
		b = false; // alert(8);
	}
	if (!checkstartclass_speonumber()) { // 人数验证
		b = false; // alert(9);
	}
	if (!checkclassroom_cid()) { // 教室验证
		b = false; // alert(10);
	}if(!tech_time()){ //验证开班周数
		b = false;
	}

	if (b == true) {
		alert("提交");
		// form表单的id, 提交表单
		$("#form1").submit();
	}
}
