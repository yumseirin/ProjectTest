package com.service;

import java.util.List;

import com.vo.House;
import com.vo.Orderdetail;
import com.vo.Orders;

public interface HouseServiceInf {

	void saveHouse(House house);

	List<House> listHouse();

	byte[] getHouseImg(int id);

	void order(Orders order, Orderdetail orderdetail);

	void setStatus(int id);

	int getCountTiao();

	List<House> getHousePage(int start, int end);
}
