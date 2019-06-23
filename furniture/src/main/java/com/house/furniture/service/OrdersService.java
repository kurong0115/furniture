package com.house.furniture.service;

import com.house.furniture.bean.Orders;

public interface OrdersService {
	//根据用户id查询订单
	Orders selectByUid( Integer uid );

	//生成订单
	void produceOrder(Orders orders);
}
