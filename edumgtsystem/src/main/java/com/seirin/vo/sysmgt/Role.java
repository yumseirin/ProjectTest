package com.seirin.vo.sysmgt;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description:角色管理
 * @author seirin
 */
@SuppressWarnings("serial")
public class Role implements Serializable {
	private int role_id; // 角色ID
	private String role_name; // 角色名称
	private String role_state; // 角色状态（0代表有效，1代表无效）
	private String role_description; // 角色描述
	private int role_create_admin; // 创建角色人的ID
	private Date role_create_date; // 角色创建时间
	private int role_update_admin; // 修改角色人的ID
	private Date role_update_date; // 角色修改时间

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

	public String getRole_description() {
		return role_description;
	}

	public void setRole_description(String role_description) {
		this.role_description = role_description;
	}

	public int getRole_create_admin() {
		return role_create_admin;
	}

	public void setRole_create_admin(int role_create_admin) {
		this.role_create_admin = role_create_admin;
	}

	public Date getRole_create_date() {
		return role_create_date;
	}

	public void setRole_create_date(Date role_create_date) {
		this.role_create_date = role_create_date;
	}

	public int getRole_update_admin() {
		return role_update_admin;
	}

	public void setRole_update_admin(int role_update_admin) {
		this.role_update_admin = role_update_admin;
	}

	public Date getRole_update_date() {
		return role_update_date;
	}

	public void setRole_update_date(Date role_update_date) {
		this.role_update_date = role_update_date;
	}
}
