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
import com.house.furniture.service.UserService;
import com.house.furniture.util.MyUtils;
import com.house.furniture.vo.Result;

@Controller
public class MyAccountAction {
	@Resource
	OrdersService orderService;
	
	@Resource
	OperationService operationService;
	
	@Resource
	AddressService addressService;
	
	@Resource
	UserService userService;
	
	@RequestMapping("my-account")
	public String MyAccount(@SessionAttribute("user")User user ,Model model) {
		List<Orders> orders = orderService.selectByUid(user.getId());
		//将用户的所有订单添加到会话中
		model.addAttribute("myOrder", orders);
		
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
	
	@PostMapping("addAddress")
	@ResponseBody
	public Result addAddress(Address address,@SessionAttribute("user")User user ) {
		if( address.getName().isEmpty() ) {
			return new Result(Result.EXECUTION_FAILED,"请输入姓名！");
		}
		if( address.getAddress().isEmpty() ) {
			return new Result(Result.EXECUTION_FAILED,"请输入您的详细地址！");
		}
		if( address.getPhone().isEmpty() ) {
			return new Result(Result.EXECUTION_FAILED,"请输入您的电话号码！");
		}
		address.setUid(user.getId());
		//编译正则表达式
		String reg ="^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$" ;
		if(address.getPhone().matches(reg) == false) {
			return new Result(Result.EXECUTION_FAILED,"请输入合法的电话号码！");
		}
		//写入数据库
		Integer addressResult = addressService.addAddress(address);
		
		if( addressResult > 0 ) {
			return new Result(Result.EXECUTION_SUCCESS,"添加成功！");
		}else {
			return new Result(Result.EXECUTION_FAILED,"添加失败！刷新试试！");
		}
	}

	@PostMapping("queryAddress")
	@ResponseBody
	public Result queryAddress(String id) {
		Address address = addressService.queryAddressByID(Integer.parseInt(id));
		System.out.println(address);
		if( address != null ) {
			return new Result(Result.EXECUTION_SUCCESS,"1",address);
		}
		return new Result(Result.EXECUTION_FAILED,"出现异常了，刷新试试！");
		
	}
	
	
	@PostMapping("modefyAddress")
	@ResponseBody
	public Result modefyAddress(Address address,@SessionAttribute("user")User user ) {
		if( address.getName().isEmpty() ) {
			return new Result(Result.EXECUTION_FAILED,"请输入姓名！");
		}
		if( address.getAddress().isEmpty() ) {
			return new Result(Result.EXECUTION_FAILED,"请输入您的详细地址！");
		}
		if( address.getPhone().isEmpty() ) {
			return new Result(Result.EXECUTION_FAILED,"请输入您的电话号码！");
		}
		address.setUid(user.getId());
		//编译正则表达式
		String reg ="^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$" ;
		if(address.getPhone().matches(reg) == false) {
			return new Result(Result.EXECUTION_FAILED,"请输入合法的电话号码！");
		}
		//数据库更新
		Integer  updateResult = addressService.updateAddress(address);

		if( updateResult > 0 ) {
			return new Result(Result.EXECUTION_SUCCESS,"修改成功！");
		}else {
			return new Result(Result.EXECUTION_FAILED,"修改失败！刷新试试！");
		}
	}
	@PostMapping("deleteAddress")
	@ResponseBody
	public  Result deleteAddress(String id){
		Integer deleteResult = addressService.deleteAddressById(Integer.parseInt(id));
		if( deleteResult > 0 ) {
			return new Result(Result.EXECUTION_SUCCESS,"");
		}else {
			return new Result(Result.EXECUTION_FAILED,"删除失败！刷新试试！");
		} 
		
	}
	
	@PostMapping("modefyPassword")
	@ResponseBody
	public Result modefyPassword(@SessionAttribute("user")User user,String oldPassword,String newPassword1,String newPassword2) {
		if( oldPassword.isEmpty() ) {
			return new Result(Result.EXECUTION_FAILED,"请输入当前密码！");
		}
		if( newPassword1.isEmpty() ) {
			return new Result(Result.EXECUTION_FAILED,"请输入新密码！");
		}
		if( newPassword2.isEmpty() ) {
			return new Result(Result.EXECUTION_FAILED,"请重复输入新密码！");
		}
		if( !newPassword1.equals(newPassword2) ) {
			return new Result(Result.EXECUTION_FAILED,"两次密码输入不一致！");
		}
		User selectResult = userService.login(user.getName(), MyUtils.getMD5String(oldPassword));
		if( selectResult == null ) {
			return new Result(Result.EXECUTION_FAILED,"当前密码输入错误，请重新输入！");
		}else {
			user.setPassword(MyUtils.getMD5String(newPassword1));
			Integer resetResult = userService.resertPassword(user);
			if( resetResult>0 ) {
				return new Result(Result.EXECUTION_SUCCESS,"更改成功！请重新登录！");
			}else {
				return new Result(Result.EXECUTION_FAILED,"修改失败，刷新试试！");
			}
		}
	}
}
