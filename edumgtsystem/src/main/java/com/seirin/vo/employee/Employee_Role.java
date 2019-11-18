package com.seirin.vo.employee;

import java.io.Serializable;

/**
 * @Description:员工角色关联表
 * @author seirin
 */
@SuppressWarnings("serial")
public class Employee_Role implements Serializable {
	private Integer role_id; // 角色ID
	private Integer employee_id;// 员工ID

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}

	public Integer getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
}
