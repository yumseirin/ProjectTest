package com.dao;

import java.util.List;

import com.vo.Quyu;


public interface QuyuDaoInf {
	/**
	 *  添加区域
	 * @param quyu  区域对象
	 */
	public void addQuyu(Quyu quyu);
	
	/**
	 *  查询所有区域
	 * @param quyu  区域对象
	 */
	public List<Quyu> selectQuyu();

	/**
	 * 根据区域id,修改区域信息
	 * @return  区域列表页
	 */
	
	public  Quyu  selectQuyuByid(int area_id);
	public void updateQuyu(Quyu  quyu);

}
