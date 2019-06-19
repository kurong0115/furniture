package com.house.furniture.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import javax.servlet.http.HttpSession;

public class MyUtils {
	/**
	  * 生成图形验证码
	 * @param session
	 * @return
	 */
	public static BufferedImage createImgCode(HttpSession session) {
		BufferedImage bi = new BufferedImage(110, 30, BufferedImage.TYPE_INT_RGB);

		Graphics g = bi.getGraphics();

		g.setColor(new Color(255, 255, 255));

		g.fillRect(0, 0, 160, 222);

		Random r = new Random();
		//设置字体，和字体大小
		g.setFont(new Font("微软雅黑",Font.BOLD,20));
		//设置字体颜色
		g.setColor(Color.BLACK);
		
		String a = "";
		
		for (char i = '0'; i < '9'; i++) {
			a += i;
		}
		char[] c = a.toCharArray();
		StringBuffer s = new StringBuffer();
		for (int i = 0, len = c.length; i < 4; i++) {
			int index = r.nextInt(len);
			g.setColor(Color.BLACK);
			g.drawString(c[index] + "", 4 + i * 15, 18);
			s.append(c[index]);
		}
		session.setAttribute("code", s.toString());
		return bi;
	}
	/**
	 * md5加密
	 * @param str
	 * @return
	 */
	public static String getMD5String(String str) {
		MessageDigest md5;
		try {
			md5=MessageDigest.getInstance("MD5");
			md5.update(str.getBytes());
			byte[] digest = md5.digest();
			return new BigInteger(1,digest).toString(16);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
}
