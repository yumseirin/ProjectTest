package com.seirin.control.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seirin.service.area.AreaServiceInf;
import com.seirin.service.course.ClassRoomServiceInf;
import com.seirin.vo.area.Area;
import com.seirin.vo.course.ClassRoom;
import com.seirin.vo.course.StartClass;

/**
 * @Description: 教室管理
 */
@Controller
@RequestMapping("classRoomControl")
public class ClassRoomControl {

	@Autowired
	private ClassRoomServiceInf classRoomServiceInf;
	@Autowired
	private AreaServiceInf areaServiceInf;

	/**
	 * 跳转到教室列表页面
	 * 
	 * @return 教室列表页面
	 */
	@RequestMapping("gotoClassRoomList")
	public String gotoClassRoomList() {
		return "forward:/classRoomControl/selectClassRoom.action";
	}

	/**
	 * 查询所有教室
	 * 
	 * @param model
	 * @return 教室列表页面
	 */
	@RequestMapping("selectClassRoom")
	public String selectClassRoom(Model model) {
		String str = "course/classroomList";
		try {
			// 所有区域带到页面上
			List<Area> arealist = areaServiceInf.selectArea();
			model.addAttribute("arealist", arealist);
			// 把教室带到页面
			List<ClassRoom> classroomlist = classRoomServiceInf.selectClassRoom();
			model.addAttribute("classroomlist", classroomlist);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 按条件查询教室
	 * 
	 * @param classroom
	 * @param model
	 * @return 教室列表页
	 */
	@RequestMapping("selectClassRoomByInfo")
	public String selectClassRoomByInfo(ClassRoom classroom, Model model) {
		String str = "course/classroomList";
		try {
			// 所有区域带到页面上
			List<Area> arealist = areaServiceInf.selectArea();
			model.addAttribute("arealist", arealist);
			// 把教室带到页面
			List<ClassRoom> classroomlist = classRoomServiceInf.selectClassRoomByInfo(classroom);
			model.addAttribute("classroomlist", classroomlist);
			// 把对象传回职称列表页，为了回显条件用的
			model.addAttribute("areaid", classroom.getArea_id());
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 跳转到教室添加页面
	 * 
	 * @return 教室添加页面
	 */
	@RequestMapping("gotoAddClassRoom")
	public String gotoAddClassRoom(Model model) {
		// 所有区域带到页面上
		List<Area> arealist = areaServiceInf.selectArea();
		model.addAttribute("arealist", arealist);
		return "/course/addclassroom";
	}

	/**
	 * 添加教室
	 * 
	 * @return 教室列表页
	 */
	@RequestMapping("addClassRoom")
	public String addClassRoom(ClassRoom classroom) {
		String str = "forward:/classRoomControl/selectClassRoom.action";

		try {
			classRoomServiceInf.addClassRoom(classroom);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 根据教室id,查找教室信息
	 * 
	 * @return 修改教室页
	 */
	@RequestMapping("selectclassRoomByid")
	public String selectclassRoomByid(int classroom_cid, Model model) {
		String str = "/course/updateclassroom";
		try {
			// 根据部门id,查找教室信息
			ClassRoom classroom = classRoomServiceInf.selectclassRoomByid(classroom_cid);
			model.addAttribute("classroom", classroom);
			// 查询所有区带到页面上
			List<Area> arealist = areaServiceInf.selectArea();
			model.addAttribute("arealist", arealist);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 根据教室id,修改教室信息
	 * 
	 * @return 教室列表页
	 */
	@RequestMapping("updateClassRoom")
	public String updateClassRoom(ClassRoom classroom, Model model) {

		String str = "/course/classroomList";
		try {
			// 先更新
			classRoomServiceInf.updateClassRoom(classroom);
			// 在查找所有
			List<ClassRoom> classroomlist = classRoomServiceInf.selectClassRoom();
			model.addAttribute("classroomlist", classroomlist);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 查询该教室是否在正在上课的班级中
	 * 
	 * @param classroom
	 * @return
	 */
	@RequestMapping("selectclassroominclasses")
	@ResponseBody
	public String selectclassroominclasses(ClassRoom classroom) {
		StartClass startclass = classRoomServiceInf.selectclassroominclasses(classroom.getClassroom_cid());
		if (startclass != null) {
			System.out.println("返回1");
			return "{\"success\":1}";
		}

		else {
			System.out.println("返回0");
			return "{\"success\":0}";
		}
	}

}
