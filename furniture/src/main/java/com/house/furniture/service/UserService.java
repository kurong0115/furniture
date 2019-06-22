package com.house.furniture.service;

import com.github.pagehelper.Page;
import com.house.furniture.bean.User;

public interface UserService {
	
	/**
	 * 获得所有用户信息（type：0为用户，1为管理员）
	 * @return
	 */
	Page<User> selectAllUser(User user , int page, int size);
	
	/**
	 * 新增用户
	 * @param user
	 */
	public void save(User user);

	/**
	 * 查找用户的收货信息
	 * @param id
	 * @param page
	 * @param rows
	 * @return
	 */
	Page<User> queryAddress(int uid, int page, int rows);
}
