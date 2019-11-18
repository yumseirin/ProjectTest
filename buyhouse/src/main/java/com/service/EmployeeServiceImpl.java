package com.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.EmployeeDaoInf;
import com.vo.Employee;


@Service
public class EmployeeServiceImpl implements EmployeeServiceInf {

	@Autowired
	private EmployeeDaoInf   employeeDaoInf;


	/**
	 * 查询所有员工
	 * 
	 * @return 员工列表页
	 */

	public   List<Employee>    selectEmployee() {
		
		return employeeDaoInf.selectEmployee();
	}

	/**
	 * 添加员工
	 * @return 员工列表页面
	 */
	public  List<Employee>   addEmployee(Employee  employee) {
	   //添加员工
		employee.setEmployee_create_time(new Date());
		 employeeDaoInf.addEmployee(employee);
		//查询出所有员工
		return  employeeDaoInf.selectEmployee();
	}

	
}
