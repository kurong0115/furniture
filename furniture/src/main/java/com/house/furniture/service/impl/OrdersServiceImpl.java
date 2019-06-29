package com.house.furniture.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.house.furniture.bean.Address;
import com.house.furniture.bean.Orders;
import com.house.furniture.bean.OrdersExample;
import com.house.furniture.dao.AddressMapper;
import com.house.furniture.dao.OrdersMapper;
import com.house.furniture.service.OrdersService;
@Service
@ComponentScan(basePackages = {"com.house.furniture.dao","com.house.furniture.bean"})
public class OrdersServiceImpl implements OrdersService {
	@Resource
	private OrdersMapper orderMapper;
	
	@Resource
	private AddressMapper addressMapper;
	
	
	
	@Override
	public List<Orders> selectByUid(Integer uid) {
		OrdersExample orderExample = new OrdersExample();
		orderExample.createCriteria().andUidEqualTo(uid);
		List<Orders> order = orderMapper.selectByExample(orderExample);
		return order.size() == 0 ? null : order;
	}


	@Override
	public void produceOrder(Orders orders) {
		orderMapper.insertSelective(orders);		
	}
	
	@Override
	public List<Address> selectAddress(int uid) {
		List<Address> address = addressMapper.selectByUid(uid);
		return address;
	}

}
