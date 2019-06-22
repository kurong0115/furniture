package com.house.furniture.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.house.furniture.bean.User;
import com.house.furniture.bean.UserExample;
import com.house.furniture.bean.UserExample.Criteria;
import com.house.furniture.dao.AddressMapper;
import com.house.furniture.dao.UserMapper;
import com.house.furniture.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	UserMapper userMapper;
	
	@Resource
	AddressMapper address;

	@Override
	public Page<User> selectAllUser(User user , int page, int size) {
		UserExample ue = new UserExample();
		Criteria c = ue.createCriteria();
		
		if(user.getName() != null && user.getName().isEmpty() == false) {
			c.andNameLike("%" + user.getName() + "%");
		}
		
		if(user.getEmail() != null && user.getEmail().isEmpty() == false) {
			c.andEmailLike("%" + user.getEmail() + "%");
		}
		
		Page<User> p = PageHelper.startPage(page, size);
		userMapper.selectByExample(ue);
		return p;
	}
	
	public void save(User user) {
		userMapper.insertSelective(user);
	}

	@Override
	public Page<User> queryAddress(int uid, int page, int rows) {
		Page<User> p = PageHelper.startPage(page, rows);
		address.selectByUid(uid);
		return p;
	}

}
