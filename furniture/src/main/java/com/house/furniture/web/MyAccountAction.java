package com.house.furniture.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.furniture.bean.Operation;
import com.house.furniture.bean.Orders;
import com.house.furniture.bean.User;
import com.house.furniture.service.OperationService;
import com.house.furniture.service.OrdersService;
import com.house.furniture.vo.Result;

@Controller
public class MyAccountAction {
	@Resource
	OrdersService orderService;
	
	@Resource
	OperationService operationService;
	
	@RequestMapping("my-account")
	public String MyAccount(HttpSession session,Model model) {
		//打开账户信息之前先加载各种信息
		//查询该用户的所有订单
		User user = (User)session.getAttribute("user");
		
		List<Orders> orders = orderService.selectByUid(user.getId());
		//将用户的所有订单添加到会话中
		model.addAttribute("myOrder", orders);
		return "my-account";
	}
	
	@GetMapping("orderDetails")
	@ResponseBody
	public Result orderDetails(String orderid) {
		System.out.println(orderid);
		List<Operation> operation = operationService.selectByOrderid(Integer.parseInt(orderid));
		System.out.println(operation);
		return new Result(Result.EXECUTION_SUCCESS, "1", operation);
	}
	
}
