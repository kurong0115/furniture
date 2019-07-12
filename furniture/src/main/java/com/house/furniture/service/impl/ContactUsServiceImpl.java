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
import com.house.furniture.util.MyUtils;
import com.house.furniture.vo.Result;

@Service
public class ContactUsServiceImpl implements ContactUsService {
	
	@Resource
	UserMapper userMapper;
	
	@Resource
	MessageMapper messageMapper;

	@Override
	public int isExist(String name, String password) {
		// 加密
		password = MyUtils.getMD5String(password);
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
	public String whetherReply(int uid) {
		MessageExample me = new MessageExample();
		me.createCriteria().andUidEqualTo(uid).andReplyIsNull();
		List<Message> list = messageMapper.selectByExample(me);
		if(list.size() > 0) {	// 还有未曾回复的信息
			return "no";
		}
		return "yes";
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
	public Page<Message> getMessages(Message message, int page, int size, int flag) {
		MessageExample me = new MessageExample();
		Criteria c = me.createCriteria();
		if(flag == 0) {	//查找未回复信息
			c.andReplyIsNull();
		}else {	//已回复信息
			c.andReplyIsNotNull();
		}
		
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

	@Override
	public int getSystemReply(int uid) {
		MessageExample message = new MessageExample();
		message.createCriteria().andUidEqualTo(uid).andStatueEqualTo(0).andReplyIsNotNull();
		
		List<Message> list = messageMapper.selectByExample(message);
		if(list.size() > 0) {
			return list.size();
		} else {
			return 0;
		}
	}

	@Override
	public List<Message> getSendAndReply(int uid) {
		List<Message> messages = messageMapper.getSendAndReply(uid);
		return messages;
	}

	@Override
	public int updateStatus(int uid) {
		MessageExample me = new MessageExample();
		me.createCriteria().andUidEqualTo(uid).andReplyIsNotNull();
		
		Message message = new Message();
		message.setStatue(1);
		return messageMapper.updateByExampleSelective(message, me);
	}
}
