package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Cart;
import com.house.furniture.bean.User;

public interface CartService {

	//根据用户查询购物车
	List<Cart> listCartProductByUser(User user);

	//删除购物车的产品
	void delCartById(Integer id) throws ServiceException;

	//清空购物车
	void clearCart(Integer uid);

	//修改购物车数量
	void updataCartCountById(Cart cart);

	//加入购物车
	Cart addCart(Cart cart);

}
