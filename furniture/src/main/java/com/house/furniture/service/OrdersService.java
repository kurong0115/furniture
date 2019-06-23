package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Orders;

public interface OrdersService {
	//根据用户id查询订单
	List<Orders> selectByUid( Integer uid );
}
