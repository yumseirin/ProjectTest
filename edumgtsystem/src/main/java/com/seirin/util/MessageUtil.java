package com.seirin.util;

/**
 * @Description:常量类
 */
public class MessageUtil {

	// ===============角色管理=========================
	// 角色状态（0代表有效）
	public static final int ROLE_STATE_YOUXIAO = 0;
	// 角色状态（1代表无效）
	public static final int ROLE_STATE_WUXIAO = 1;

	// ===============员工管理=========================
	// 员工状态（0代表禁用，1代表可用，2代表闲置，3代表工作中）
	public static final int EMPLOYEE_STATUS_JINYONG = 0;
	public static final int EMPLOYEE_STATUS_KEYONG = 1;
	public static final int EMPLOYEE_STATUS_XIANZHI = 2;
	public static final int EMPLOYEE_STATUS_GONGZUO = 3;

	// 员工性质（0代表全职，1代表兼职）
	public static final int EMPLOYEE_ATTRIBUTE_QUANZHI = 0;
	public static final int EMPLOYEE_ATTRIBUTE_JIANZHI = 1;

	// 员工等级（0代表初级，1代表中级，2代表高级）
	public static final int EMPLOYEE_LEVEL_CHUJI = 0;
	public static final int EMPLOYEE_LEVEL_ZHONGJI = 1;
	public static final int EMPLOYEE_LEVEL_GAOJI = 2;

	// 员工是否出差（0代表接受，1代表不接受）
	public static final int EMPLOYEE_BUSINESS_JIESHOU = 0;
	public static final int EMPLOYEE_BUSINESS_BUJIESHOU = 1;

	// 性别
	public static final int EMPLOYEE_SEX_MAN = 0;
	public static final int EMPLOYEE_SEX_WOMAN = 1;

	// 批量上传，导入提示信息
	public static final String DAORU_SUCCESS = "导入成功";
	public static final String DAORU_FAIL = "导入失败";

	// =======用户登录===================================
	public static final String NO_SESSION = "您未登录或登录超时,请重新登录";

	// =======教室管理===========================================
	// 教室状态（0代表可用，1不可用）
	public static final int CLASSROM_CSTATUS_KEYONG = 0;
	public static final int CLASSROM_CSTATUS_BUKEYONG = 1;

	// ========开班管理==========================================
	// 班级性质（0就业，1实训，2校内实施）
	public static final int STARTCLASS_NATURE_JIUYE = 0;
	public static final int STARTCLASS_NATURE_SHIXUN = 1;
	public static final int STARTCLASS_NATURE_XIAONEISHISHI = 2;

	// 班级状态（0正在上课，1未上课，2已结课）
	public static final int STARTCLASS_STATUS_SHANGKE = 0;
	public static final int STARTCLASS_STATUS_WEIKAIKE = 1;
	public static final int STARTCLASS_STATUS_JIEKE = 2;
	
}
