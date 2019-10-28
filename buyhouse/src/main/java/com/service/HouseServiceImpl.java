package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HouseDaoInf;
import com.vo.House;
import com.vo.Orderdetail;
import com.vo.Orders;

@Service("houseServiceImpl")
public class HouseServiceImpl implements HouseServiceInf {

	@Autowired
	private HouseDaoInf houseDaoInf;

	public int getCountTiao() {
		return houseDaoInf.getCountTiao();
	}

	public byte[] getHouseImg(int id) {
		House h =  houseDaoInf.getHouseImg(id);
		
		return h.getPic(); 
	}

	public List<House> getHousePage(int start, int end) {
		return houseDaoInf.getHousePage(start, end);
	}

	public List<House> listHouse() {
		return houseDaoInf.listHouse();
	}

	public void order(Orders order, Orderdetail orderdetail) {
		try {
			houseDaoInf.saveOrders(order);
			System.out.println(order.getOrdernum());
			houseDaoInf.saveOrderdetail(orderdetail);
			// houseDaoInf.commit();
		} catch (Exception e) {
			// houseDaoInf.rollback();
			e.printStackTrace();
		}
	}

	public void saveHouse(House house) {
		houseDaoInf.saveHouse(house);
	}

	public void setStatus(int id) {
		houseDaoInf.setStatus(id);
	}

}
