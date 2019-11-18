var path="<%=basePath%>";
	//角色名称验证
	function checkrolename() {
		var role_name = $("#role_name").val();
		if (role_name == null || role_name == "") {
			$("#rolenamemsg").html("<font color='red'>角色名称不能为空</font>");
			return false;
		} else {

			$("#rolenamemsg").html("");
			return true;
		}
	}
	//角色描述验证
	function checkdescription() {

		var role_description = $("#role_description").val();
		if (role_description == null || role_description == "") {
			$("#descriptionmsg").html("<font color='red'>角色描述不能为空</font>");
			return false;
		} else {
			$("#descriptionmsg").html("");
			return true;
		}
	}
	
	// 角色权限验证
/*	function checkquanxian() {

		var role_quanxian = $("#role_quanxian").val();
		if (role_quanxian == null || role_quanxian == "") {
			$("#quanxianmsg").html("<font color='red'>角色权限不能为空</font>");
			return false;
		} else {
			$("#quanxianmsg").html("");
			return true;
		}
	}*/
	
   //提交验证
	function validate() {
		
		//得到权限树的id    实际上是权限表中的AUTHORITY_ID主键            
		var value = $('#role_quanxian').combotree('getValues');
	
		//把权限表中的AUTHORITY_ID主键给文本框赋值
		 $('#auid ').val(value);
		 
		 
		var b = true;
		if (!checkrolename()) {
			b = false
		}
		;
		if (!checkdescription()) {
			b = false
		}
		;
		
		
	
		if (b == true) {

			//form表单的id, 提交表单 
			$("#form1").submit();
			//如下写法不要用，这样虽然请求可以提交过去，但数据传不到后台。
			// window.location.href=path+"quyuControl/addQuyu.action";
		}
	}