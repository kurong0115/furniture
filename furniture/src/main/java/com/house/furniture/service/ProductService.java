package com.house.furniture.service;

import java.util.List;

import com.github.pagehelper.Page;
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
	 * @param num 展示num个产品
	 * @param name 类名
	 * @return
	 */
	List<Product> listProductByCategoryName(int num, String name);
	
	/**
	 * 获取当前类别下的所有的产品数量
	 * @param cid
	 * @return
	 */
	Long getProductSize(int cid);
	
	/**
	 * 获取当前条件下的所有记录数
	 * @param onSale
	 * @param newProduct
	 * @param min
	 * @param max
	 * @param cid
	 * @return
	 */
	Long getItemSize(String onSale, String newProduct, double min, double max, int cid);
	
	/**
	  * 获取符合条件产品数量
	 * @param condition
	 * @return
	 */
	Long getConditionSize(String condition);
	
	/**
	  * 保存产品信息及图片信息
	 * @param product
	 * @param image
	 * @return
	 */
	int saveProduct(Product product, String[] image);
	
	/**
	  * 管理界面查询所有产品信息
	 * @param page
	 * @param rows
	 * @return
	 */
	Page<Product> listAllProductByPage(int page, int rows);

	/**
	 * 修改产品信息
	 * @param product
	 * @return
	 */
	int updateProduct(Product product, String[] images);

	
	/**
	  * 下架产品
	 * @param pid
	 * @return
	 */
	int removeProduct(int pid);
}
