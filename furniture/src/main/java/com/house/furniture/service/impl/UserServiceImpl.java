package com.house.furniture.service.impl;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.house.furniture.bean.AddressExample;
import com.house.furniture.bean.User;
import com.house.furniture.bean.UserExample;
import com.house.furniture.bean.UserExample.Criteria;
import com.house.furniture.dao.AddressMapper;
import java.util.List;
import com.house.furniture.dao.UserMapper;
import com.house.furniture.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	UserMapper userMapper;
	
	@Resource
	AddressMapper address;

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
	
	
	@Override
	public int isExist(String type, String str) {
		if("".equals(str)) {
			return 1;
		}
		UserExample ue = new UserExample();
		if("name".equals(type)) {
			ue.createCriteria().andNameEqualTo(str);
		}else if("email".equals(type)) {
			ue.createCriteria().andEmailEqualTo(str);
		}
		List<User> list = userMapper.selectByExample(ue);
		if(list.size() > 0) {
			//被占用
			return 0;
		}else {
			return 1;
		}
	}
	@Override
	public void save(User user) {
		userMapper.insertSelective(user);
	}

	@Override
	public Page<User> queryAddress(int uid, int page, int rows) {
		AddressExample example = new AddressExample();
		example.createCriteria().andUidEqualTo(uid).andStatusEqualTo(1);
		Page<User> p = PageHelper.startPage(page, rows);
		address.selectByExample(example);
		return p;
	}

	@Override
	public User getUserById(int id) {
		return userMapper.selectByPrimaryKey(id);
	}
	
	public List<User> findUserLikeName(String uname) {
		UserExample example = new UserExample();
		example.createCriteria().andNameLike("%"+uname+"%");
		List<User> list = userMapper.selectByExample(example);
		return list;
	}
	
	public User selectByOpenID(String openId) {
		UserExample userExample = new UserExample();
		userExample.createCriteria().andOpenidEqualTo(openId);
		List<User> user = userMapper.selectByExample(userExample);
		return user.size() == 0 ? null : user.get(0);
	}

	@Override
	public Integer regByUser(User user) {
		Integer result = userMapper.insert(user);
		return result;
	}


	@Override
	public Integer updateHead(@Valid User user) {
		Integer updateResult = userMapper.updateByPrimaryKeySelective(user);
		return updateResult;
	}

	
	
	

}
