package com.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 导入成功，失败提交的实体类
 * @Date: 2018.2.2
 * @author lv
 * @version 1.0
 */

public class JsonStr implements Serializable {
	
	private boolean success = false;      // 是否成功
	private String msg = "";                     // 提示信息
	private Object obj = null;                 // 其他信息

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
