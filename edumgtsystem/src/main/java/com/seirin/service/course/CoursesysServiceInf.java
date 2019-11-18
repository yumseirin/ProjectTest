package com.seirin.service.course;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.seirin.vo.course.Coursesys;

public interface CoursesysServiceInf {

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
	 * 根据id删除课程体系
	 * 
	 * @param coursesys_csid
	 */
	public void deleteCoursesys(int coursesys_csid);

	/**
	 * 导入添加课程体系
	 * 
	 * @param files
	 * @param coursesys
	 * @return
	 */
	public int daorucoursesys(MultipartFile file, Coursesys coursesys) throws Exception;

}
