package com.seirin.service.course;

import java.util.List;

import com.seirin.vo.course.ClassRoom;

public interface ClassRoomServiceInf {

	/**
	 * 查询所有 教室
	 * 
	 * @return 教室集合
	 */
	public List<ClassRoom> selectClassRoom();

	/**
	 * 按条件查询教室
	 * 
	 * @param classroom
	 * @return 教室集合
	 */
	public List<ClassRoom> selectClassRoomByInfo(ClassRoom classroom);

	/**
	 * 添加教室
	 * 
	 * @param classroom 教室对象
	 */
	public void addClassRoom(ClassRoom classroom);

	/**
	 * 根据教室id查询教室信息
	 * 
	 * @param classroom_cid
	 * @return 教室对象
	 */
	public ClassRoom selectclassRoomByid(int classroom_cid);

	/**
	 * 修改教室信息
	 * 
	 * @param classroom
	 */
	public void updateClassRoom(ClassRoom classroom);

}
