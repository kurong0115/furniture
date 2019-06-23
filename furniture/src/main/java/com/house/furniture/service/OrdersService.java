package com.house.furniture.service;

import com.house.furniture.bean.Order;

public interface OrdersService {
	//根据用户id查询订单
	Order selectByUid( Integer uid );
}
