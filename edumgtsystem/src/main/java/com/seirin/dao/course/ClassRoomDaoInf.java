package com.seirin.dao.course;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seirin.vo.course.ClassRoom;
import com.seirin.vo.course.StartClass;

public interface ClassRoomDaoInf {

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
	 * @param model
	 * @return 教室列表页
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
	
	/**
	 * 修改教室状态
	 * 
	 * @param classroom_cid
	 * @param classroom_cstatus
	 */
	public void updateClassRoomStatus(@Param(value="classroom_cid")int classroom_cid,@Param(value="classroom_cstatus") String classroom_cstatus);
	
	/**
	 * 查询该教室是否在正在上课的班级中
	 * 
	 * @param classroom
	 * @return
	 */
	public StartClass selectclassroominclasses(int classroom_cid);
}
