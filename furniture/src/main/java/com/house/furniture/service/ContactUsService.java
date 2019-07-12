package com.house.furniture.service;

import java.util.List;

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
	 * 判断是否还有未曾回复的信息
	 * @param uid
	 * @return
	 */
	public String whetherReply(int uid);
	
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
	
	/**
	 * 得到系统回复的消息数量
	 * @param uid
	 * @return
	 */
	public int getSystemReply(int uid);
	
	/**
	 * 根据id获取该用户的留言和回复信息
	 * @param uid
	 * @return
	 */
	List<Message> getSendAndReply(int uid);
	
	/**
	 * 根据用户id修改消息状态
	 * @param uid
	 * @return
	 */
	int updateStatus(int uid);
}
