package com.house.furniture.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.house.furniture.bean.Address;
import com.house.furniture.bean.Operation;
import com.house.furniture.bean.Orders;
import com.house.furniture.bean.User;
import com.house.furniture.service.AddressService;
import com.house.furniture.service.OperationService;
import com.house.furniture.service.OrdersService;
import com.house.furniture.vo.Result;

@Controller
public class MyAccountAction {
	@Resource
	OrdersService orderService;
	
	@Resource
	OperationService operationService;
	
	@Resource
	AddressService addressService;
	
	@RequestMapping("my-account")
	public String MyAccount(@SessionAttribute("user")User user ,Model model) {
		List<Orders> orders = orderService.selectByUid(user.getId());
		//将用户的所有订单添加到会话中
		model.addAttribute("myOrder", orders);
		long count = orderService.getOrdersCount(user.getId());
		model.addAttribute("count", count);
		
		List<Address> address = addressService.getAddrByUser(user);
		model.addAttribute("addressList", address);
		return "my-account";
	}
	
	@GetMapping("orderDetails")
	@ResponseBody
	public Result orderDetails(String orderid) {
		Orders order = orderService.selectById(Integer.parseInt(orderid));
		List<Operation> operation = operationService.selectByOrderid(Integer.parseInt(orderid));
		List<Object> orderState = new ArrayList<Object>();
		orderState.add(order);
		orderState.add(operation);
		return new Result(Result.EXECUTION_SUCCESS, "1", orderState);
	}

	@PostMapping("seeOrderMore")
	@ResponseBody
	public Result seeOrderMore(@SessionAttribute("user")User user) {
		long count = orderService.getOrdersCount(user.getId());
		List<Orders> list = orderService.seeOrderMore(user.getId(),count);
		return new Result(Result.EXECUTION_SUCCESS,"1",list);
	}
}
