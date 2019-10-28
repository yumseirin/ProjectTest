package com.dao;

import com.vo.User;

public interface UserDaoInf {
	User login(User user);

	int getID(String uname);

	void zhuce(User user);
}
