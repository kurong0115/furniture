package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Address;
import com.house.furniture.bean.User;

public interface AddressService {

	//根据用户查询该用户的所有收货地址
	List<Address> getAddrByUser(User user);

}
