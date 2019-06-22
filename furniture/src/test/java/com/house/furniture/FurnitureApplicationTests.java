package com.house.furniture;

import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	@Test
	public void regTest() {
		String username = "测试";
		String password = "123";
		String email = "869872053@qq.com";
		User user = new User();
		user.setName(username);
		user.setPassword(password);
		user.setEmail(email);
		int num = userMapper.insert(user);
		System.out.println(num);
	}
	
	@Test
	public void updateTest() {
		String username = "测试";
		String password = "654";
		String email = "869872053@qq.com";
		User user = new User();
		
		user.setId(10);
		
		user.setPassword(password);
		Integer result =  userMapper.updateByPrimaryKeySelective(user);
		System.out.println(result);
	}
	
	@Test
	public void test() {
		String str="^([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$";
	    Pattern p = Pattern.compile(str); 
	    String email = "869872053@163.com";
	    Matcher m = p.matcher(email);     
	   System.out.println(m.matches());
	}
	
	@Test
	public void test2() {
		String str="0123456789";
		StringBuilder sb=new StringBuilder(4);
		for(int i=0;i<4;i++)
		{
		char ch=str.charAt(new Random().nextInt(str.length()));
		sb.append(ch);
		}
		System.out.println(sb.toString());
	
	}

}
