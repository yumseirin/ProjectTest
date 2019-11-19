//==========三级联动================================
$(function() {

	$("#employee_area").change(function() {
		// 根据区找到部门
		area_depat();
	});

	$("#employee_dept").change(function() {
		// 根据部门找到职称
		depat_position();
	});
});

function area_depat() {

	$.ajax({
		type : "POST",
		url : path + "positionControl/selectDepartmentByAreaid.action",
		data : {
			area_id : $('#employee_area').val()
		},
		dataType : "json",
		success : function(data) {
			var cs = "<option value=\"\">请选择</option>";
			if (data != null && data != "") {

				for (var i = 0; i < data.length; i++) {

					cs += "<option value=" + data[i].department_id + ">"
							+ data[i].department_name + "</option>";
				}
			}
			// 清空原有内容
			$("#employee_dept").html("");
			// 追加新的内容
			$("#employee_dept").append(cs);

		},
		error : function(jqXHR) {
			alert("发生错误：" + jqXHR.status);
		}
	});
}
function depat_position() {
	$.ajax({
		type : "POST",
		url : path + "daoRuControl/selectDepatByposition.action",
		data : {
			department_id : $('#employee_dept').val()
		},
		dataType : "json",
		success : function(data) {

			var cs = "<option value=\"\">请选择</option>";
			if (data != null && data != "") {

				for (var i = 0; i < data.length; i++) {

					cs += "<option value=" + data[i].position_id + ">"
							+ data[i].position_name + "</option>";

				}
			}
			// 清空原有内容
			$("#position_id").html("");
			// 追加新的内容
			$("#position_id").append(cs);
		},
		error : function(jqXHR) {
			alert("发生错误：" + jqXHR.status);
		}
	});
}

//
// $(function() {
//  
// $("#employee_area").change(function() {
//		
// // department();这里用$.post()也可以------>这是第二种方式
//		
// //$.ajax({ }) ------> 第一种方式
//	
// $.ajax({
// type: "POST",
// url: path+"positionControl/selectDepartmentByAreaid.action",
// data: {
// area_id: $('#employee_area').val()
// },
// dataType: "json",
// success: function(data){
//    			
// var cs ="";
// if (data != null && data != "") {
//    					
// for ( var i = 0; i < data.length; i++) {
//    						
// cs += "<option value=" + data[i].department_id+ ">" + data[i].department_name
// + "</option>";
//
// }
// }
// //清空原有内容
// $("#employee_dept").html("");
// //追加新的内容
// $("#employee_dept").append(cs);
// },
// error: function(jqXHR){
// alert("发生错误：" + jqXHR.status);
// }
// });
//    		
//    	  
//
// });
//
// });

// ========== 表单验证============================================================

// 姓名验证
function checkemployee_name() {
	var employee_name = $("#employee_name").val();
	if (employee_name == null || employee_name == "") {
		$("#employee_namemsg").html("<font color='red'>姓名不能为空</font>");
		return false;
	}else if (!/^([\u4e00-\u9fa5]{1,20}|[a-zA-Z\\.\\s]{1,20})$/.test(employee_name)) {
		$("#employee_namemsg").html("<font color='red'>请输入纯英文或中文，不得超过20位</font>");
		return false;
	} else {
		$("#employee_namemsg").html("");
		return true;
	}
}
// 性别验证
function checkemployee_sex() {

	var employee_sex = $("#employee_sex").val();
	if (employee_sex == null || employee_sex == "") {
		$("#employee_sexmsg").html("<font color='red'>性别不能为空</font>");
		return false;
	} else {
		$("#employee_sexmsg").html("");
		return true;
	}
}

// 用户名验证
function checkemployee_loginname() {

	var employee_loginname = $("#employee_loginname").val();
	if (employee_loginname == null || employee_loginname == "") {
		$("#employee_loginnamemsg").html("<font color='red'>用户名不能为空</font>");
		return false;
	}else if (!/[a-zA-Z]\w{4,16}/.test(employee_loginname)) {
		$("#employee_loginnamemsg").html("<font color='red'>4-16位由英文开头，英文和数字组成</font>");
		return false;
	} else {
		$("#employee_loginnamemsg").html("");
		return true;
	}
}

// 密码验证
function checkemployee_password() {

	var employee_password = $("#employee_password").val();
	if (employee_password == null || employee_password == "") {
		$("#employee_passwordmsg").html("<font color='red'>密码不能为空</font>");
		return false;
	} else if (!/\w{4,16}/.test(employee_password)) {
		$("#employee_passwordmsg").html("<font color='red'>4-16位由英文和数字组成</font>");
		return false;
	}else {
		$("#employee_passwordmsg").html("");
		return true;
	}
}

// 所属区域验证
function checkarea_id() {

	var employee_area = $("#employee_area").val();
	// alert(employee_area);
	if (employee_area == null || employee_area == "" || employee_area == "0") {
		$("#employee_areamsg").html("<font color='red'>所属区域不能为空</font>");
		return false;
	} else {
		$("#employee_areamsg").html("");
		return true;
	}
}

