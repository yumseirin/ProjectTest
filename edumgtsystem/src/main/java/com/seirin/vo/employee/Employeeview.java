package com.seirin.vo.employee;

import java.io.Serializable;

/**
 * @Description: 统计图
 * @author seirin
 */
@SuppressWarnings("serial")
public class Employeeview implements Serializable {
	private String label;
	private String value;

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
