package com.seirin.service.area;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.seirin.dao.area.DepartmentDaoInf;
import com.seirin.vo.area.Department;

@Service
public class DepartmentServiceImpl implements DepartmentServiceInf {

	@Autowired
	private DepartmentDaoInf departmentDaoInf;

	/**
	 * 添加部门
	 * 
	 * @param 部门对象
	 */
	public void addDepartment(Department department) {

		departmentDaoInf.addDepartment(department);
	}

	/**
	 * 查询所有部门
	 * 
	 * @return 部门列表页
	 */
	public List<Department> selectDepartment() {

		return departmentDaoInf.selectDepartment();
	}

	/**
	 * 根据区域id查询部门
	 * 
	 * @param area_id
	 * @return
	 */
	public List<Department> selectDepartmentByAreaid(int area_id) {
		return departmentDaoInf.selectDepartmentByAreaid(area_id);
	}

	/**
	 * 根据部门id,查询部门信息
	 * 
	 * @return 部门列表页
	 */

	public Department selectDepartmentByid(int department_id) {

		return departmentDaoInf.selectDepartmentByid(department_id);
	}

	/**
	 * 根据部门id,修改部门信息
	 * 
	 * @param department部门对象
	 */
	public void updateDepartment(Department department) {

		departmentDaoInf.updateDepartment(department);
	}
}
