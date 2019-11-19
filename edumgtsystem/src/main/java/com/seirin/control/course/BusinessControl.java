package com.seirin.control.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seirin.service.course.BusinessServiceInf;
import com.seirin.service.course.ClassRoomServiceInf;
import com.seirin.vo.course.ClassCourse;
import com.seirin.vo.course.ClassRoom;
import com.seirin.vo.course.StartClass;

@Controller
@RequestMapping("businessControl")
public class BusinessControl {

	@Autowired
	private BusinessServiceInf businessServiceInf;
	
	@Autowired
	private ClassRoomServiceInf classRoomServiceInf;

	/**
	 * 去所有班级页面
	 * 
	 * @return 班级页面
	 */
	@RequestMapping("gotoClasses")
	public String gotoClasses() {
		return "forward:/businessControl/selectClassesList.action";
	}

	/**
	 * 查询所有班级
	 * 
	 * @param model
	 * @return 班级页面
	 */
	@RequestMapping("selectClassesList")
	public String selectClassesList(Model model) {
		String str = "/course/classesList";
		try {
			List<StartClass> startclasslist = businessServiceInf.selectClasses();
			model.addAttribute("startclasslist", startclasslist);
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
	 * 跳转课程表页面
	 * 
	 * @param model
	 * @param startclass_sid
	 * @return 课程表页面
	 */
	@RequestMapping("gotoClassCourse")
	public String gotoClassCourse(Model model, int startclass_sid) {
		String str = "/course/classcourse";
		try {
			// 在课程表中根据开班ID查询该班是否有课表，有就返回，没有就添加再返回
			List<ClassCourse> classcourselist = businessServiceInf.selectClassCourseBySid(startclass_sid);
			if (classcourselist.size() == 0) {
				businessServiceInf.addClassCourseBySid(startclass_sid);
				classcourselist = businessServiceInf.selectClassCourseBySid(startclass_sid);
			}
			model.addAttribute("classcourselist", classcourselist);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

}
