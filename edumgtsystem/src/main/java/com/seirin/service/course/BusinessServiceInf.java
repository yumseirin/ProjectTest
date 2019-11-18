package com.seirin.service.course;

import java.util.List;

import com.seirin.vo.course.ClassCourse;
import com.seirin.vo.course.StartClass;

public interface BusinessServiceInf {

	/**
	 * 查询所有班级
	 * 
	 * @return 班级集合
	 */
	public List<StartClass> selectClasses();

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
	 * @param startclass_sid
	 */
	public void addClassCourseBySid(int startclass_sid);
}
