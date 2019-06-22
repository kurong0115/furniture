package com.house.furniture.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.house.furniture.bean.Cart;
import com.house.furniture.bean.User;
import com.house.furniture.service.CartService;
import com.house.furniture.service.ServiceException;
import com.house.furniture.vo.Result;

@Controller
@SessionAttributes(names= {"cartProductList","allSum"})
public class CartPageAction {

	@Resource
	CartService cartservice;
	
	//需要修改用户id，根据session
	@RequestMapping("seeCart")
	public String seeCart(User user,Model model) {
		user.setId(1);
		
		List<Cart> cartProductList = cartservice.listCartProductByUser(user);
		model.addAttribute("cartProductList", cartProductList);
		
		long allSum=0;
		for (Cart cart : cartProductList) {
			allSum+=cart.getCount()*cart.getProduct().getPrice();
		}
		model.addAttribute("allSum", allSum);

		return "cart-page";
	}
	
	@PostMapping("cart/delCart")
	@ResponseBody
	public Result delCart(Integer id,User user,Model model) {
		user.setId(1);
		try {
			cartservice.delCartById(id);
			List<Cart> cartProductList = cartservice.listCartProductByUser(user);
			model.addAttribute("cartProductList", cartProductList);
			long allSum=0;
			for (Cart cart : cartProductList) {
				allSum+=cart.getCount()*cart.getProduct().getPrice();
			}
			model.addAttribute("allSum", allSum);
			
			return new Result(Result.EXECUTION_SUCCESS, "删除成功");
		} catch (ServiceException e) {
			e.printStackTrace();
			return new Result(Result.EXECUTION_FAILED, e.getMessage());
		}
	}
	
	//需要修改用户id，根据session
	@PostMapping("cart/clearCart")
	@ResponseBody
	public Result clearCart(User user,Model model) {
		user.setId(1);
		
		cartservice.clearCart(user.getId());
		model.addAttribute("cartProductList", "");
		model.addAttribute("allSum", 0);
		return new Result(Result.EXECUTION_SUCCESS, "清空成功");
	}
}
