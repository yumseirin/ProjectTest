package com.dao;

import java.util.List;

import com.vo.House;
import com.vo.Orderdetail;
import com.vo.Orders;

public interface HouseDaoInf {
	void saveHouse(House house);

	List<House> listHouse();

	House getHouseImg(int id);

	void saveOrders(Orders order);

	void saveOrderdetail(Orderdetail orderdetail);

	void setStatus(int id);

	int getCountTiao();

	List<House> getHousePage(int start, int end);
}
