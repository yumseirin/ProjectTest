package com.seirin.vo.area;

import java.io.Serializable;
import java.util.List;

/**
 * @Description: 部门管理
 * @author seirin
 */
@SuppressWarnings("serial")
public class Department implements Serializable {
	private int department_id; // 部门ID
	private int area_id; // 区域id
	private String department_name; // 部门名称
	private String department_description; // 部门描述

	private String area_name; // 区域名称

	private List<Position> position; // 职称集合

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public int getArea_id() {
		return area_id;
	}

	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getDepartment_description() {
		return department_description;
	}

	public void setDepartment_description(String department_description) {
		this.department_description = department_description;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public List<Position> getPosition() {
		return position;
	}

	public void setPosition(List<Position> position) {
		this.position = position;
	}
}
