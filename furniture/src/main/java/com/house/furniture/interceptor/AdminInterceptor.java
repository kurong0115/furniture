package com.house.furniture.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.house.furniture.bean.Admin;

@Component
public class AdminInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if (admin == null) {
	        if("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))){
	            response.setHeader("REDIRECT", "REDIRECT");
	            response.setHeader("CONTENTPATH", request.getContextPath() + "/admin");
	            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
	        }else{
	    		response.sendRedirect(request.getContextPath() + "/admin");
	        }					
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
