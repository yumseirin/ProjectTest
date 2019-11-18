package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.Authority;
import com.vo.Employee;
import com.vo.Employee_Role;
import com.vo.Role;
import com.dao.EmployeeRoleDaoInf;

@Service
public class EmployeeRoleServiceImpl  implements  EmployeeRoleServiceInf{
	
	@Autowired
	private EmployeeRoleDaoInf  employeeRoleDaoInf;
	
	/**
	 *  查询所有员工角色     
	 *@return  员工角色列表页
	 */
	public List<Employee_Role> selectEmployeeRole() {
	
		return 	employeeRoleDaoInf.selectEmployeeRole();
	}

	/**
	 * 查询所有角色
	 * @return
	 */
	public List<Role>  selectRole(int state) {
		
		return 	employeeRoleDaoInf.selectRole(state);
	}

	/**
	 * 根据ID查询出用户的信息
	 * @param employee_id
	 * @return
	 */
	public Employee getEmployeeById(String employee_id) {
		
		return 	employeeRoleDaoInf.getEmployeeById(employee_id);
	}
	
	 /**
	    * 向员工角色表中添加数据
	    * @param employee
	    * @param role
	    */
	  public void addEmployeeRole (Employee employee,Role role){
		  
		  //先根据员工id来删除
		  employeeRoleDaoInf.deleteEmployeeRole(employee.getEmployee_id());
		  
		  //添加
		  employeeRoleDaoInf.addEmployeeRole(employee.getEmployee_id(), role.getRole_id());
	  }
	  
	  
	// =====员工权限角色管理    左边是菜单，右边是按钮 ======
		
		
		/**
		 * 根据员工id查询二级分类
		 * @param employee_id
		 * @return
		 */
		public List<Authority> selectTwo(int employee_id){
			
			return employeeRoleDaoInf.selectTwo(employee_id);
			
			
		}
		
		
		/**
		 * 根据员工id查询出一级分类
		 * @param employee_id
		 * @return
		 */
		public List<Authority> selectOne(int employee_id){
			
			return employeeRoleDaoInf.selectOne(employee_id);
			
		}
		
		
		/**
		 * 根据员工id查询出三级分类
		 * @param employee_id
		 * @return
		 */
		public List<Authority> selectThree(int employee_id){
			
			return employeeRoleDaoInf.selectThree(employee_id);
			
		}
	
}
