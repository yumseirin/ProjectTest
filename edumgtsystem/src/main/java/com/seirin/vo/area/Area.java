package com.seirin.vo.area;

import java.io.Serializable;
import java.util.List;

/**
 * @Description:区域管理
 * @author seirin
 */
@SuppressWarnings("serial")
public class Area implements Serializable {
	private int area_id; // 区域ID
	private String area_code; // 区域编码
	private String area_name; // 区域名称

	private List<Department> department;// 部门集合

	public int getArea_id() {
		return area_id;
	}

	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}

	public String getArea_code() {
		return area_code;
	}

	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public List<Department> getDepartment() {
		return department;
	}

	public void setDepartment(List<Department> department) {
		this.department = department;
	}
}
