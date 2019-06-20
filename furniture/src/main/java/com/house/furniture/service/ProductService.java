package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Product;

public interface ProductService {
	
	/**
	  * 根据分类列出当前分类下的所有的商品
	 * @param cid
	 * @return
	 */
	List<Product> listProductsByType(int cid);
}
