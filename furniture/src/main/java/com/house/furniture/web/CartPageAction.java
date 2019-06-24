package com.house.furniture.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.house.furniture.bean.Address;
import com.house.furniture.bean.Cart;
import com.house.furniture.bean.User;
import com.house.furniture.service.AddressService;
import com.house.furniture.service.CartService;
import com.house.furniture.service.ServiceException;
import com.house.furniture.vo.Result;

@Controller
@SessionAttributes(names= {"cartProductList","allSum"})
public class CartPageAction {

	@Resource
	CartService cartservice;
	
	@Resource
	AddressService addressservice;
	
	/**
	 * 查看购物车
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("seeCart")
	public String seeCart(@SessionAttribute("user")User user,Model model) {
		List<Cart> cartProductList = cartservice.listCartProductByUser(user);
		model.addAttribute("cartProductList", cartProductList);
		long allSum=0;
		for (Cart c : cartProductList) {
			allSum+=c.getCount()*c.getProduct().getPrice();
		}
		model.addAttribute("allSum", allSum);
		return "cart-page";
	}
	
	/**
	 * 删除购物车中的商品
	 * @param id
	 * @param user
	 * @param model
	 * @return
	 */
	@PostMapping("cart/delCart")
	@ResponseBody
	public Result delCart(Integer id,@SessionAttribute("user")User user,Model model) {
		try {
			cartservice.delCartById(id);
			List<Cart> cartProductList = cartservice.listCartProductByUser(user);
			model.addAttribute("cartProductList", cartProductList);
			long allSum=0;
			if(cartProductList.size()>0) {
				for (Cart cart : cartProductList) {
					allSum+=cart.getCount()*cart.getProduct().getPrice();
				}
			}
			model.addAttribute("allSum", allSum);
			
			return new Result(Result.EXECUTION_SUCCESS, "删除成功");
		} catch (ServiceException e) {
			e.printStackTrace();
			return new Result(Result.EXECUTION_FAILED, e.getMessage());
		}
	}
	
	/**
	 * 清空购物车
	 * @param user
	 * @param model
	 * @return
	 */
	@PostMapping("cart/clearCart")
	@ResponseBody
	public Result clearCart(@SessionAttribute("user")User user,Model model) {
		long allSum=0;
		cartservice.clearCart(user.getId());
		model.addAttribute("cartProductList", "");
		model.addAttribute("allSum", allSum);
		return new Result(Result.EXECUTION_SUCCESS, "清空成功");
	}
	
	/**
	 * 跳转到结算页面
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("checkout")
	public String checkout(@SessionAttribute("user")User user,Model model) {
		List<Address> addrList=addressservice.getAddrByUser(user);
		model.addAttribute("addrList", addrList);
		return "checkout";
	}
	
	/**
	 * 修改购物车商品的数量
	 * @param cart
	 * @param user
	 * @param model
	 * @return
	 */
	@PostMapping("cart/updataCartCount")
	@ResponseBody
	public Result updataCartCount(Cart cart,@SessionAttribute("user")User user,Model model) {
		cart.setUid(user.getId());
		cartservice.updataCartCountById(cart);

		List<Cart> cartProductList = cartservice.listCartProductByUser(user);
		model.addAttribute("cartProductList", cartProductList);
		long allSum=0;
		for (Cart c : cartProductList) {
			allSum+=c.getCount()*c.getProduct().getPrice();
		}
		model.addAttribute("allSum", allSum);
		return new Result(Result.EXECUTION_SUCCESS, "修改成功");
	}
	
}
