package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDaoInf;
import com.vo.User;

@Service("userServiceImpl")
public class UserServiceImpl implements UserServiceInf {

	@Autowired
	private UserDaoInf userDaoInf;

	public int getID(String uname) {
		return userDaoInf.getID(uname);
	}

	public User login(User user) {
		return userDaoInf.login(user);
	}

	public void zhuce(User user) {
		userDaoInf.zhuce(user);
	}

}
