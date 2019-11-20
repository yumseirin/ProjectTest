package com.seirin.control.sysmgt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seirin.service.employee.EmployeeServiceInf;
import com.seirin.service.sysmgt.EmployeeRoleServiceInf;
import com.seirin.util.MessageUtil;
import com.seirin.vo.employee.Employee;
import com.seirin.vo.sysmgt.EmployeeRole;
import com.seirin.vo.sysmgt.Role;

/**
 * @Description: 角色权限管理
 */
@Controller
@RequestMapping("employeeRoleControl")
public class EmployeeRoleControl {

	@Autowired
	private EmployeeRoleServiceInf employeeRoleServiceInf;
	
	@Autowired
	private EmployeeServiceInf employeeServiceInf; // 员工

	/**
	 * 跳转到员工权限管理列表页
	 * 
	 * @return 员工权限管理列表页
	 */
	@RequestMapping("gotoEmployeeRoleList")
	public String gotoEmployeeRoleList() {
		// 先去查，再往页面上带值
		return "forward:/employeeRoleControl/selectEmployeeRole.action";
	}

	/**
	 * 查询所有员工权限
	 * 
	 * @return 员工权限管理列表页
	 */
	@RequestMapping("selectEmployeeRole")
	public String selectEmployeeRole(Employee employee,Model model) {

		String str = "/sysmgt/employeeroleList";
		try {
			// 所有员工权限带到页面上
			List<EmployeeRole> employeeroleList = employeeRoleServiceInf.selectEmployeeRole(employee);
			model.addAttribute("employeeroleList", employeeroleList);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 根据员工id获得员工角色权限
	 * 
	 * @param employee_id
	 * @param model
	 * @return 员工权限页
	 */
	@RequestMapping("gotoUpdateEmployeeRole")
	public String gotoUpdateEmployeeRole(int employee_id, Model model) {
		Employee employee = employeeServiceInf.selectEmployeeByid(employee_id);
		model.addAttribute("employee", employee);
		EmployeeRole employeerole = employeeRoleServiceInf.selectEmployeeRoleById(employee_id);
		model.addAttribute("employeerole", employeerole);
		List<Role> roleList = employeeRoleServiceInf.selectRole(MessageUtil.ROLE_STATE_YOUXIAO);
		model.addAttribute("roleList", roleList);
		return "/sysmgt/updateemployeerole";
	}

	/**
	 * 修改员工角色权限
	 * 
	 * @param employeerole
	 * @return
	 */
	@RequestMapping("updateEmployeeRole")
	public String updateEmployeeRole(EmployeeRole employeerole, Role role) {
		String str = "forward:/employeeRoleControl/selectEmployeeRole.action";
		try {
			employeeRoleServiceInf.updateEmployeeRole(employeerole, role);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 禁用员工
	 * 
	 * @param employee_id
	 * @return
	 */
	@RequestMapping("disableEmployeeById")
	public String disableEmployeeById(int employee_id) {
		String str = "forward:/employeeRoleControl/selectEmployeeRole.action";
		try {
			employeeRoleServiceInf.disableEmployeeById(employee_id);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 启用员工
	 * 
	 * @param employee_id
	 * @return
	 */
	@RequestMapping("enableEmployeeById")
	public String enableEmployeeById(int employee_id) {
		String str = "forward:/employeeRoleControl/selectEmployeeRole.action";
		try {
			employeeRoleServiceInf.enableEmployeeById(employee_id);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 跳转修改密码页面
	 * 
	 * @param employee_id
	 * @return
	 */
	@RequestMapping("gotoUpdateEmployeePwd")
	public String gotoUpdateEmployeePwd(int employee_id, Model model) {
		model.addAttribute("employee_id", employee_id);
		return "/sysmgt/updatepwd";
	}

	/**
	 * 修改密码
	 * 
	 * @param employee
	 * @return
	 */
	@RequestMapping("updateEmployeePwd")
	public String updateEmployeePwd(Employee employee) {
		String str = "forward:/employeeRoleControl/selectEmployeeRole.action";
		try {
			employeeRoleServiceInf.updateEmployeePwd(employee);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

}
