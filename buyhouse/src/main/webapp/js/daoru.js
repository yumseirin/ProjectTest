
function sub() {
	
	 
	$.ajax({ 
		url: path + "/DaoRuControl/daoru.action",
	    type: "POST", 	
		cache:false,
		data:new FormData($('#form1')[0]),
		processData:false,
		contentType:false,
		dataType: "json",
		success: function(data){
			alert("fdf")
			alert(data.msg);
		},
		error: function(jqXHR){     
		   alert("发生错误：" + jqXHR.status);  
		}    
	});
 } 