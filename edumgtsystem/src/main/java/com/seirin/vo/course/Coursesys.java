package com.seirin.vo.course;

import java.io.Serializable;

/**
 * @Description: 课程体系
 * @author seirin
 */
@SuppressWarnings("serial")
public class Coursesys implements Serializable {
	private Integer coursesys_csid;// 课程体系编号
	private String coursesys_csname;// 课程体系名称
	private Integer tech_id;// 技术方向id
	private String coursesys_systempath;// 排序字段

	private String tech_tname;// 技术名称

	public Integer getCoursesys_csid() {
		return coursesys_csid;
	}

	public void setCoursesys_csid(Integer coursesys_csid) {
		this.coursesys_csid = coursesys_csid;
	}

	public String getCoursesys_csname() {
		return coursesys_csname;
	}

	public void setCoursesys_csname(String coursesys_csname) {
		this.coursesys_csname = coursesys_csname;
	}

	public Integer getTech_id() {
		return tech_id;
	}

	public void setTech_id(Integer tech_id) {
		this.tech_id = tech_id;
	}

	public String getCoursesys_systempath() {
		return coursesys_systempath;
	}

	public void setCoursesys_systempath(String coursesys_systempath) {
		this.coursesys_systempath = coursesys_systempath;
	}

	public String getTech_tname() {
		return tech_tname;
	}

	public void setTech_tname(String tech_tname) {
		this.tech_tname = tech_tname;
	}

}
