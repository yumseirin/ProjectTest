/**
 * 这个js文件是departmentList.jsp 用二级联动
 */

$(function() {
  
	$("#area_id").change(function() {
		
	    //	department();这里用$.post()也可以------>这是第二种方式
		
	   //$.ajax({ })   ------>    第一种方式
	
    		$.ajax({ 
    		    type: "POST", 	
    			url: path+"positionControl/selectDepartmentByAreaid.action",
    			data: {
    				area_id: $('#area_id').val()
    			},
    			dataType: "json",
    			success: function(data){  
    		//	alert("www");
    				var cs ="<option value=\"0\">全部</option>";
    				if (data  !=  null && data !=  "") { 
    					
    					for ( var i = 0; i < data.length; i++) {
    					
    						cs += "<option value=" + data[i].department_id+ ">" + data[i].department_name
    								+ "</option>";

    					}
    					}	
    				//清空原有内容
					$("#department_id").html("");
					//追加新的内容
					$("#department_id").append(cs);
    			},
    			error: function(jqXHR){     
    			   alert("发生错误：" + jqXHR.status);  
    			}    
    		});
    		
    	  

	});

});



//==========部门=======================



function department() {
  
	var area_id = $("#area_id").val();
	$.post(path+"positionControl/selectDepartmentByAreaid.action", {
		area_id : area_id
	}, callBackShiSuccess);

}
function callBackShiSuccess(json) {
       //[{"area_id":28,"department_description":"技术5566","department_id":201,"department_name":"技术部5566"},
	//    {"area_id":28,"department_description":"技术55","department_id":200,"department_name":"技术部55"}]
	if (json != null && json != "") {
		var cs ="";// "<option value=\"\">请选择城市</option>";
		for ( var i = 0; i < json.length; i++) {

			cs += "<option value=" + json[i].department_id+ ">" + json[i].department_name
					+ "</option>";

		}
		//清空原有内容
		$("#department_id").html("");
		//追加新的内容
		$("#department_id").append(cs);

	}
}
