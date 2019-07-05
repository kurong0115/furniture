package com.house.furniture.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.Wishlist;
import com.house.furniture.bean.WishlistExample;
import com.house.furniture.dao.WishlistMapper;
import com.house.furniture.service.ServiceException;
import com.house.furniture.service.WishlistService;

@Service
public class WishlistServiceImpl implements WishlistService {
	
	@Autowired
	WishlistMapper wishlistMapper;
	
	@Override
	public List<Wishlist> listWishlistByUser(int uid) {
		WishlistExample example = new WishlistExample();
		example.createCriteria().andUidEqualTo(uid);
		List<Wishlist> list = wishlistMapper.selectByExample(example);
		return list.isEmpty()? null: list;
	}

	@Override
	public Wishlist getWishlistByUserAndProduct(int uid, int pid) {
		WishlistExample example = new WishlistExample();
		example.createCriteria().andPidEqualTo(pid).andUidEqualTo(uid);
		List<Wishlist> list = wishlistMapper.selectByExample(example);
		return list.isEmpty()? null: list.get(0);
	}

	@Override
	public int saveWishlist(Wishlist wishlist) throws ServiceException {
		Wishlist wishlist1 = getWishlistByUserAndProduct(wishlist.getUid(), wishlist.getPid());
		if (wishlist1 != null) {
			throw new ServiceException("该商品已存在");
		}
		int result = wishlistMapper.insert(wishlist);
		return result;
	}

	@Override
	public int removeWishlist(int wid) {
		int result = wishlistMapper.deleteByPrimaryKey(wid);
		return result;
	}

}
