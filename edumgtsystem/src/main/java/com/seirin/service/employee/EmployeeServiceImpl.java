package com.seirin.service.employee;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seirin.dao.employee.EmployeeDaoInf;
import com.seirin.vo.employee.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeServiceInf {

	@Autowired
	private EmployeeDaoInf employeeDaoInf;

	/**
	 * 查总记录数
	 * 
	 * @param employee_name
	 * @return
	 */
	public int selectRowCount(String employee_name) {
		return employeeDaoInf.selectRowCount(employee_name);
	}

	/**
	 * 登录验证
	 * 
	 * @param Employee 员工信息实体类
	 * @return 员工信息实体类
	 */
	public Employee isLoginNamePwd(Employee em) {
		Employee employee = employeeDaoInf.isLoginNamePwd(em);
		return employee;
	}

	/**
	 * 查询所有员工
	 * 
	 * @return 员工列表页
	 */

	public List<Employee> selectEmployee(Employee employee) {

		return employeeDaoInf.selectEmployee(employee);
	}

	/**
	 * 分页查询员工+根据员工姓名模糊查询
	 * 
	 * @param employee_name
	 * @param startrow
	 * @param endrow
	 * @return
	 */
	public List<Employee> selectEmployeePaging(String employee_name, int startrow, int endrow) {
		return employeeDaoInf.selectEmployeePaging(employee_name, startrow, endrow);
	}

	/**
	 * 根据员工id查询员工信息
	 * 
	 * @param employee_id
	 * @return 员工信息
	 */
	public Employee selectEmployeeByid(int employee_id) {
		return employeeDaoInf.selectEmployeeByid(employee_id);
	}

	/**
	 * 添加员工
	 * 
	 * @return 员工列表页面
	 */
	public List<Employee> addEmployee(Employee employee) {
		// 添加员工
		employee.setEmployee_create_time(new Date());
		employeeDaoInf.addEmployee(employee);
		// 查询出所有员工
		return employeeDaoInf.selectEmployee(employee);
	}

	/**
	 * 修改员工
	 * 
	 * @param employee
	 */
	public void updateEmployee(Employee employee) {
		// 添加修改时间
		employee.setEmployee_update_time(new Date());
		employeeDaoInf.updateEmployee(employee);
	}

}
