package com.house.furniture.web;

import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.house.furniture.bean.Cart;
import com.house.furniture.bean.User;
import com.house.furniture.service.CartService;
import com.house.furniture.service.UserService;
import com.house.furniture.util.MyUtils;
import com.house.furniture.vo.Result;

@Controller
@SessionAttributes(names= {"cartProductList","allSum"})
public class LoginRegisterAction {

	@Resource
	CartService cartservice;
	
	@Resource
	UserService userservice;

	@RequestMapping("login-register")
	public String loginRegister() {

		return "login-register";
	}

	@PostMapping("login.do")
	@ResponseBody
	public Result login(String username, String password, String code,  HttpSession session, HttpServletRequest request,Model model) {
		String msg = "";
		// 根据用户名和密码查询
		User user = userservice.login(username, password);
		// 获取正确的验证码
		String valCode = (String) session.getAttribute("code");
		if (code.trim().equals(valCode.trim())) {// 判断验证码是否输入正确
			if (user == null) {// 登录失败
				msg = "用户名或者密码输入错误！";
				return new Result(Result.EXECUTION_FAILED, msg);
			} else {
				// 登陆成功，将用户添加到会话当中
				session.setAttribute("user", user);
				msg = "登录成功!";
				
				//成功之后把该用户的购物车查出来
				List<Cart> cartProductList = cartservice.listCartProductByUser(user);
				model.addAttribute("cartProductList", cartProductList);
				
				long allSum=0;
				for (Cart cart : cartProductList) {
					allSum+=cart.getCount()*cart.getProduct().getPrice();
				}
				model.addAttribute("allSum", allSum);
				
				//判断是否有回调路径
				if(session.getAttribute("callbackPath")!=null) {
					String path = (String) session.getAttribute("callbackPath");
					
					@SuppressWarnings("unchecked")
					Map<String, String[]> newmap = (Map<String, String[]>) session.getAttribute("callbackMap");
					//拼接地址
					path+="?";
					for (Map.Entry<String, String[]> entry : newmap.entrySet()) {
						String name=entry.getKey();
						String value=entry.getValue()[0];
						path+=name+"="+value+"&";
						
					}
					//重定向回调页面
					String cxtPath=request.getContextPath();
					String newPath=cxtPath+path;
					return new Result(Result.EXECUTION_SUCCESS, msg,newPath);
				}
				
				return new Result(Result.EXECUTION_SUCCESS, msg);
			}
		} else {
			msg = "验证码输入错误！";
			return new Result(Result.EXECUTION_FAILED, msg);
		}
	}
	
	@PostMapping("reg.do")
	@ResponseBody
	public Result reg(String username, String password,String email,String code,HttpSession session) {
		String msg = "";
		
		 if( username.trim() == "" || password.trim() == "" || email.trim() == "" || code.trim()=="") {
			 msg = "请输入完整的信息！"; return new
			 Result(Result.EXECUTION_FAILED, msg); 
		}
		 
		//判断邮箱格式是否正确
		if( !MyUtils.isEmail(email) ) {
			msg = "邮箱格式不正确，请重新输入！";
			return new Result(Result.EXECUTION_FAILED, msg);
		}
		String realCode = (String)session.getAttribute("realCode");
		System.out.println(realCode);
		System.out.println(code);
		if( !code.equals(realCode) ) {
			msg = "验证码输入错误！";
			return new Result(Result.EXECUTION_FAILED, msg);
		}
		//根据用户名判断用户是否可以注册
		User user1 = userservice.selectByUsername(username);
		
		if( user1 == null ) {
			//根据邮箱判断用户是否可以注册
			User user2 = new User();
				user2 = userservice.selectByEmail(email);
			if( user2 == null ) {
				Integer result =  userservice.reg(username, password, email);
				if( result == 1 ) {
					msg = "注册成功!";
					return new Result(Result.EXECUTION_SUCCESS, msg);
				}else {
					msg = "出了一点小故障，刷新试试！";
					return new Result(Result.EXECUTION_FAILED, msg);
				}
			}else {
				msg = "邮箱已存在！如果你忘记了账号，请点击忘记账号！";
				return new Result(Result.EXECUTION_FAILED, msg);
			}
		}else {
			msg = "用户名已存在!";
			return new Result(Result.EXECUTION_FAILED, msg);
		}	
	}
	
	@GetMapping("forgetPassword")
	public String foget() {
		return "forgetPassword";
	}
	
	@PostMapping("forgetPassword.do")
	@ResponseBody
	public Result resertPassword(String username ,String password,String email,String code) {
		String msg = "";
		User user = userservice.selectByUsernameAndEmail(username, email);
		if( user == null ) {
			msg = "邮箱与用户名不对应！";
			return new Result(Result.EXECUTION_FAILED, msg);
		}
		//将新的密码设置到用户里面
		user.setPassword(password);
		Integer result = userservice.resertPassword(user);
		if( result == 1 ) {
			msg = "修改成功!";
			return new Result(Result.EXECUTION_SUCCESS, msg);
		}
		return new Result(Result.EXECUTION_SUCCESS, "出了点小问题，刷新试试！");
	}
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Value("${mail.fromMail.addr}")//spel表达式
	private String from;
	
	public void sendMail(String to,String subject,String content) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(content);
		mailSender.send(message);
	}
	
	@PostMapping("send")
	@ResponseBody
	public Result send(String email,HttpSession session) {
		if( !MyUtils.isEmail(email) ) {
			return new Result(Result.EXECUTION_FAILED,"请输入正确的邮箱地址");
		}
		String str="0123456789";
		StringBuilder sb=new StringBuilder(4);
		for(int i=0;i<4;i++){
		char ch=str.charAt(new Random().nextInt(str.length()));
			sb.append(ch);
		}
		String realCode = sb.toString();
		//将验证码加入session中
		session.setAttribute("realCode", realCode);
		
		String content = "您的验证码为：" + realCode;
		sendMail(email, "OurHouse邮件", content);
		return new Result(Result.EXECUTION_SUCCESS,"发送成功！");
	}
		
	@PostMapping("forgetCount.do")
	@ResponseBody
	public Result searchCount(String email) {
		if( !MyUtils.isEmail(email) ) {
			return new Result(Result.EXECUTION_FAILED,"请输入正确的邮箱地址");
		}
		User user = userservice.selectByEmail(email);
		String content = "您邮箱对应的账号是：" + user.getName();
		sendMail(email, "OurHouse邮件", content);
		return new Result(Result.EXECUTION_SUCCESS,"账号已发送至您的邮箱,请查收!");
	}
	
	@RequestMapping("loginOut")
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "login-register";
	}
	
	/**
	 * 返回创建验证码视图
	 * 
	 * @return
	 */
	@RequestMapping("createCode")
	public String createCode() {
		return "common/createCode";
	}
}
