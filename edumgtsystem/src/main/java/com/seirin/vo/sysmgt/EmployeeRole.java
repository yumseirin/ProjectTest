package com.seirin.vo.sysmgt;

import java.io.Serializable;

import com.seirin.vo.employee.Employee;

/**
 * @Description: 员工角色管理
 * @author seirin
 */
@SuppressWarnings("serial")
public class EmployeeRole extends Employee implements Serializable {

	private int role_id; // 角色ID
	private String role_name; // 角色名称
	private String role_state; // 角色状态（0代表有效，1代表无效）

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getRole_state() {
		return role_state;
	}

	public void setRole_state(String role_state) {
		this.role_state = role_state;
	}
}
