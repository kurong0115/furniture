package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.User;

public interface UserService {
	/**
	 * 	用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	User login(String username,String password);
}
