package com.house.furniture.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.furniture.bean.Message;
import com.house.furniture.bean.User;
import com.house.furniture.service.ContactUsService;
import com.house.furniture.service.UserService;
import com.house.furniture.vo.Result;

@Controller
public class CommunicationAction {
	
	@Resource
	private ContactUsService contactUsService;
	
	@Resource
	private UserService userService;
	
	@RequestMapping("communication.do")
	public String communication(int id, Model model) {
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "communication";
	}

	@RequestMapping("prompt.do")
	@ResponseBody
	public Result getPrompt(int uid) {
		// 系统回复
		int replyNum = contactUsService.getSystemReply(uid);
		if(replyNum > 0) {
			return new Result(replyNum, "type1");
		}
		return new Result(null, null);
	}
	
	@PostMapping("getSendAndReply.do")
	@ResponseBody
	public Result getSendAndReply(Integer uid) {
		List<Message> messages = contactUsService.getSendAndReply(uid);
		if(messages.size() > 0) {
			return new Result(messages.size(), "有回复", messages);
		}
		return new Result(0, "无回复");
	}
	
	@RequestMapping("updateStatus.do")
	@ResponseBody
	public String updateStatus(int uid) {
		int num = contactUsService.updateStatus(uid);
		if(num > 0) {
			return "success";
		}
		return "failure";
	}
}
