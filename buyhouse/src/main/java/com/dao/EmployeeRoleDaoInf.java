package com.dao;

import java.util.List;


import com.vo.Authority;
import com.vo.Employee;
import com.vo.Employee_Role;
import com.vo.Role;


public interface EmployeeRoleDaoInf {
	/**
	 *  查询所有员工角色     
	 *@return  员工角色列表页
	 */
	public List<Employee_Role> selectEmployeeRole();
	/**
	 * 查询所有角色
	 * @return
	 */
	public List<Role>  selectRole(int state);
	
	/**
	 * 根据ID查询出用户的信息
	 * @param employee_id
	 * @return
	 */
	public Employee getEmployeeById(String employee_id);
	/**
	 * 根据 员工ID删除员工角色表中的数据
	 * @param employee_id
	 */
	public void deleteEmployeeRole(int employee_id);
	/**
	 * 向员工角色表中添加数据
	 * @param employee_id
	 * @param role_id
	 */
	public void addEmployeeRole(int employee_id,int role_id);
	
	// =====员工权限角色管理    左边是菜单，右边是按钮 ======
	
	
	/**
	 * 根据员工id查询出一级分类
	 * @param employee_id
	 * @return
	 */
	public List<Authority> selectOne(int employee_id);
	
	
	/**
	 * 根据员工id查询二级分类
	 * @param employee_id
	 * @return
	 */
	public List<Authority> selectTwo(int employee_id);
	
	/**
	 * 根据员工id查询三级分类
	 * @param employee_id
	 * @return
	 */
	public List<Authority> selectThree(int employee_id);
	
}
