package com.seirin.dao.area;

import java.util.List;

import com.seirin.vo.area.Area;

public interface AreaDaoInf {
	/**
	 * 添加区域
	 * 
	 * @param area 区域对象
	 */
	public void addArea(Area area);

	/**
	 * 查询所有区域
	 * 
	 * @param area 区域对象
	 */
	public List<Area> selectArea();

	/**
	 * 根据区域id,修改区域信息
	 * 
	 * @return 区域列表页
	 */

	public Area selectAreaByid(int area_id);

	public void updatearea(Area area);

}