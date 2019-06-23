package com.house.furniture.service;

import com.github.pagehelper.Page;
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
	
	
	/**
	 * 获得所有用户信息
	 * @return
	 */
	Page<User> selectAllUser(User user , int page, int size);
	
	/**
	 * 判断用户名和邮箱是否被占用（1：成功，0：被占用）
	 * @param name
	 * @return
	 */
	public int isExist(String type, String str);
	
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
