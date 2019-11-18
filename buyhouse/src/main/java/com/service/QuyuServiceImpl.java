package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.QuyuDaoInf;
import com.vo.Quyu;

@Service
public class QuyuServiceImpl implements QuyuServiceInf{
	
	@Autowired
	private QuyuDaoInf  quyuDaoInf;
    
	/**
	 *  添加区域
	 * @param quyu  区域对象
	 */
	public void addQuyu(Quyu quyu) {
		
		quyuDaoInf.addQuyu(quyu);
	}
	/**
	 *  查询所有区域
	 * @param quyu  区域对象
	 */
	public  List<Quyu>  selectQuyu() {
		return  quyuDaoInf.selectQuyu();
		
	}
	/**
	 * 根据区域id,修改区域信息
	 * @return  区域列表页
	 */
	
	public  Quyu  selectQuyuByid(int area_id){
		
		return  quyuDaoInf.selectQuyuByid(area_id);
	}
	
	public void updateQuyu(Quyu  quyu) {
		 quyuDaoInf.updateQuyu(quyu);
	}

}
