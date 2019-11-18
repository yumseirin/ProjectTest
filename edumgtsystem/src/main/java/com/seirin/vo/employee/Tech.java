package com.seirin.vo.employee;

import java.io.Serializable;

/**
 * @Description: 技术方向
 * @author seirin
 */
@SuppressWarnings("serial")
public class Tech implements Serializable {

	private int tech_id; // 技术方向ID
	private String tech_tname; // 技术方向名称
	private Integer tech_time; // 该方向开班时间底线周数

	public int getTech_id() {
		return tech_id;
	}

	public void setTech_id(int tech_id) {
		this.tech_id = tech_id;
	}

	public String getTech_tname() {
		return tech_tname;
	}

	public void setTech_tname(String tech_tname) {
		this.tech_tname = tech_tname;
	}

	public Integer getTech_time() {
		return tech_time;
	}

	public void setTech_time(Integer tech_time) {
		this.tech_time = tech_time;
	}

}
