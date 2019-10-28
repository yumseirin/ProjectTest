package com.service;

import com.vo.User;

public interface UserServiceInf {
	User login(User user);

	int getID(String uname);

	void zhuce(User user);
}
