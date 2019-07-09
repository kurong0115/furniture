package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Address;
import com.house.furniture.bean.User;

public interface AddressService {

	//根据用户查询该用户的所有收货地址
	List<Address> getAddrByUser(User user);
	
	
	//添加地址
	Integer addAddress(Address address);


	Address queryAddressByID(Integer id);
	
	//修改地址
	Integer updateAddress(Address address);

	//删除地址
	Integer deleteAddressById(Integer id);

}
