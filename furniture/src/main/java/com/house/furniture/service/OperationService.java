package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Operation;



import com.house.furniture.bean.User;


public interface OperationService {
	
	/**
	 * 查找卖得最多的产品
	 * @param num 选择几件产品展示
	 * @return
	 */
	List<Operation> selectHotProducts(int num);
	
	/**
	 * 7天内上架，卖的最多的产品
	 * @param num 选择几件产品展示
	 * @return
	 */
	List<Operation> newAndHotProducts(int num);
	
	/**
	 * 生成订单后加入到流水表
	 * @param operation
	 */
	void produceOperation(Operation operation);

	/**
	 * 根据订单号查询订单明细
	 * @param orderid
	 * @return
	 */
	List<Operation> selectByOrderid(Integer orderid);
	
	/**
	 * 根据用户id跟商品id查询订单明细
	 * @param user
	 * @param pid
	 * @return
	 */
	List<Operation> listOperationByUidAndPid(User user, int pid);


}
