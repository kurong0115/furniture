package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Orders;

public interface OrdersService {

	//生成订单
	void produceOrder(Orders orders);

	List<Orders> selectByUid( Integer uid );

	//根据订单编号查找订单
	Orders findOrderByOrderNo(String out_trade_no);

	//更新订单
	void updateOrders(Orders order);

	

}
