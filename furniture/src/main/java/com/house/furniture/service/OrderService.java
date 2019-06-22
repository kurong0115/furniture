package com.house.furniture.service;

import com.house.furniture.bean.Order;

public interface OrderService {
	//根据用户id查询订单
	Order selectByUid( Integer uid );
}
