package com.seirin.service.employee;

import java.util.List;

import com.seirin.vo.employee.Employee;

public interface EmployeeServiceInf {

	/**
	 * 登录验证
	 * 
	 * @param Employee 员工信息实体类
	 * @return 员工信息实体类
	 */
	public Employee isLoginNamePwd(Employee em);

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
	public List<Employee> addEmployee(Employee employee);

	/**
	 * 修改员工
	 * 
	 * @param employee
	 */
	public void updateEmployee(Employee employee);

}
