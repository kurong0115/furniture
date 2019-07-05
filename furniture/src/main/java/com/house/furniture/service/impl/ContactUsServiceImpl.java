package com.house.furniture.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.house.furniture.bean.Message;
import com.house.furniture.bean.MessageExample;
import com.house.furniture.bean.MessageExample.Criteria;
import com.house.furniture.bean.User;
import com.house.furniture.bean.UserExample;
import com.house.furniture.dao.MessageMapper;
import com.house.furniture.dao.UserMapper;
import com.house.furniture.service.ContactUsService;
import com.house.furniture.vo.Result;

@Service
public class ContactUsServiceImpl implements ContactUsService {
	
	@Resource
	UserMapper userMapper;
	
	@Resource
	MessageMapper messageMapper;

	@Override
	public int isExist(String name, String password) {
		UserExample ue = new UserExample();
		ue.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
		List<User> list = userMapper.selectByExample(ue);
		if(list.size() > 0) {
			return list.get(0).getId();
		}else {
			return -1;
		}
	}

	@Override
	public Result sendInfo(Message message) {
		message.setCreatetime(new Timestamp(System.currentTimeMillis()));
		int num = messageMapper.insertSelective(message);
		if(num > 0) {
			return new Result(Result.EXECUTION_SUCCESS, "消息发送成功，我们将尽快为您回复！");
		}
		return new Result(Result.EXECUTION_FAILED, "系统繁忙，请稍后再试！");
	}

	@Override
	public Page<Message> noReplyMessages(Message message, int page, int size) {
		MessageExample me = new MessageExample();
		Criteria c = me.createCriteria();
		c.andReplyIsNull();
		
		if(message.getName() != null && !message.getName().isEmpty()) {
			c.andNameLike("%" + message.getName() + "%");
		}
		if(message.getTitle() != null && !message.getTitle().isEmpty()) {
			c.andTitleLike("%" + message.getTitle() + "%");
		}
		
		Page<Message> p = PageHelper.startPage(page, size);
		messageMapper.selectByExample(me);
		return p;
	}

	@Override
	public void replyMessage(Message message) {
		message.setReplytime(new Timestamp(System.currentTimeMillis()));
		messageMapper.updateByPrimaryKeySelective(message);
	}
}
