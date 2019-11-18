package com.dao;

import java.util.List;

import com.vo.Employee;

public interface EmployeeDaoInf {
	/**
	 * 查询所有员工
	 * @return 员工列表页
	 */
	     public   List<Employee>  selectEmployee();
	     /**
	 	 * 添加员工
	 	 * @return 员工列表页面
	 	 */
	 	public void  addEmployee(Employee  employee) ;
}
