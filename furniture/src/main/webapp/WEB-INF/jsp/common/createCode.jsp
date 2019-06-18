<%@page import="com.house.furniture.util.MyUtils"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//获取随机生成的验证码图形缓冲对象
	BufferedImage bi=MyUtils.createImgCode(session);
	//把图形缓冲对象以jpg的格式输出到指定流
	ImageIO.write(bi, "jpg", response.getOutputStream());
	//清空流
	out.clear();
	//更新pageContext中的page范围内out对象
	out=pageContext.pushBody();
%>