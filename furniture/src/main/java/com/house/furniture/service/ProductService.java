package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Product;

public interface ProductService {
	
	/**
	 * 根据分类列出当前分类下的所有的商品
	 * @param cid
	 * @return
	 */
	List<Product> listProductsByType(int cid, int page, int size);
	
	
	/**
	  * 根据商品名查询对应的产品
	 * @param condition
	 * @return
	 */
	List<Product> listProductByCondition(String condition);

	/**
	 * 根据条件查询对应的商品信息
	 * @param onSale
	 * @param newProduct
	 * @param min
	 * @param max
	 * @param cid
	 * @return
	 */
	List<Product> listProductByItem(String onSale, String newProduct, double min, double max, int cid);
	
	/**
	 * 根据产品id查询相应的产品信息
	 * @param pid
	 * @return
	 */
	Product getProductById(int pid);
	
	/** 列出跟当前商品相关的商品
	 * @param cid
	 * @return
	 */
	List<Product> listRelatedProduct(int cid);
	
	/**
	 * 根据类名，查出该类下最新的一些产品
	 * @param num 展示num-1个产品
	 * @param name 类名
	 * @return
	 */
	List<Product> listProductByCategoryName(int num, String name);
}
