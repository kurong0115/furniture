package com.house.furniture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.house.furniture.bean.User;
import com.house.furniture.bean.Wishlist;
import com.house.furniture.service.ServiceException;
import com.house.furniture.service.WishlistService;
import com.house.furniture.vo.Result;

@Controller
public class WishlistAction {
	
	@Autowired
	WishlistService wishlistService;
	
	@RequestMapping("wishlist")
	public String wishlist(@SessionAttribute("user") User user, Model model) {
		List<Wishlist> wishlist = wishlistService.listWishlistByUser(user.getId());
		model.addAttribute("wishlist", wishlist);
		return "wishlist";
	}
	
	@GetMapping("addWishlist")
	@ResponseBody
	public Result addWishlist(@SessionAttribute("user") User user, Wishlist wishlist) {
		wishlist.setUid(user.getId());
		try {
			wishlistService.saveWishlist(wishlist);
			return new Result(Result.EXECUTION_SUCCESS, "添加成功");
		} catch (ServiceException e) {
			e.printStackTrace();
			return new Result(Result.EXECUTION_FAILED, e.getMessage());
		}		
	}
	
	@GetMapping("removeWishlist")
	@ResponseBody
	public Result removeWishlist(int wid) {
		int code = wishlistService.removeWishlist(wid);
		if (code == 1) {
			return new Result(Result.EXECUTION_SUCCESS, "移除成功");
		}
		return new Result(Result.EXECUTION_FAILED, "移除失败");
	}
}
