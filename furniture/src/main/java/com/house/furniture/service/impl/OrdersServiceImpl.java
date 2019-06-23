package com.house.furniture.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.Order;
import com.house.furniture.bean.OrderExample;
import com.house.furniture.dao.OrderMapper;
import com.house.furniture.service.OrdersService;
@Service
@ComponentScan(basePackages = {"com.house.furniture.dao","com.house.furniture.bean"})
public class OrdersServiceImpl implements OrdersService {
	@Resource
	private OrderMapper orderMapper;
	
	
	@Override
	public Order selectByUid(Integer uid) {
		OrderExample orderExample = new OrderExample();
		orderExample.createCriteria().andUidEqualTo(uid);
		List<Order> order = orderMapper.selectByExample(orderExample);
		return order.size() == 0 ? null : order.get(0);
	}

}
