package com.house.furniture.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.house.furniture.bean.Address;
import com.house.furniture.bean.AddressExample;
import com.house.furniture.bean.User;
import com.house.furniture.dao.AddressMapper;
import com.house.furniture.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

	@Resource 
	AddressMapper addressmapper;
	
	@Override
	public List<Address> getAddrByUser(User user) {
		AddressExample example = new AddressExample();
		
		example.createCriteria().andUidEqualTo(user.getId()).andStatusNotEqualTo(0);
		List<Address> list = addressmapper.selectByExample(example);
		return list;
	}
	//添加地址
	@Override
	public Integer addAddress(Address address) {
		Integer result = addressmapper.insert(address);
		return result;
	}
	//根据id查询地址
	@Override
	public Address queryAddressByID(Integer id) {
		Address address = addressmapper.selectByPrimaryKey(id);
		return address;
	}
	@Override
	public Integer updateAddress(Address address) {
		Integer result = addressmapper.updateByPrimaryKey(address);
		return result;
	}
	@Override
	public Integer deleteAddressById(Integer id) {
		Address address = queryAddressByID(id);
		address.setStatus(0);
		Integer result = addressmapper.updateByPrimaryKeySelective(address);
		return result;
	}

}
