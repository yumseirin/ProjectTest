package com.seirin.dao.employee;

import java.util.List;

import com.seirin.vo.employee.Employee;
import com.seirin.vo.area.Department;
import com.seirin.vo.area.Position;

public interface DaoruDaoInf {

	/**
	 * 根据员工姓名，得到员工信息
	 * 
	 * @param employee_loginname员工登录名
	 * @return
	 */
	public Employee selectEmployeeByemployee_loginname(String employee_loginname);

	/**
	 * 更新员工信息
	 * 
	 * @param employee 员工信息
	 */
	public void updateEmployee(Employee employee);

	/**
	 * 添加员工信息
	 * 
	 * @param employee 员工信息
	 */
	public void insertEmployee(Employee employee);

	/**
	 * 根据部门查询出职称
	 * 
	 * @param Position职称信息
	 */
	public List<Position> selectDepatByposition(Department deptid);

	/**
	 * 向员工角色表中添加信息
	 * 
	 * @param employeeid 员工id
	 * @param role_id    角色id
	 */
	public void insertEmployee_Role(int employeeid, int role_id);

	/**
	 * 将员工角色表中信息修改
	 * 
	 * @param employeeid 员工id
	 * @param role_id    角色id
	 */
	public void updateEmployee_Role(int employeeid, int role_id);

}
