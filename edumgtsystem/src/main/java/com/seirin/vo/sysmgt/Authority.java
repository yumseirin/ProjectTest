package com.seirin.vo.sysmgt;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 权限管理
 * @author seirin
 */
@SuppressWarnings("serial")
public class Authority implements Serializable {
	private Integer AUTHORITY_ID; // 权限 ID
	private String AUTHORITY_NAME; // 权限名称
	private String AUTHORITY_CODE; // 权限编码
	private String AUTHORITY_DESCRIPTION; // 权限描述
	private String AUTHORITY_URL; // 权限URL
	private String AUTHORITY_LEVEL; // 权限等级
	private Integer AUTHORITY_PARENT_ID; // 权限父ID
	private String AUTHORITY_STATUS; // 权限状态（0代表可用，1代表禁用）
	private String AUTHORITY_TYPE;// 权限类型（0代表菜单，1代表按钮）
	private Date AUTHORITY_CREATE_DATE; // 权限创建时间
	private String AUTHORITY_checked; // 是否被选中

	public Integer getAUTHORITY_ID() {
		return AUTHORITY_ID;
	}

	public void setAUTHORITY_ID(Integer aUTHORITY_ID) {
		AUTHORITY_ID = aUTHORITY_ID;
	}

	public String getAUTHORITY_NAME() {
		return AUTHORITY_NAME;
	}

	public void setAUTHORITY_NAME(String aUTHORITY_NAME) {
		AUTHORITY_NAME = aUTHORITY_NAME;
	}

	public String getAUTHORITY_CODE() {
		return AUTHORITY_CODE;
	}

	public void setAUTHORITY_CODE(String aUTHORITY_CODE) {
		AUTHORITY_CODE = aUTHORITY_CODE;
	}

	public String getAUTHORITY_DESCRIPTION() {
		return AUTHORITY_DESCRIPTION;
	}

	public void setAUTHORITY_DESCRIPTION(String aUTHORITY_DESCRIPTION) {
		AUTHORITY_DESCRIPTION = aUTHORITY_DESCRIPTION;
	}

	public String getAUTHORITY_URL() {
		return AUTHORITY_URL;
	}

	public void setAUTHORITY_URL(String aUTHORITY_URL) {
		AUTHORITY_URL = aUTHORITY_URL;
	}

	public String getAUTHORITY_LEVEL() {
		return AUTHORITY_LEVEL;
	}

	public void setAUTHORITY_LEVEL(String aUTHORITY_LEVEL) {
		AUTHORITY_LEVEL = aUTHORITY_LEVEL;
	}

	public Integer getAUTHORITY_PARENT_ID() {
		return AUTHORITY_PARENT_ID;
	}

	public void setAUTHORITY_PARENT_ID(Integer aUTHORITY_PARENT_ID) {
		AUTHORITY_PARENT_ID = aUTHORITY_PARENT_ID;
	}

	public String getAUTHORITY_STATUS() {
		return AUTHORITY_STATUS;
	}

	public void setAUTHORITY_STATUS(String aUTHORITY_STATUS) {
		AUTHORITY_STATUS = aUTHORITY_STATUS;
	}

	public String getAUTHORITY_TYPE() {
		return AUTHORITY_TYPE;
	}

	public void setAUTHORITY_TYPE(String aUTHORITY_TYPE) {
		AUTHORITY_TYPE = aUTHORITY_TYPE;
	}

	public Date getAUTHORITY_CREATE_DATE() {
		return AUTHORITY_CREATE_DATE;
	}

	public void setAUTHORITY_CREATE_DATE(Date aUTHORITY_CREATE_DATE) {
		AUTHORITY_CREATE_DATE = aUTHORITY_CREATE_DATE;
	}

	public String getAUTHORITY_checked() {
		return AUTHORITY_checked;
	}

	public void setAUTHORITY_checked(String aUTHORITY_checked) {
		AUTHORITY_checked = aUTHORITY_checked;
	}
}
