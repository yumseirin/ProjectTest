package com.seirin.service.sysmgt;

import java.util.List;

import com.seirin.vo.employee.Employee;
import com.seirin.vo.sysmgt.Authority;
import com.seirin.vo.sysmgt.EmployeeRole;
import com.seirin.vo.sysmgt.Role;

public interface EmployeeRoleServiceInf {
	/**
	 * 查询所有员工角色
	 * 
	 * @return 员工角色列表页
	 */
	public List<EmployeeRole> selectEmployeeRole(Employee employee);

	/**
	 * 根据员工id获得员工角色权限
	 * 
	 * @param employee_id
	 * @return 员工权限
	 */
	public EmployeeRole selectEmployeeRoleById(int employee_id);

	/**
	 * 查询所有角色
	 * 
	 * @return
	 */
	public List<Role> selectRole(int state);

	/**
	 * 根据ID查询出用户的信息
	 * 
	 * @param employee_id
	 * @return
	 */
	public Employee getEmployeeById(String employee_id);

	/**
	 * 根据员工id修改员工角色权限 先删向员工角色表中添加数据
	 * 
	 * @param employee
	 * @param role
	 */
	public void updateEmployeeRole(EmployeeRole employeerole, Role role);

	/**
	 * 禁用员工
	 * 
	 * @param employee_id
	 * @return
	 */
	public void disableEmployeeById(int employee_id);

	/**
	 * 启用员工
	 * 
	 * @param employee_id
	 * @return
	 */
	public void enableEmployeeById(int employee_id);

	/**
	 * 修改密码
	 * 
	 * @param employee
	 * @return
	 */
	public void updateEmployeePwd(Employee employee);

	// =====员工权限角色管理 左边是菜单，右边是按钮 ======

	/**
	 * 根据员工id查询一级分类
	 * 
	 * @param employee_id
	 * @return
	 */
	public List<Authority> selectTwo(int employee_id);

	/**
	 * 根据员工id查询出二级分类
	 * 
	 * @param employee_id
	 * @return
	 */
	public List<Authority> selectOne(int employee_id);

	/**
	 * 根据员工id查询出三级分类
	 * 
	 * @param employee_id
	 * @return
	 */
	public List<Authority> selectThree(int employee_id);

}
