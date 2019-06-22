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
	/**
	 * 用户注册
	 * @param username
	 * @param password
	 * @param email
	 * @return
	 */
	Integer reg(String username,String password,String email);
	/**
	 * 注册查重
	 * @param username
	 * @param email
	 * @return
	 */
	User selectByUsername(String username);
	User selectByEmail(String email);
	/**
	 * 修改密码时判断用户名与邮箱是否对应
	 * @param username
	 * @param email
	 * @return
	 */
	User selectByUsernameAndEmail(String username,String email);
	/**
	 * 修改用户密码
	 * @param username
	 * @param password
	 * @return
	 */
	Integer resertPassword(User user);
	
	
}
