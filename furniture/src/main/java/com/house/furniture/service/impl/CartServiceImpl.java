package com.house.furniture.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.house.furniture.bean.Cart;
import com.house.furniture.bean.CartExample;
import com.house.furniture.bean.User;
import com.house.furniture.dao.CartMapper;
import com.house.furniture.service.CartService;

public class CartServiceImpl implements CartService {

	@Resource
	CartMapper cartmapper;
	
	@Override
	public List<Cart> listCartProductByUser(User user) {
		CartExample example = new CartExample();
		
		example.createCriteria().andUidEqualTo(user.getId());
		List<Cart> list = cartmapper.selectByExample(example);
		
		return list;
		
	}

}
