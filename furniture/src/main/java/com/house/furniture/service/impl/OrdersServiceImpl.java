package com.house.furniture.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.house.furniture.bean.Address;
import com.house.furniture.bean.AddressExample;
import com.house.furniture.bean.Orders;
import com.house.furniture.bean.OrdersExample;
import com.house.furniture.bean.OrdersExample.Criteria;
import com.house.furniture.dao.AddressMapper;
import com.house.furniture.dao.OrdersMapper;
import com.house.furniture.service.OrdersService;
@Service
public class OrdersServiceImpl implements OrdersService {
	@Resource
	private OrdersMapper orderMapper;
	
	@Resource
	private AddressMapper addressMapper;
	
	
	
	@Override
	public List<Orders> selectByUid(Integer uid,Integer page, Integer size ) {
		OrdersExample orderExample = new OrdersExample();
		orderExample.createCriteria().andUidEqualTo(uid);
		PageHelper.startPage(0, 10);
		orderExample.setOrderByClause("createTime desc");
		List<Orders> order = orderMapper.selectByExample(orderExample);
		return order.size() == 0 ? null : order;
	}


	@Override
	public void produceOrder(Orders orders) {
		orderMapper.insertSelective(orders);		
	}
	
	@Override
	public List<Address> selectAddress(int uid) {
		AddressExample ae = new AddressExample();
		ae.createCriteria().andUidEqualTo(uid).andStatusEqualTo(1);
		List<Address> address = addressMapper.selectByExample(ae);
		return address;
	}


	@Override
	public Orders findOrderByOrderNo(String out_trade_no) {
		OrdersExample orderExample = new OrdersExample();
		orderExample.createCriteria().andOrdernoEqualTo(out_trade_no);
		List<Orders> list = orderMapper.selectByExample(orderExample);
		return list.size()==0?null:list.get(0);
	}


	@Override
	public void updateOrders(Orders order) {
		orderMapper.updateByPrimaryKeySelective(order);		
	}


	@Override
	public Orders selectById(Integer id) {
		Orders order = orderMapper.selectByPrimaryKey(id);		
		return order;
	}


	@Override
	public Page<Orders> findOrdersByPage(Integer page, Integer rows,Orders order,List<Integer> uid,String createTime1, String createTime2) {
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		if(order.getOrderno()!=null && !"".equals(order.getOrderno())) {
			criteria.andOrdernoLike("%"+order.getOrderno()+"%");
		}
		if(uid.size()>0) {
			criteria.andUidIn(uid);
		}
		if(createTime1!=null && createTime2!=null && !"".equals(createTime1) && !"".equals(createTime1)) {
			criteria.andCreatetimeBetween(Timestamp.valueOf(createTime1) , Timestamp.valueOf(createTime2));
		}
		example.setOrderByClause("isdeal asc,createTime desc");
		Page<Orders> p = PageHelper.startPage(page, rows);
		orderMapper.selectByExample(example);
		return p;
	}


	@Override
	public int findOrderByisdeal() {
		OrdersExample example = new OrdersExample();
		example.createCriteria().andIsdealEqualTo(0);
		List<Orders> list = orderMapper.selectByExample(example);
		return list.size()>0?list.size():0;
	}


	@Override
	public List<Orders> seeOrderMore(Integer uid,long count) {
		OrdersExample orderExample = new OrdersExample();
		orderExample.createCriteria().andUidEqualTo(uid);
		orderExample.setOrderByClause("createTime desc");
		PageHelper.startPage(9, (int)count);		
		List<Orders> order = orderMapper.selectByExample(orderExample);
		return order.size() == 0 ? null : order;
	}


	@Override
	public long getOrdersCount(Integer id) {
		OrdersExample example = new OrdersExample();
		example.createCriteria().andUidEqualTo(id);
		long count =orderMapper.countByExample(example);
		return count;
	}


	@Override
	public void finishOrder(Orders order) {
		orderMapper.updateByPrimaryKeySelective(order);		
	}


}
