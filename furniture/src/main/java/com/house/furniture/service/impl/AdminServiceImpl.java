package com.house.furniture.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.house.furniture.bean.Admin;
import com.house.furniture.bean.AdminExample;
import com.house.furniture.dao.AdminMapper;
import com.house.furniture.service.AdminService;
import com.house.furniture.service.ServiceException;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	AdminMapper am;

	@Override
	public List<Admin> queryAdmin() {
		return am.selectByExample(null);
	}

	@Override
	public Admin adminLogin(Admin admin) throws ServiceException {
		if(admin.getName()==null || "".equals(admin.getName())) {
			throw new ServiceException("用户名不能为空");
		}
		if(admin.getPassword()==null || "".equals(admin.getPassword())) {
			throw new ServiceException("密码不能为空");
		}
		AdminExample example = new AdminExample();
		example.createCriteria().andNameEqualTo(admin.getName()).andPasswordEqualTo(admin.getPassword());
		List<Admin> list = am.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

}
