//checkbox实现单选功能
function chooseOne(cb, name) {

	var boxArray = document.getElementsByName(name);
	for (var i = 0; i <= boxArray.length - 1; i++) {
		if (boxArray[i] == cb && cb.checked) {
			boxArray[i].checked = true;
		} else {
			boxArray[i].checked = false;
		}
	}
}

//取得区域中复选框中的值
function getCheckBoxValue(name)// name='like'
{
	var s = "";
	var r = document.getElementsByName(name); // 数组
	
	for (var i = 0; i < r.length; i++) {
		if (r[i].checked == true)// 当选中多选框时值为true
		{  
			s += r[i].value ;// 取checkbox的value的值,区域中的复选已经变成单选的效果，所以这里不用加,分隔
		}
	}
	return s;
}