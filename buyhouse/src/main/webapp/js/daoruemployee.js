//==========导入电子表格JS==========================

	  function submitFrom() {
	  
	    if(checkarea_id() == false){   
	    	return false;
	    } 
	    if(checkemployee_dept() == false){    
	    	return false;
	    } 
	    if(checkposition_id() == false){    
	    	return false;
	    }  
	    if(checkrole_id() == false){   
	    	return false;
	    } 
	    
	    if(checkemployee_tech() == false){   
	    	return false;
	    } 
	  
	  
		$.ajax({ 
			url: path + "DaoRuControl/daoru.action",
		    type: "POST", 	
			cache:false,
			data:new FormData($('#form1')[0]),
			processData:false,
			contentType:false,
			dataType: "json",
			success: function(data){
				alert(data.msg);
			},
			error: function(jqXHR){     
			   alert("发生错误：" + jqXHR.status);  
			}    
		});
	 } 
	  
//==========三级联动================================
$(function() {
  
	$("#employee_area").change(function() {
		     //根据区找到部门
		    area_depat();
    	});
	
	$("#employee_dept").change(function() {
		       //根据部门找到职称
			  depat_position();
	   });
  });

function area_depat(){
	
	$.ajax({ 
	    type: "POST", 	
		url: path+"positionControl/selectDepartmentByAreaid.action",
		data: {
			area_id: $('#employee_area').val()
		},
		dataType: "json",
		success: function(data){  
		
			var cs ="<option value=\"\">请选择</option>";
			if (data  !=  null && data !=  "") { 
				
				for ( var i = 0; i < data.length; i++) {
					
					cs += "<option value=" + data[i].department_id+ ">" + data[i].department_name
							+ "</option>";

				}	
				}
			//清空原有内容
			$("#employee_dept").html("");
			//追加新的内容
			$("#employee_dept").append(cs);
		},
		error: function(jqXHR){     
		   alert("发生错误：" + jqXHR.status);  
		}    
	});
}

function depat_position(){
	
	$.ajax({ 
	    type: "POST", 	
		url: path+"DaoRuControl/selectDepatByposition.action",
		data: {
			department_id: $('#employee_dept').val()
		},
		dataType: "json",
		success: function(data){  
	
			var cs ="<option value=\"\">请选择</option>";
			if (data  !=  null && data !=  "") { 
				
				for ( var i = 0; i < data.length; i++) {
				
					cs += "<option value=" + data[i].position_id+ ">" + data[i].position_name
							+ "</option>";

				}	
				}
			//清空原有内容
			$("#position_id").html("");
			//追加新的内容
			$("#position_id").append(cs);
		},
		error: function(jqXHR){     
		   alert("发生错误：" + jqXHR.status);  
		}    
	});
}




//========== 表单验证============================================================

// 所属区域验证
			function checkarea_id() {

			var employee_area = $("#employee_area").val();

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
			if (position_id == null || position_id == ""  || position_id == "0") {
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
			if (employee_tech == null || employee_tech == ""  || employee_tech == "0") {
				$("#employee_techmsg").html("<font color='red'>职称不能为空</font>");
				return false;
			} else {
				$("#employee_techmsg").html("");
				return true;
			}
		}
			
			// 所属角色验证
			function checkrole_id() {

			var role_id = $("#role_id").val();
			
			if (role_id == null || role_id == ""  || role_id == "0") {
				$("#role_idmsg").html("<font color='red'>所属角色不能为空</font>");
				return false;
			} else {
				$("#role_idmsg").html("");
				return true;
			}
		}

