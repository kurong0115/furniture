package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Cart;
import com.house.furniture.bean.User;

public interface CartService {

	//根据用户查询购物车
	List<Cart> listCartProductByUser(User user);

}
