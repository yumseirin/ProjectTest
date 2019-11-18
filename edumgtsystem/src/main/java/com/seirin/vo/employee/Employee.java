package com.seirin.vo.employee;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 员工管理
 * @author seirin
 */
@SuppressWarnings("serial")
public class Employee implements Serializable {

	private Integer employee_id; // 员工ID
	private Integer position_id; // 职称ID
	private Integer resume_id; // 简历表ID
	private String employee_name; // 员工姓名
	private String employee_loginname; // 员工登录名
	private String employee_password; // 员工密码
	private String employee_tel; // 员工电话
	private String employee_wechat; // 员工微信
	private String employee_email; // 员工EMAIL
	private String employee_qq; // 员工QQ
	private Integer employee_area; // 员工所属地域
	private String employee_status; // 员工状态（0代表禁用，1代表可用，2代表闲置，3代表工作中）
	private String employee_attribute; // 员工性质（0代表全职，1代表兼职）
	private String employee_level; // 员工等级（0代表初级，1代表中级，2代表高级）
	private String employee_business; // 员工是否出差（0代表接受，1代表不接受）
	private Date employee_create_time; // 员工信息的创建时间
	private Date employee_update_time; // 员工信息的修改时间
	private String employee_sex; // 员工性别
	private String employee_code; // 员工地区编号
	private Integer employee_tech; // 员工技术方向ID
	private Integer employee_num; // 员工所带级班数量
	private Integer employee_dept; // 员工所属部门

	private String area_name; // 区域名称
	private String department_name; // 部门名称
	private String position_name; // 职称名称
	private String tech_tname; // 技术方向

	public String getTech_tname() {
		return tech_tname;
	}

	public void setTech_tname(String tech_tname) {
		this.tech_tname = tech_tname;
	}

	public Integer getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}

	public Integer getPosition_id() {
		return position_id;
	}

	public void setPosition_id(Integer position_id) {
		this.position_id = position_id;
	}

	public Integer getResume_id() {
		return resume_id;
	}

	public void setResume_id(Integer resume_id) {
		this.resume_id = resume_id;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getEmployee_loginname() {
		return employee_loginname;
	}

	public void setEmployee_loginname(String employee_loginname) {
		this.employee_loginname = employee_loginname;
	}

	public String getEmployee_password() {
		return employee_password;
	}

	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}

	public String getEmployee_tel() {
		return employee_tel;
	}

	public void setEmployee_tel(String employee_tel) {
		this.employee_tel = employee_tel;
	}

	public String getEmployee_wechat() {
		return employee_wechat;
	}

	public void setEmployee_wechat(String employee_wechat) {
		this.employee_wechat = employee_wechat;
	}

	public String getEmployee_email() {
		return employee_email;
	}

	public void setEmployee_email(String employee_email) {
		this.employee_email = employee_email;
	}

	public String getEmployee_qq() {
		return employee_qq;
	}

	public void setEmployee_qq(String employee_qq) {
		this.employee_qq = employee_qq;
	}

	public Integer getEmployee_area() {
		return employee_area;
	}

	public void setEmployee_area(Integer employee_area) {
		this.employee_area = employee_area;
	}

	public String getEmployee_status() {
		return employee_status;
	}

	public void setEmployee_status(String employee_status) {
		this.employee_status = employee_status;
	}

	public String getEmployee_attribute() {
		return employee_attribute;
	}

	public void setEmployee_attribute(String employee_attribute) {
		this.employee_attribute = employee_attribute;
	}

	public String getEmployee_level() {
		return employee_level;
	}

	public void setEmployee_level(String employee_level) {
		this.employee_level = employee_level;
	}

	public String getEmployee_business() {
		return employee_business;
	}

	public void setEmployee_business(String employee_business) {
		this.employee_business = employee_business;
	}

	public Date getEmployee_create_time() {
		return employee_create_time;
	}

	public void setEmployee_create_time(Date employee_create_time) {
		this.employee_create_time = employee_create_time;
	}

	public Date getEmployee_update_time() {
		return employee_update_time;
	}

	public void setEmployee_update_time(Date employee_update_time) {
		this.employee_update_time = employee_update_time;
	}

	public String getEmployee_sex() {
		return employee_sex;
	}

	public void setEmployee_sex(String employee_sex) {
		this.employee_sex = employee_sex;
	}

	public String getEmployee_code() {
		return employee_code;
	}

	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}

	public Integer getEmployee_tech() {
		return employee_tech;
	}

	public void setEmployee_tech(Integer employee_tech) {
		this.employee_tech = employee_tech;
	}

	public Integer getEmployee_num() {
		return employee_num;
	}

	public void setEmployee_num(Integer employee_num) {
		this.employee_num = employee_num;
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

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public Integer getEmployee_dept() {
		return employee_dept;
	}

	public void setEmployee_dept(Integer employee_dept) {
		this.employee_dept = employee_dept;
	}
}
