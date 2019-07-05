package com.house.furniture.web;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.house.furniture.bean.Message;
import com.house.furniture.service.ContactUsService;
import com.house.furniture.vo.EasyUIPage;
import com.house.furniture.vo.Result;

@Controller
public class ContactUs {
	
	@Resource
	ContactUsService contactUsService;

	@RequestMapping("contact-us.do")
	public String contactUs() {
		return "contact-us";
	}
	
	// 用户发送消息
	@PostMapping("sendInfo.do")
	@ResponseBody
	public Result sendInfo(Model model, String name, String password, Message message) {
		//判断是否有未填信息
		if(name == null || name.isEmpty() || password == null || password.isEmpty() || 
			message.getTitle() == null || message.getTitle().isEmpty() || 
			message.getContent() == null || message.getContent().isEmpty()) {
			return new Result(Result.EXECUTION_FAILED, "请将信息填写完整");
		}
		//判断该用户是否存在
		int uid = contactUsService.isExist(name, password);
		if(uid == -1) {
			return new Result(Result.EXECUTION_FAILED, "用户名或密码错误");
		}
		message.setUid(uid);
		//保存该消息
		Result result = contactUsService.sendInfo(message);
		return result;
		
		
	}
	
	// 查找还未回复的用户留言
	@RequestMapping("noReplyMessages.do")
	@ResponseBody
	public EasyUIPage noReplyMessages(Message message, int page, int rows) {
		Page<Message> p = contactUsService.noReplyMessages(message, page, rows);
		return new EasyUIPage(p.getTotal(), p.getResult());
	}
	
	@RequestMapping("replyMessage.do")
	@ResponseBody
	public Result replyMessage(@Valid Message message, Errors errors) {
		if(errors.hasErrors()) {
			return new Result(Result.EXECUTION_FAILED, "发送失败", errors.getAllErrors());
		}else {
			try {
				contactUsService.replyMessage(message);
				return new Result(Result.EXECUTION_SUCCESS, "发送成功");
			} catch (Exception e) {
				e.printStackTrace();
				return new Result(Result.EXECUTION_CANCEL, "系统繁忙，请稍后再试");
			}
		}
	}
}
