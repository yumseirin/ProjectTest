package com.seirin.vo.employee;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 员工简历
 * @author seirin
 */
@SuppressWarnings("serial")
public class Resume implements Serializable {
	private Integer resume_id;// 简历id
	private Integer employee_id;// 员工id
	private String resume_expreience;// 工作经验
	private String resume_school;// 毕业学校
	private Date resume_date;// 毕业日期
	private String resume_professional;// 专业

	public Integer getResume_id() {
		return resume_id;
	}

	public void setResume_id(Integer resume_id) {
		this.resume_id = resume_id;
	}

	public Integer getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}

	public String getResume_expreience() {
		return resume_expreience;
	}

	public void setResume_expreience(String resume_expreience) {
		this.resume_expreience = resume_expreience;
	}

	public String getResume_school() {
		return resume_school;
	}

	public void setResume_school(String resume_school) {
		this.resume_school = resume_school;
	}

	public Date getResume_date() {
		return resume_date;
	}

	public void setResume_date(Date resume_date) {
		this.resume_date = resume_date;
	}

	public String getResume_professional() {
		return resume_professional;
	}

	public void setResume_professional(String resume_professional) {
		this.resume_professional = resume_professional;
	}

}
