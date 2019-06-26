package com.house.furniture.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.house.furniture.bean.Admin;
import com.house.furniture.dao.AdminMapper;
import com.house.furniture.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	AdminMapper am;

	@Override
	public List<Admin> queryAdmin() {
		return am.selectByExample(null);
	}

}
