package com.seirin.dao.course;

import java.util.List;

import com.seirin.vo.course.ClassCourse;
import com.seirin.vo.course.StartClass;

public interface BusinessDaoInf {

	/**
	 * 查询所有班级
	 * 
	 * @return 班级集合
	 */
	public List<StartClass> selectClasses();

	/**
	 * 修改班级状态
	 * 
	 * @param startclass
	 */
	public void updateClassesStatusById(StartClass startclass);

	/**
	 * 根据id查询员工姓名
	 * 
	 * @param employee_id
	 * @return
	 */
	public String selectEmployeeNameById(int employee_id);

	/**
	 * 根据id查询技术方向名
	 * 
	 * @param tech_id
	 * @return
	 */
	public String selectTechtname(int tech_id);

	/**
	 * 根据开班id查询课程表
	 * 
	 * @param startclass_sid
	 * @return 课程表
	 */
	public List<ClassCourse> selectClassCourseBySid(int startclass_sid);

	/**
	 * 根据开班id添加课程表
	 * 
	 * @param classcourse
	 */
	public void addClassCourseBySid(ClassCourse classcourse);

	/**
	 * 根据开班startclass_sid查询排序字段coursesys_systempath
	 * 
	 * @param startclass_sid
	 * @return
	 */
	public String selectSystempathBySid(int startclass_sid);

	/**
	 * 根据id查询开班信息
	 * 
	 * @param startclass_sid
	 * @return
	 */
	public StartClass selectStartClassById(int startclass_sid);

	/**
	 * 根据开班id获取技术方向开班最低周数
	 * 
	 * @param startclass_sid
	 * @return
	 */
	public int selecTechTimeBySid(int startclass_sid);
}
