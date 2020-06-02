package com.seirin.control.area;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seirin.service.area.AreaServiceInf;
import com.seirin.service.area.DepartmentServiceInf;
import com.seirin.vo.area.Area;
import com.seirin.vo.area.Department;

/**
 * @Description: 部门管理
 */
@Controller
@RequestMapping("departmentControl")
public class DepartmentControl {

	@Autowired
	private DepartmentServiceInf departmentServiceInf;
	@Autowired
	private AreaServiceInf areaServiceInf;

	/**
	 * 跳转到部门列表页
	 * 
	 * @return 部门列表页
	 */
	@RequestMapping("gotoDepartmentList")
	public String gotoDepartmentList() {
		// 先去查，在往页面上带值
		return "forward:/departmentControl/selectDepartment.action";
	}

	/**
	 * 跳转到部门添加页面
	 * 
	 * @return 部门添加页面
	 */
	@RequestMapping("gotoAddDepartment")
	public String gotoAddDepartment(Model model) {

		List<Area> arealist = areaServiceInf.selectArea();
		model.addAttribute("arealist", arealist);

		return "/area/adddepartment";
	}

	/**
	 * 添加部门
	 * 
	 * @return 部门列表页
	 */
	@RequestMapping("addDepartment")
	public String addDepartment(Department department) {
		String str = "forward:/departmentControl/selectDepartment.action";

		try {
			departmentServiceInf.addDepartment(department);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 查询所有部门
	 * 
	 * @return 部门列表页
	 */
	@RequestMapping("selectDepartment")
	public String selectDepartment(Model model) {

		String str = "/area/departmentList";
		try {
			List<Department> departmentlist = departmentServiceInf.selectDepartment();
			model.addAttribute("departmentlist", departmentlist);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 根据部门id,查找部门信息
	 * 
	 * @return 修改部门页
	 */
	@RequestMapping("selectDepartmentByid")
	public String selectDepartmentByid(int department_id, Model model) {
		String str = "/area/updatedepartment";
		try {
			// 根据部门id,查找部门信息
			Department department = departmentServiceInf.selectDepartmentByid(department_id);
			model.addAttribute("department", department);

			// 查询所属区带到页面上
			List<Area> arealist = areaServiceInf.selectArea();
			model.addAttribute("arealist", arealist);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 根据部门id,修改部门信息
	 * 
	 * @return 部门列表页
	 */
	@RequestMapping("updateDepartment")
	public String updateDepartment(Department department, Model model) {

		String str = "/area/departmentList";
		try {
			// 先更新
			departmentServiceInf.updateDepartment(department);
			// 在查找所有
			List<Department> departmentlist = departmentServiceInf.selectDepartment();
			model.addAttribute("departmentlist", departmentlist);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;
	}

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
