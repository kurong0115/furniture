package com.house.furniture.service;

import java.io.UnsupportedEncodingException;


public interface AuthService {
	public abstract String getAccessToken(String code);
    public abstract String getOpenId(String accessToken);
    public abstract String refreshToken(String code);
    public abstract String getAuthorizationUrl() throws UnsupportedEncodingException;
    public abstract com.alibaba.fastjson.JSONObject getUserInfo(String accessToken,String openId);

}
