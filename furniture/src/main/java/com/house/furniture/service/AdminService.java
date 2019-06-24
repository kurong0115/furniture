package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Admin;

public interface AdminService {
	
	/**
	 * 所有管理员信息
	 */
	List<Admin> queryAdmin();
}
