package com.seirin.dao.area;

import java.util.List;

import com.seirin.vo.area.Department;
import com.seirin.vo.area.Position;

public interface PositionDaoInf {
	/**
	 * 添加职称
	 * 
	 * @param position职称对象
	 */
	public void addPosition(Position position);

	/**
	 * 查询所有职称
	 * 
	 * @return 职称列表页
	 */
	public List<Position> selectPosition();

	/**
	 * 根据部门id查询职称
	 * 
	 * @param dept_id
	 * @return
	 */
	public List<Position> selectPositionByDeptid(int dept_id);

	/**
	 * 按条件查询职称
	 * 
	 * @return 职称列表页
	 */
	public List<Position> selectPositionByInfo(Position position);

	/**
	 * 根据职称id,查询职称信息
	 * 
	 * @return 职称列表页
	 */

	public Position selectPositionByid(int position_id);

	/**
	 * 根据职称id,修改职称信息
	 * 
	 * @param position 职称对象
	 */
	public void updatePosition(Position position);

	/**
	 * 根据区域id,查找出部门信息
	 * 
	 * @return 职称列表页
	 */
	public List<Department> selectDepartmentByAreaid(int area_id);

}
