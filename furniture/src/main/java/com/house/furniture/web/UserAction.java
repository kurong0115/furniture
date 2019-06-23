package com.house.furniture.web;

import java.io.File;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.house.furniture.bean.User;
import com.house.furniture.service.UserService;
import com.house.furniture.vo.EasyUIPage;
import com.house.furniture.vo.Result;

@RestController
@RequestMapping("user")
public class UserAction {
	
	@Resource
	UserService us;
	
	//获取用户信息
	@RequestMapping("query")
	public EasyUIPage query(User user, int page, int rows) {
		Page<User> p = us.selectAllUser(user, page, rows);
		return new EasyUIPage(p.getTotal(), p.getResult());
	}
	
	// 文件上传（头像）
	@RequestMapping("upload")
	public Result upload(@RequestParam("file") MultipartFile file) {
		try {
			file.transferTo(new File("D:/PIAimages/head/" + file.getOriginalFilename()));
			return new Result(Result.EXECUTION_SUCCESS, "文件上传成功", "/head/"+file.getOriginalFilename());
		} catch (Exception e) {
			return new Result(Result.EXECUTION_FAILED, "文件上传失败");
		}
	}
	
	// 保存新增用户信息
	@RequestMapping("save")
	public Result save(@Valid User user, Errors errors) {
		if(us.isExist("name", user.getName()) == 0) {
			//用户名被占用
			return new Result(2, "用户名被占用");
		}
		if(us.isExist("email", user.getEmail()) == 0) {
			//邮箱被占用
			return new Result(2, "邮箱被占用");
		}
		
		if(errors.hasErrors()) {
			return new Result(Result.EXECUTION_FAILED, "用户新增失败", errors.getAllErrors());
		}else {
			us.save(user);
			return new Result(Result.EXECUTION_SUCCESS, "用户新增成功");
		}
	}
	
	// 获取用户购物信息
	@RequestMapping("queryAddress")
	public EasyUIPage queryAddress(int uid, int page, int rows) {
		Page<User> p = us.queryAddress(uid, page, rows);
		return new EasyUIPage(p.getTotal(), p.getResult());
	}
}
