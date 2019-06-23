package com.house.furniture.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.house.furniture.bean.Cart;
import com.house.furniture.bean.CartExample;
import com.house.furniture.bean.User;
import com.house.furniture.dao.CartMapper;
import com.house.furniture.service.CartService;
import com.house.furniture.service.ServiceException;

@Service
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

	@Override
	public void delCartById(Integer id) throws ServiceException {
		if(id<0) {
			throw new ServiceException("请选择正确的商品");
		}
		cartmapper.deleteByPrimaryKey(id);

	}

	@Override
	public void clearCart(Integer id) {
		CartExample example = new CartExample();
		
		example.createCriteria().andUidEqualTo(id);
		cartmapper.deleteByExample(example);
		
	}

	@Override
	public void updataCartCountById(Cart cart) {
		cartmapper.updateByPrimaryKeySelective(cart);	
	}

}
