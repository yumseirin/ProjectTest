package com.seirin.vo.area;

import java.io.Serializable;

/**
 * @Description:职称管理
 * @author seirin
 */
@SuppressWarnings("serial")
public class Position implements Serializable {
	private int position_id; // 职称ID
	private int department_id; // 部门ID
	private String position_name; // 职称名称

	private int area_id; // 区域id
	private String area_name; // 区域名称
	private String department_name; // 部门名称

	public int getPosition_id() {
		return position_id;
	}

	public void setPosition_id(int position_id) {
		this.position_id = position_id;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public int getArea_id() {
		return area_id;
	}

	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}
}
