package com.seirin.dao.area;

import java.util.List;
import com.seirin.vo.area.Department;

public interface DepartmentDaoInf {
	/**
	 * 添加部门
	 * 
	 * @param 部门对象
	 */
	public void addDepartment(Department department);

	/**
	 * 查询所有部门
	 * 
	 * @return 部门列表页
	 */
	public List<Department> selectDepartment();

	/**
	 * 根据区域id查询部门
	 * 
	 * @param area_id
	 * @return
	 */
	public List<Department> selectDepartmentByAreaid(int area_id);

	/**
	 * 根据部门id,查询部门信息
	 * 
	 * @return 部门列表页
	 */

	public Department selectDepartmentByid(int department_id);

	/**
	 * 根据部门id,修改部门信息
	 * 
	 * @param department 部门对象
	 */
	public void updateDepartment(Department department);

}
