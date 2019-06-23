package com.house.furniture.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.User;
import com.house.furniture.bean.UserExample;
import com.house.furniture.dao.UserMapper;
import com.house.furniture.service.UserService;

@Service
@ComponentScan(basePackages = {"com.house.furniture.dao","com.house.furniture.bean"})
public class UserServiceImpl implements UserService {
	
	@Resource()
	private UserMapper userMapper;
	

	@Override
	public User login(String username, String password) {
		UserExample userExample = new UserExample();
		userExample.createCriteria().andNameEqualTo(username.trim()).andPasswordEqualTo(password.trim());
		List<User> user =  userMapper.selectByExample(userExample);
		return user.size() == 0 ? null : user.get(0);
	}
	

	@Override
	public Integer reg(String username, String password, String email) {
		User user = new User();
		user.setName(username);
		user.setPassword(password);
		user.setEmail(email);
		Integer inner =  userMapper.insert(user);
		return inner;
	}
	
	



	@Override
	public User selectByUsername(String username) {
		UserExample userExample = new UserExample();
		userExample.createCriteria().andNameEqualTo(username.trim());
		List<User> user =  userMapper.selectByExample(userExample);
		return user.size() == 0 ? null : user.get(0);
	}



	@Override
	public User selectByEmail(String email) {
		UserExample userExample = new UserExample();
		userExample.createCriteria().andEmailEqualTo(email.trim());
		List<User> user =  userMapper.selectByExample(userExample);
		return user.size() == 0 ? null : user.get(0);
	}


	@Override
	public User selectByUsernameAndEmail(String username, String email) {
		UserExample userExample = new UserExample();
		userExample.createCriteria().andNameEqualTo(username.trim()).andEmailEqualTo(email.trim());
		List<User> user =  userMapper.selectByExample(userExample);
		return user.size() == 0 ? null : user.get(0);
	}


	@Override
	public Integer resertPassword(User user) {
		Integer result = userMapper.updateByPrimaryKey(user);
		return result;
	}
	
	
	


	
}