// 部门验证
function checkemployee_dept() {

	var employee_dept = $("#employee_dept").val();

	if (employee_dept == null || employee_dept == "" || employee_dept == "0") {
		$("#employee_deptmsg").html("<font color='red'>部门不能为空</font>");
		return false;
	} else {
		$("#employee_deptmsg").html("");
		return true;
	}
}
// 职称验证
function checkposition_id() {

	var position_id = $("#position_id").val();
	if (position_id == null || position_id == "" || position_id == "0") {
		$("#position_idmsg").html("<font color='red'>职称不能为空</font>");
		return false;
	} else {
		$("#position_idmsg").html("");
		return true;
	}
}

// 技术方向验证
function checkemployee_tech() {

	var employee_tech = $("#employee_tech").val();
	if (employee_tech == null || employee_tech == "" || employee_tech == "0") {
		$("#employee_techmsg").html("<font color='red'>技术方向不能为空</font>");
		return false;
	} else {
		$("#employee_techmsg").html("");
		return true;
	}
}

// 等级验证
function checkemployee_level() {

	var employee_level = $("#employee_level").val();
	if (employee_level == null || employee_level == "") {
		$("#employee_levelmsg").html("<font color='red'>等级不能为空</font>");
		return false;
	} else {
		$("#employee_levelmsg").html("");
		return true;
	}
}

// 出差验证
function checkemployee_business() {

	var employee_business = $("#employee_business").val();
	if (employee_business == null || employee_business == "") {
		$("#employee_businessmsg").html("<font color='red'>出差不能为空</font>");
		return false;
	} else {
		$("#employee_businessmsg").html("");
		return true;
	}
}

// 手机验证
function checkemployee_tel() {

	var employee_tel = $("#employee_tel").val();
	if (employee_tel == null || employee_tel == "") {
		$("#employee_telmsg").html("<font color='red'>手机不能为空</font>");
		return false;
	}else if (!/^1(3|4|5|7|8)\d{9}$/.test(employee_tel)) {
		$("#employee_telmsg").html("<font color='red'>请输入13\\14\\15\\17\\18开头的11位数字</font>");
		return false;
	} else {
		$("#employee_telmsg").html("");
		return true;
	}
}

//性质验证
function checkemployee_attribute() {

	var employee_attribute = $("#employee_attribute").val();
	if (employee_attribute == null || employee_attribute == "") {
		$("#employee_attributemsg").html("<font color='red'>性质不能为空</font>");
		return false;
	} else {
		$("#employee_attributemsg").html("");
		return true;
	}
}

//邮箱验证
function checkemployee_email(){
	var employee_email = $("#employee_email").val();
	if (employee_email == null || employee_email == "") {
		$("#employee_emailmsg").html("<font color='red'>邮箱不能为空</font>");
		return false;
	} else if (!/^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4})*$/.test(employee_email)) {
		$("#employee_emailmsg").html("<font color='red'>邮箱格式不对！</font>");
		return false;
	} else {
		$("#employee_emailmsg").html("");
		return true;
	}
}

// 微信验证
function checkemployee_wechat() {

	var employee_wechat = $("#employee_wechat").val();
	if (employee_wechat == null || employee_wechat == "") {
		$("#employee_wechatmsg").html("<font color='red'>微信不能为空</font>");
		return false;
	} else {
		$("#employee_wechatmsg").html("");
		return true;
	}
}

// 提交验证
function validate() {

	var b = true;

	if (!checkemployee_sex()) { // 性别验证
		b = false; // alert(2);
	}
	if (!checkemployee_name()) {// 姓名验证

		b = false; // alert(1);
	}

	if (!checkemployee_loginname()) { // 用户名验证
		b = false; // alert(3);
	}
	if (!checkemployee_password()) { // 密码验证
		b = false; // alert(4);
	}
	if (!checkemployee_tel()) { // 手机验证
		b = false; // alert(5);
	}
	if (!checkemployee_email()){//邮箱验证
		b = false;
	}
	if (!checkemployee_wechat()) { // 微信验证
		b = false; // alert(6);
	}
	if (!checkarea_id()) { // 所属区域验证
		b = false; // alert(7);
	}
	if (!checkemployee_dept()) { // 部门验证
		b = false; // alert(8);
	}
	if (!checkposition_id()) { // 职称验证
		b = false; // alert(9);
	}
	if (!checkemployee_tech()) { // 技术方向验证
		b = false; // alert(10);
	}
	if (!checkemployee_level()) { // 等级验证
		b = false; // alert(11);
	}
	if (!checkemployee_business()) { // 出差验证
		b = false; // alert(12);
	}

	if (b == true) {
		//alert("提交");
		// form表单的id, 提交表单
		$("#form1").submit();
		// 如下写法不要用，这样虽然请求可以提交过去，但数据传不到后台。
		// window.location.href=path+"areaControl/addArea.action";
	}
}
