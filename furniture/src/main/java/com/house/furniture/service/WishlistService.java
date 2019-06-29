package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Wishlist;

public interface WishlistService {
	
	/**
	 * 列举用户下的所有愿望清单
	 * @param uid
	 * @return
	 */
	List<Wishlist> listWishlistByUser(int uid);
	
	/**
	 * 根据用户获取愿望清单下的一个产品
	 * @param uid
	 * @param pid
	 * @return
	 */
	Wishlist getWishlistByUserAndProduct(int uid, int pid);
	
	/**
	 * 保存愿望清单
	 * @param wishlist
	 * @return
	 * @throws ServiceException 
	 */
	int saveWishlist(Wishlist wishlist) throws ServiceException;
	
	/**
	 * 移除愿望清单
	 * @param wishlist
	 * @return
	 */
	int removeWishlist(int wid);
}
