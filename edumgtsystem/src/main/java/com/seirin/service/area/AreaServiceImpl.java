package com.seirin.service.area;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seirin.dao.area.AreaDaoInf;
import com.seirin.vo.area.Area;

@Service
public class AreaServiceImpl implements AreaServiceInf {

	@Autowired
	private AreaDaoInf areaDaoInf;

	/**
	 * 添加区域
	 * 
	 * @param area 区域对象
	 */
	public void addArea(Area area) {

		areaDaoInf.addArea(area);
	}

	/**
	 * 查询所有区域
	 * 
	 * @param area 区域对象
	 */
	public List<Area> selectArea() {
		return areaDaoInf.selectArea();

	}

	/**
	 * 根据区域id,查询区域信息
	 * 
	 * @return 区域列表页
	 */

	public Area selectAreaByid(int area_id) {

		return areaDaoInf.selectAreaByid(area_id);
	}

	/**
	 * 根据区域id,修改区域信息
	 * 
	 */
	public void updateArea(Area area) {
		areaDaoInf.updatearea(area);
	}

}
