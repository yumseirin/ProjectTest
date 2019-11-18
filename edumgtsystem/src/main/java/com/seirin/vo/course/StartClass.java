package com.seirin.vo.course;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 开班管理
 * @author seirin
 */
@SuppressWarnings("serial")
public class StartClass implements Serializable {

	private Integer startclass_sid;// 开班管理表ID
	private Integer tech_id;// 技术方向ID
	private Integer classroom_cid;// 教室ID
	private String startclass_sno;// 班级编号
	private Integer startclass_speonumber;// 班级人数
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startclass_sstarttime;// 开班时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startclass_sendtime;// 结束时间
	private Integer startclass_teacher;// 班主任
	private Integer startclass_teahingassient;// 助教
	private Integer startclass_classtutor;// 讲师
	private String startclass_snature;// 班级性质
	private String startclass_sstatus;// 班级状态
	private String startclass_school;// 学校信息
	private Integer startclass_region;// 开班地域

	private String classtutor_name;// 讲师
	private String teahingassient_name;// 助教
	private String teacher_name;// 班主任
	private String tech_tname; // 技术方向名称

	public Integer getStartclass_sid() {
		return startclass_sid;
	}

	public void setStartclass_sid(Integer startclass_sid) {
		this.startclass_sid = startclass_sid;
	}

	public Integer getTech_id() {
		return tech_id;
	}

	public void setTech_id(Integer tech_id) {
		this.tech_id = tech_id;
	}

	public Integer getClassroom_cid() {
		return classroom_cid;
	}

	public void setClassroom_cid(Integer classroom_cid) {
		this.classroom_cid = classroom_cid;
	}

	public String getStartclass_sno() {
		return startclass_sno;
	}

	public void setStartclass_sno(String startclass_sno) {
		this.startclass_sno = startclass_sno;
	}

	public Integer getStartclass_speonumber() {
		return startclass_speonumber;
	}

	public void setStartclass_speonumber(Integer startclass_speonumber) {
		this.startclass_speonumber = startclass_speonumber;
	}

	public Date getStartclass_sstarttime() {
		return startclass_sstarttime;
	}

	public void setStartclass_sstarttime(Date startclass_sstarttime) {
		this.startclass_sstarttime = startclass_sstarttime;
	}

	public Date getStartclass_sendtime() {
		return startclass_sendtime;
	}

	public void setStartclass_sendtime(Date startclass_sendtime) {
		this.startclass_sendtime = startclass_sendtime;
	}

	public Integer getStartclass_teacher() {
		return startclass_teacher;
	}

	public void setStartclass_teacher(Integer startclass_teacher) {
		this.startclass_teacher = startclass_teacher;
	}

	public Integer getStartclass_teahingassient() {
		return startclass_teahingassient;
	}

	public void setStartclass_teahingassient(Integer startclass_teahingassient) {
		this.startclass_teahingassient = startclass_teahingassient;
	}

	public Integer getStartclass_classtutor() {
		return startclass_classtutor;
	}

	public void setStartclass_classtutor(Integer startclass_classtutor) {
		this.startclass_classtutor = startclass_classtutor;
	}

	public String getStartclass_snature() {
		return startclass_snature;
	}

	public void setStartclass_snature(String startclass_snature) {
		this.startclass_snature = startclass_snature;
	}

	public String getStartclass_sstatus() {
		return startclass_sstatus;
	}

	public void setStartclass_sstatus(String startclass_sstatus) {
		this.startclass_sstatus = startclass_sstatus;
	}

	public String getStartclass_school() {
		return startclass_school;
	}

	public void setStartclass_school(String startclass_school) {
		this.startclass_school = startclass_school;
	}

	public Integer getStartclass_region() {
		return startclass_region;
	}

	public void setStartclass_region(Integer startclass_region) {
		this.startclass_region = startclass_region;
	}

	public String getClasstutor_name() {
		return classtutor_name;
	}

	public void setClasstutor_name(String classtutor_name) {
		this.classtutor_name = classtutor_name;
	}

	public String getTeahingassient_name() {
		return teahingassient_name;
	}

	public void setTeahingassient_name(String teahingassient_name) {
		this.teahingassient_name = teahingassient_name;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getTech_tname() {
		return tech_tname;
	}

	public void setTech_tname(String tech_tname) {
		this.tech_tname = tech_tname;
	}

}
