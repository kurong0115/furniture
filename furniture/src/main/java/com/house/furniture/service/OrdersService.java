package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Address;
import com.house.furniture.bean.Orders;

public interface OrdersService {

	//生成订单
	void produceOrder(Orders orders);

	List<Orders> selectByUid( Integer uid );
	
	/**
	 * 查询用户的地址信息
	 * @param uid
	 * @param page
	 * @param rows
	 * @return
	 */
	List<Address> selectAddress(int uid);

	//根据订单编号查找订单
	Orders findOrderByOrderNo(String out_trade_no);

	//更新订单
	void updateOrders(Orders order);
	
	//根据订单id查询订单状态
	Orders selectById(Integer id);

	

}
