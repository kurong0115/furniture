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
		
		example.createCriteria().andUidEqualTo(user.getId());
		List<Address> list = addressmapper.selectByExample(example);
		return list;
	}

}
