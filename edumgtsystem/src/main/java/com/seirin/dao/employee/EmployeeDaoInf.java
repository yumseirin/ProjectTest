package com.seirin.dao.employee;

import java.util.List;

import com.seirin.vo.employee.Employee;

public interface EmployeeDaoInf {

	/**
	 * 登录验证
	 * 
	 * @param Employee 员工信息实体类
	 * @return 员工信息实体类
	 */
	public Employee isLoginNamePwd(Employee employee);

	/**
	 * 查询所有员工
	 * 
	 * @return 员工列表页
	 */
	public List<Employee> selectEmployee();

	/**
	 * 根据员工id查询员工信息
	 * 
	 * @param employee_id
	 * @return 员工信息
	 */
	public Employee selectEmployeeByid(int employee_id);

	/**
	 * 添加员工
	 * 
	 * @return 员工列表页面
	 */
	public void addEmployee(Employee employee);

	/**
	 * 修改员工
	 * 
	 * @param employee
	 */
	public void updateEmployee(Employee employee);

	/**
	 * 修改员工所带班级数
	 * 
	 * @param employee
	 */
	public void updateEmployeeNumById(Employee employee);
}
