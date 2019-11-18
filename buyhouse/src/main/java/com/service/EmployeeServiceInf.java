package com.service;

import java.util.List;


import com.vo.Employee;

public interface EmployeeServiceInf {
	/**
	 *  查询所有员工
	 *@return  员工列表页
	 */
	public List<Employee> selectEmployee();

	/**
	 * 添加员工
	 * @return 员工列表页面
	 */
	
	public   List<Employee>  addEmployee(Employee  employee) ;
	
}
