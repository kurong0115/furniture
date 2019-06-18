package com.house.furniture.util;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.servlet.http.HttpSession;

public class MyUtils {
	/**
	  * 生成图形验证码
	 * @param session
	 * @return
	 */
	public static BufferedImage createImgCode(HttpSession session) {
		BufferedImage bi = new BufferedImage(60, 22, BufferedImage.TYPE_INT_RGB);

		Graphics g = bi.getGraphics();

		g.setColor(new Color(187, 255, 255));

		g.fillRect(0, 0, 60, 22);

		Random r = new Random();

		g.setColor(Color.BLACK);

		String a = "";
		for (char i = 'A'; i < 'Z'; i++) {
			a += i;
		}
		for (char i = 'a'; i < 'z'; i++) {
			a += i;
		}
		for (char i = '0'; i < '9'; i++) {
			a += i;
		}
		char[] c = a.toCharArray();
		StringBuffer s = new StringBuffer();
		for (int i = 0, len = c.length; i < 4; i++) {
			int index = r.nextInt(len);
			g.setColor(new Color(r.nextInt(80), r.nextInt(150), r.nextInt(200)));
			g.drawString(c[index] + "", 4 + i * 15, 18);
			s.append(c[index]);
		}
		session.setAttribute("code", s.toString());
		return bi;
	}
}
