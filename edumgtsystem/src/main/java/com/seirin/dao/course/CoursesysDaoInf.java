package com.seirin.dao.course;

import java.util.List;

import com.seirin.vo.course.Coursesys;

public interface CoursesysDaoInf {
	/**
	 * 查询所有课程体系
	 * 
	 * @return 课程体系集合
	 */
	public List<Coursesys> selectCoursesys();

	/**
	 * 根据ID查询课程体系
	 * 
	 * @param coursesys_csid
	 * @return 课程体系
	 */
	public Coursesys selectCoursesysById(int coursesys_csid);
	

	/**
	 * 根据id和tech查询课程体系
	 * 
	 * @param coursesys
	 * @return
	 */
	public Coursesys selectCoursesysByTechAndCsid(Coursesys coursesys);

	/**
	 * 添加课程体系
	 * 
	 * @param coursesys
	 */
	public void addCoursesys(Coursesys coursesys);

	/**
	 * 根据id修改课程体系
	 * 
	 * @param coursesys
	 */
	public void updateCoursesysById(Coursesys coursesys);

	/**
	 * 根据ID删除课程体系
	 * 
	 * @param coursesys_csid
	 */
	public void deleteCoursesysById(int coursesys_csid);

}
