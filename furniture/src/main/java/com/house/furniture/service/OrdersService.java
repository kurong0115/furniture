package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Orders;

public interface OrdersService {

	//生成订单
	void produceOrder(Orders orders);

	List<Orders> selectByUid( Integer uid );

	

}
