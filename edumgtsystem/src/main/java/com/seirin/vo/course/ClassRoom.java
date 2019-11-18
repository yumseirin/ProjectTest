package com.seirin.vo.course;

import java.io.Serializable;

/**
 * @Description: 教室管理
 * @author seirin
 */
@SuppressWarnings("serial")
public class ClassRoom implements Serializable {
	private Integer classroom_cid; // 教室ID
	private Integer area_id; // 区域名
	private String classroom_cname; // 教室名
	private String classroom_cstatus; // 教室状态（0代表空闲可用，1占用不可用）
	private String classroom_cpeonumber; // 教室容纳人数
	private String area_name; // 区域名

	public Integer getClassroom_cid() {
		return classroom_cid;
	}

	public void setClassroom_cid(Integer classroom_cid) {
		this.classroom_cid = classroom_cid;
	}

	public Integer getArea_id() {
		return area_id;
	}

	public void setArea_id(Integer area_id) {
		this.area_id = area_id;
	}

	public String getClassroom_cname() {
		return classroom_cname;
	}

	public void setClassroom_cname(String classroom_cname) {
		this.classroom_cname = classroom_cname;
	}

	public String getClassroom_cstatus() {
		return classroom_cstatus;
	}

	public void setClassroom_cstatus(String classroom_cstatus) {
		this.classroom_cstatus = classroom_cstatus;
	}

	public String getClassroom_cpeonumber() {
		return classroom_cpeonumber;
	}

	public void setClassroom_cpeonumber(String classroom_cpeonumber) {
		this.classroom_cpeonumber = classroom_cpeonumber;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

}
