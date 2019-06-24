package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Operation;

public interface OperationService {
	
	/**
	 * 查找卖得最多的产品
	 * @return
	 */
	public List<Operation> selectHotProducts(int index, int size);
	
	/**
	 * 7天内上架，卖的最多的产品
	 * @param num
	 * @return
	 */
	public List<Operation> newAndHotProducts(int num);
}
