package com.seirin.control.area;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seirin.service.area.AreaServiceInf;
import com.seirin.service.area.PositionServiceInf;
import com.seirin.vo.area.Area;
import com.seirin.vo.area.Department;
import com.seirin.vo.area.Position;

/**
 * @Description: 职称管理
 */
@Controller
@RequestMapping("positionControl")
public class PositionControl {

	@Autowired
	private AreaServiceInf areaServiceInf;
	@Autowired
	private PositionServiceInf positionServiceInf;

	/**
	 * 跳转到职称列表页
	 * 
	 * @return 职称列表页
	 */
	@RequestMapping("gotoPositionList")
	public String gotoPositionList() {
		// 先去查，在往页面上带值
		return "forward:/positionControl/selectPosition.action";
	}

	/**
	 * 跳转到职称添加页面
	 * 
	 * @return 职称添加页面
	 */
	@RequestMapping("gotoAddPosition")
	public String gotoAddPosition(Model model) {
		// 所有区域带到页面上
		List<Area> areaList = areaServiceInf.selectArea();
		model.addAttribute("areaList", areaList);

		return "/area/addposition";
	}

	/**
	 * 添加职称
	 * 
	 * @return 职称列表页
	 */
	@RequestMapping("addPosition")
	public String addPosition(Position position) {
		String str = "forward:/positionControl/selectPosition.action";

		try {
			positionServiceInf.addPosition(position);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 查询所有职称
	 * 
	 * @return 职称列表页
	 */
	@RequestMapping("selectPosition")
	public String selectPosition(Model model) {

		String str = "/area/positionList";
		try {
			// 所有区域带到页面上
			List<Area> areaList = areaServiceInf.selectArea();
			model.addAttribute("areaList", areaList);

			// 所有的职称带到页面上
			List<Position> positionlist = positionServiceInf.selectPosition();
			model.addAttribute("positionlist", positionlist);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 按条件查询职称
	 * 
	 * @return 职称列表页
	 */
	@RequestMapping("selectPositionByInfo")
	public String selectPositionByInfo(Position position, Model model) {

		String str = "/area/positionList";
		try {
			// 所有区域带到页面上
			List<Area> areaList = areaServiceInf.selectArea();
			model.addAttribute("areaList", areaList);

			// 所有的职称带到页面上
			List<Position> positionlist = positionServiceInf.selectPositionByInfo(position);
			model.addAttribute("positionlist", positionlist);

			// 把区域所对应的部门带到页面上
			List<Department> department = positionServiceInf.selectDepartmentByAreaid(position.getArea_id());
			model.addAttribute("department", department);

			// 把对象传回职称列表页，为了回显条件用的
			model.addAttribute("areaid", position.getArea_id());
			model.addAttribute("depid", position.getDepartment_id());

		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 根据职称id,查找职称信息
	 * 
	 * @return 职称列表页
	 */
	@RequestMapping("selectPositionByid")
	public String selectPositionByid(int position_id, Model model) {
		String str = "/area/updateposition";
		try {
			// 根据职称id,查找职称信息
			Position position = positionServiceInf.selectPositionByid(position_id);
			model.addAttribute("position", position);

			// 所有区域带到页面上
			List<Area> areaList = areaServiceInf.selectArea();
			model.addAttribute("areaList", areaList);

			// 把区域所对应的部门带到页面上
			List<Department> department = positionServiceInf.selectDepartmentByAreaid(position.getArea_id());
			model.addAttribute("department", department);

			// 页面上取得职称position 对象中的部门id,选中部门，得职称position 对象中的区域id,选中区域

		} catch (Exception e) {
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 根据职称id,修改职称信息
	 * 
	 * @return 职称列表页
	 */
	@RequestMapping("updatePosition")
	public String updatePosition(Position position, Model model) {

		String str = "forward:/positionControl/selectPosition.action";// "/WEB-INF/quyu/positionList.jsp";
		try {
			// 先更新
			positionServiceInf.updatePosition(position);
			// 在查找所有
			// List<Position> positionlist = positionServiceInf.selectPosition();
			// model.addAttribute("positionlist", positionlist);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 根据区域id,查找出部门信息 ---->方式一
	 * 
	 * @return 职称列表页
	 */
	@RequestMapping("selectDepartmentByAreaid")
	@ResponseBody
	public List<Department> selectDepartmentByAreaid(int area_id, HttpServletResponse response) {
//		System.out.println("123");
		List<Department> departmentList = null;
		try {
			departmentList = positionServiceInf.selectDepartmentByAreaid(area_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return departmentList;
	}

	/**
	 * 根据区域id,查找出部门信息 ---->方式二
	 * 
	 * @return 职称列表页
	 * 
	 *         @RequestMapping("selectDepartmentByAreaid")
	 * @ResponseBody public String selectDepartmentByAreaid(int area_id,
	 *               HttpServletResponse response) {
	 * 
	 *               //String str = "/WEB-INF/quyu/departmentList.jsp"; String
	 *               jsonStr = ""; try {
	 * 
	 *               List<Department> departmentList =
	 *               positionServiceInf.selectDepartmentByAreaid(area_id); jsonStr =
	 *               JSON.toJSONString(departmentList);
	 *               System.out.println("jsonStr="+jsonStr);
	 * 
	 *               } catch (Exception e) { e.printStackTrace(); } return jsonStr;
	 *               }
	 */

	/*
	 * 
	 * 返回页面数据
	 * 
	 * @param returnString 返回数据
	 * 
	 * @throws CommonException 异常
	 * 
	 * response = ServletActionContext.getResponse();
	 * response.setContentType("application/json;charset=utf-8");
	 * response.getWriter().write(returnString); response.flushBuffer();
	 * response.getWriter().close();
	 * 
	 * 
	 */

}
