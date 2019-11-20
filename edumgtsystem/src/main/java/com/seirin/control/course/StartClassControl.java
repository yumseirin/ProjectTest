package com.seirin.control.course;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seirin.service.area.AreaServiceInf;
import com.seirin.service.course.StartClassServiceInf;
import com.seirin.service.employee.TechServiceInf;
import com.seirin.vo.area.Area;
import com.seirin.vo.course.ClassRoom;
import com.seirin.vo.course.StartClass;
import com.seirin.vo.employee.Employee;
import com.seirin.vo.employee.JsonStr;
import com.seirin.vo.employee.Tech;

/**
 * @Description: 开班管理
 */
@Controller
@RequestMapping("startClassControl")
public class StartClassControl {

	@Autowired
	private AreaServiceInf areaServiceInf; // 区域

	@Autowired
	private TechServiceInf TechServiceInf;// 技术方向

	@Autowired
	private StartClassServiceInf startClassServiceInf;// 开班

	/**
	 * 跳转到开班页面
	 * 
	 * @return 开班页面
	 */
	@RequestMapping("gotoStartClass")
	public String gotoStartClass() {
		return "forward:/startClassControl/selectStartClass.action";
	}

	/**
	 * 将技术方向和区域带到页面上去
	 * 
	 * @param model
	 * @return 开班页面
	 */
	@RequestMapping("selectStartClass")
	public String selectStartClass(Model model) {
		String str = "/course/startclass";
		try {
			// 把所有技术方向带到页面上
			List<Tech> techlist = TechServiceInf.selectTech();
			model.addAttribute("techlist", techlist);
			// 所有区域带到页面上
			List<Area> arealist = areaServiceInf.selectArea();
			model.addAttribute("arealist", arealist);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 查询所有符合条件的教室
	 * 
	 * @param startclass
	 * @return 教室集合
	 */
	@RequestMapping("selectClassRoomByStartClass")
	@ResponseBody
	public List<ClassRoom> selectClassRoomByStartClass(StartClass startclass) {
		List<ClassRoom> classroomlist = startClassServiceInf.selectClassRoomByStartClass(startclass);
		return classroomlist;
	}

	/**
	 * 查询所有符合条件的讲师
	 * 
	 * @param startclass
	 * @return 讲师的员工集合
	 */
	@RequestMapping("selectClasstutor")
	@ResponseBody
	public List<Employee> selectClasstutor(StartClass startclass) {
		return startClassServiceInf.selectClasstutor(startclass);
	}

	/**
	 * 查询所有符合条件的助教
	 * 
	 * @param startclass
	 * @return 助教的员工集合
	 */
	@RequestMapping("selectTeahingassient")
	@ResponseBody
	public List<Employee> selectTeahingassient(StartClass startclass) {
		return startClassServiceInf.selectTeahingassient(startclass);
	}

	/**
	 * 查询所有符合条件的班主任
	 * 
	 * @param startclass
	 * @return 班主任的员工集合
	 */
	@RequestMapping("selectTeacher")
	@ResponseBody
	public List<Employee> selectTeacher(StartClass startclass) {
		return startClassServiceInf.selectTeacher(startclass);
	}

	/**
	 * 添加开班信息
	 * 
	 * @param startclass
	 * @return 所有班级页面
	 */
	@RequestMapping("addStartClass")
	public String addStartClass(StartClass startclass) {
		String str = "forward:/businessControl/gotoClasses.action";
		System.out.println(str);
		try {
			startClassServiceInf.addStartClass(startclass);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 判断开班时间是否大于最低开班周数
	 * 
	 * @param startclass
	 * @return
	 */
	@RequestMapping("judgeTechTime")
	@ResponseBody
	public JsonStr judgeTechTime(StartClass startclass) {
		JsonStr json = new JsonStr();
		try {
			// 该方向开班最低周数
			int techtime = startClassServiceInf.selectTechTime(startclass);
			// 获得班级起止时间
			Date sstarttime = startclass.getStartclass_sstarttime();
			Date sendtime = startclass.getStartclass_sendtime();
			int oneday = 24 * 3600 * 1000;
			int week = (int) ((sendtime.getTime() - sstarttime.getTime() - oneday) / (oneday * 7)) + 1;
			json.setSuccess(true);
			if (week < techtime) {
				json.setMsg("该技术方向课程开班时间不得低于" + techtime + "周！");
			} else {
				json.setMsg("0");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.setSuccess(false);
			json.setMsg(e.getMessage());
		}
		System.out.println(json);
		return json;
	}

}
