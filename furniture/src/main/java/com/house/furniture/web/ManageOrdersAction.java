package com.house.furniture.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.house.furniture.bean.Operation;
import com.house.furniture.bean.Orders;
import com.house.furniture.bean.User;
import com.house.furniture.service.OperationService;
import com.house.furniture.service.OrdersService;
import com.house.furniture.service.UserService;
import com.house.furniture.vo.EasyUIPage;
import com.house.furniture.vo.Result;

@Controller
public class ManageOrdersAction {

	@Resource
	private OrdersService ordersservice;
	
	@Resource
	private UserService userservice;
	
	@Resource
	private OperationService operationservice;
	
	@RequestMapping("manage/manageOrdersAll")
	@ResponseBody
	public EasyUIPage manageOrdersAll(Integer page,Integer rows,Orders order,@RequestParam(required=false)String uname,
			@RequestParam(required=false)String createtime1,@RequestParam(required=false)String createtime2) {
		List<Integer> uid=new ArrayList<>();
		if(uname!=null && !"".equals(uname)) {
			List<User> users=userservice.findUserLikeName(uname);
			if(users.size()>0) {
				for (User user : users) {
					uid.add(user.getId());
				}
			}
		}
		Page<Orders> p = ordersservice.findOrdersByPage(page,rows,order,uid,createtime1,createtime2);
		return new EasyUIPage(p.getTotal(), p.getResult());
	}
	
	@PostMapping("manage/showOrderByOrderId")
	@ResponseBody
	public Result showOrderDetailByOrderId(Integer orderid) {
		List<Operation> list = operationservice.selectByOrderid(orderid);
		return new Result(Result.EXECUTION_SUCCESS,"1",list);
	}
	
	@PostMapping("manage/dealOrder")
	@ResponseBody
	public Result dealOrder(Integer orderid) {
		Orders order=new Orders();
		order.setId(orderid);
		order.setIsdeal(1);
		ordersservice.updateOrders(order);		
		return new Result(Result.EXECUTION_SUCCESS,"处理成功");
	}
	@PostMapping("manage/getNewOrder")
	@ResponseBody
	public Result getNewOrder() {
		int size= ordersservice.findOrderByisdeal();
		if(size>0) {
			return new Result(Result.EXECUTION_SUCCESS,"您有"+size+"个未处理的订单，请及时处理");
		}
		return new Result();
	}
}
