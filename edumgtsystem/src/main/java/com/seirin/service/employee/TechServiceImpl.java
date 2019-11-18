package com.seirin.service.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.seirin.dao.employee.TechDaoInf;
import com.seirin.vo.employee.Tech;

@Service
public class TechServiceImpl implements TechServiceInf {

	@Autowired
	private TechDaoInf techDaoInf;

	/**
	 * 查询技术方向
	 * 
	 * @return 技术方向列表
	 */
	public List<Tech> selectTech() {

		return techDaoInf.selectTech();
	}

}
