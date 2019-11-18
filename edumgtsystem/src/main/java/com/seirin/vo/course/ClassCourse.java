package com.seirin.vo.course;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 班级课程表
 * @author seirin
 */
@SuppressWarnings("serial")
public class ClassCourse implements Serializable {
	private Integer classcourse_id;// 班级课程表id
	private Integer startclass_sid;// 开班管理表id
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date classcourse_starttime;// 课程（周）开始时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date classcourse_endtime;// 课程（周）结束时间
	private String classcourse_name;// 班级课程名称

	public Integer getClasscourse_id() {
		return classcourse_id;
	}

	public void setClasscourse_id(Integer classcourse_id) {
		this.classcourse_id = classcourse_id;
	}

	public Integer getStartclass_sid() {
		return startclass_sid;
	}

	public void setStartclass_sid(Integer startclass_sid) {
		this.startclass_sid = startclass_sid;
	}

	public Date getClasscourse_starttime() {
		return classcourse_starttime;
	}

	public void setClasscourse_starttime(Date classcourse_starttime) {
		this.classcourse_starttime = classcourse_starttime;
	}

	public Date getClasscourse_endtime() {
		return classcourse_endtime;
	}

	public void setClasscourse_endtime(Date classcourse_endtime) {
		this.classcourse_endtime = classcourse_endtime;
	}

	public String getClasscourse_name() {
		return classcourse_name;
	}

	public void setClasscourse_name(String classcourse_name) {
		this.classcourse_name = classcourse_name;
	}

}
