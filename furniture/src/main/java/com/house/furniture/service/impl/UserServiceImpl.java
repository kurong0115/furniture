package com.house.furniture.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.apache.jasper.TrimSpacesOption;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.User;
import com.house.furniture.bean.UserExample;
import com.house.furniture.dao.UserMapper;
import com.house.furniture.service.UserService;

@Service
@ComponentScan("com.house.furniture.dao")
public class UserServiceImpl implements UserService {
	
	@Resource()
	private UserMapper userMapper;
	
	@Override
	public User login(String username, String password) {
		UserExample userExample = new UserExample();
		userExample.createCriteria().andNameEqualTo(username.trim()).andPasswordEqualTo(password.trim());
		List<User> user =  userMapper.selectByExample(userExample);
		System.out.println("正在登录的是：" + user.get(0).getName());
		return user.size() == 0 ? null : user.get(0);
	}


	
}
