package com.seirin.service.course;

import java.util.List;

import com.seirin.vo.course.ClassRoom;
import com.seirin.vo.course.StartClass;
import com.seirin.vo.employee.Employee;

public interface StartClassServiceInf {

	/**
	 * 查询所有符合条件的讲师
	 * 
	 * @param startclass
	 * @return 讲师的员工集合
	 */
	public List<Employee> selectClasstutor(StartClass startclass);

	/**
	 * 查询所有符合条件的助教
	 * 
	 * @param startclass
	 * @return 助教的员工集合
	 */
	public List<Employee> selectTeahingassient(StartClass startclass);

	/**
	 * 查询所有符合条件的班主任
	 * 
	 * @param startclass
	 * @return 班主任的员工集合
	 */
	public List<Employee> selectTeacher(StartClass startclass);

	/**
	 * 查询所有符合条件的教室
	 * 
	 * @param startclass
	 * @return 教室集合
	 */
	public List<ClassRoom> selectClassRoomByStartClass(StartClass startclass);

	/**
	 * 添加开班信息
	 * 
	 * @param startclass
	 */
	public void addStartClass(StartClass startclass);

	/**
	 * 查找该方向开班最低周数
	 * 
	 * @param startclass
	 * @return
	 */
	public int selectTechTime(StartClass startclass);
}
