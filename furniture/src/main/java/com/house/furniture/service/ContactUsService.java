package com.house.furniture.service;

import com.github.pagehelper.Page;
import com.house.furniture.bean.Message;
import com.house.furniture.vo.Result;

public interface ContactUsService {
	
	/**
	 * 判断该用户是否存在，存在：返回该用户id，不存在：返回-1
	 * @param name
	 * @param password
	 * @return
	 */
	public int isExist(String name, String password);
	
	/**
	 * 保存提交的信息
	 * @param message 信息对象
	 * @return
	 */
	public Result sendInfo(Message message);
	
	/**
	 * 根据flag值分别查已回复和未回复的信息
	 * @return
	 */
	public Page<Message> getMessages(Message message, int page, int size, int flag);
	
	/**
	 * 回复用户的消息
	 * @param message
	 */
	public void replyMessage(Message message);
}
