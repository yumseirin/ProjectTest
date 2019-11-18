package com.seirin.service.employee;

import java.util.List;
import com.seirin.vo.employee.Tech;

public interface TechServiceInf {

	/**
	 * 查询所有技术方向
	 * 
	 * @return 技术方向列表
	 */
	public List<Tech> selectTech();

}
