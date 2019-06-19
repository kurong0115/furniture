package com.house.furniture;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.house.furniture.bean.User;
import com.house.furniture.bean.UserExample;
import com.house.furniture.dao.UserMapper;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FurnitureApplicationTests {
	
	@Resource
	private UserMapper userMapper;

	@Test
	public void contextLoads() {
		String username = "何浩";
		String password = "123";
		UserExample userExample = new UserExample();
		userExample.createCriteria().andNameEqualTo(username).andPasswordEqualTo(password);
		List<User> user =  userMapper.selectByExample(userExample);
		System.out.println(user.get(0).getName());
	}

}
