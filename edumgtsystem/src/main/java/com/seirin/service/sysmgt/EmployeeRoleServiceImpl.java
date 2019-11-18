package com.seirin.service.sysmgt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seirin.dao.sysmgt.EmployeeRoleDaoInf;
import com.seirin.vo.employee.Employee;
import com.seirin.vo.sysmgt.Authority;
import com.seirin.vo.sysmgt.EmployeeRole;
import com.seirin.vo.sysmgt.Role;

@Service
public class EmployeeRoleServiceImpl implements EmployeeRoleServiceInf {

	@Autowired
	private EmployeeRoleDaoInf employeeRoleDaoInf;

	/**
	 * 查询所有员工角色
	 * 
	 * @return 员工角色列表页
	 */
	public List<EmployeeRole> selectEmployeeRole(Employee employee) {

		return employeeRoleDaoInf.selectEmployeeRole(employee);
	}

	/**
	 * 根据员工id获得员工角色权限
	 * 
	 * @param employee_id
	 * @return 员工权限
	 */
	public EmployeeRole selectEmployeeRoleById(int employee_id) {
		return employeeRoleDaoInf.selectEmployeeRoleById(employee_id);
	}

	/**
	 * 查询所有角色
	 * 
	 * @return
	 */
	public List<Role> selectRole(int state) {

		return employeeRoleDaoInf.selectRole(state);
	}

	/**
	 * 根据ID查询出用户的信息
	 * 
	 * @param employee_id
	 * @return
	 */
	public Employee getEmployeeById(String employee_id) {

		return employeeRoleDaoInf.getEmployeeById(employee_id);
	}

	/**
	 * 根据员工id修改员工角色权限
	 * 先删向员工角色表中添加数据
	 * 
	 * @param employee
	 * @param role
	 */
	public void updateEmployeeRole(EmployeeRole employeerole, Role role) {

		// 先根据员工id来删除
		employeeRoleDaoInf.deleteEmployeeRole(employeerole.getEmployee_id());

		// 添加
		employeeRoleDaoInf.addEmployeeRole(employeerole.getEmployee_id(), role.getRole_id());
	}
	
	/**
	 * 禁用员工
	 * 
	 * @param employee_id
	 * @return
	 */
	public void disableEmployeeById(int employee_id) {
		employeeRoleDaoInf.disableEmployeeById(employee_id);
	}
	
	/**
	 * 启用员工
	 * 
	 * @param employee_id
	 * @return
	 */
	public void enableEmployeeById (int employee_id) {
		employeeRoleDaoInf.enableEmployeeById(employee_id);
	}
	
	/**
	 * 修改密码
	 * 
	 * @param employee
	 */
	public void updateEmployeePwd(Employee employee) {
		employeeRoleDaoInf.updateEmployeePwd(employee);
	}
	// =====员工权限角色管理 左边是菜单，右边是按钮 ======

	/**
	 * 根据员工id查询二级分类
	 * 
	 * @param employee_id
	 * @return
	 */
	public List<Authority> selectTwo(int employee_id) {

		return employeeRoleDaoInf.selectTwo(employee_id);

	}

	/**
	 * 根据员工id查询出一级分类
	 * 
	 * @param employee_id
	 * @return
	 */
	public List<Authority> selectOne(int employee_id) {

		return employeeRoleDaoInf.selectOne(employee_id);

	}

	/**
	 * 根据员工id查询出三级分类
	 * 
	 * @param employee_id
	 * @return
	 */
	public List<Authority> selectThree(int employee_id) {

		return employeeRoleDaoInf.selectThree(employee_id);

	}
}
