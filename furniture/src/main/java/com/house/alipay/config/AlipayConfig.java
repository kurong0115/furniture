package com.house.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101100658178";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQCvQXuoEITuZQBryb6CGGr+7r6g7CpNnwrv/EpUXlGnOikY2O/Yi0DfaQuJ+Rfy5jH8GND2A3VTZK4bks1C05GaEGiwpPRtCUC6gTgCzd6TrmJCvtLK6+yakQKaphVVoIllayRzt8N7j2EdtM/Ifx6sJROJcRpGjuTfO/zH53syyw2MuyjMJSZ6AVIfpP0MFP+Mscohh/Qric4pPMau0850dJMMdFKzfDP+vMbfA3EJmExuuMApge9f2dGNO6ayL6IqBKl+6XM6dGyEG810g6gVGeWaEMCs1JTK5v2DTmyTjz4EC1BHTa58w1911AH4WkFxfwoRR1a5Y2D4Q2a+j2hVAgMBAAECggEBAIdR7ZQAZVPZovCXTsUO65a6a3C/yY4zrnNM/2uThEK2MsNfxhoSs92NM36uWiKQQaog00ARvYbNp23c9SaTS8qEvwEd7Sk/yr33RnNL2H95V5+nzgUnE4LpUvRsJu79zPkFOJktHACM3fTdBs8N8HYFDsfCEALJFMmVfQIxpzu4qZhRWTv06gAe3RQokQBgieFLDRRl1Jrh9a0aPgnzGsehkN0UZMdKYK2TbFEXD9WOLB1UN3OjrKxTSnfdaAeA+8Gws5aKMrSJ1hoDYvBOhphDGuXzRZt+9UljDj+xRBE8MvaYSQuNbx5mw90YGZcGWtPgxfBl9vHSTqTpBAfTWwUCgYEA8ICFuthmSpknfpZGSn4ElF3V2yRH5F4lpgoe7Pxk6EAS8EAEuBYNOZsJtJKqUrnFZoh9npEPoKZkJSom63odNxFVkJXZovZX1PQ4odkYztXNANfHzaX0VEBeNjUNNptIjTyZ+lEs75tQkOylyw7Ns6A/geZpdHTz4BvSdlqsDKcCgYEAuoydwhtbTu9KOIoI0LY8He7iLKk/Bk2QGzxp4uIWkMuIN+TRqHKmGyWKCJPLVzO7MXuv36HPYEtYjMHoRLZyBt/b7bxbSERAJ0sy82nU9h63iUgyDfjikK8UJTjWYaGlCNy26fPuDRk4JspmtGuM1oi6xlyeCFo7xI3oOvNLFqMCgYEA8BKba6RQl+7CKe7AQ+P/lksFCzfwO9pvIou/yzk3UU+EmCaPj2MT2IkW6xXsx5+BmZRuMTcErozqMt8c8rp3J106WJX9JltZ2c3gKk+YH//0H/9GB9a9SszmPp4+jl/70GDKI8GcZaJYjhJsfYJNfB1ex8DFS+bi+rdLI7HnRMkCgYEAilpRgi1B2df0htwwz4HoMhcCHTdka6tIrjpvGXquW7LnkvScXb6x3L5JkjTygPj34yoldMkQAQ3AXZxOQ++/v8N02+tvE7iyj7Hg1tBtxh9f5Wvq25vzhHSkjzqJHJ2CxYDUE8z6hzJmB7bi1vpQ2KdNRmJYPj+Vxh+s1VOtI9sCgYEAkSM2MWGFPnERJJxuYM2KwmlZHAOUSIJ7lZ3MEdnmsg+DMXmz5J3E1flQUdq3DI12ZSdWg80SNajT7VZpJBKYnyiFhQUw6UVHj02fmzBqLgJRxo/JK0c+FfvZ2uSfQySI+g4X9h+bJoaMY+FRP3xhR7536N0zmq7WFBBr0dR73f0=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoSDrkq8Cx5kDFfLvcU5udhrSiGNzb1qM4ayiphdm5xT7rN2zeeDBWj2TnyO7S1gNhznYheHRoOIAiu/OVL9jLjVqNjfQyM9Xgkblb8mJpqOPMzw1UgFJyxm/9i3O3R936m7OBUCw8jAphdTqvPjoAXmGGD0O35Itf5fYQl1PFxtrGIvIAAVk1iDYmdc+t5BLRYCxkvMJVDs/ZIF4G47LV88ePHwe5Np4hg217rQMP0O1m861UpHmzANg1ES/8uTKftBeCdr4NboAGVEdW9YZp2xnBtAP1tKwjBGX3Z7n15Us9LXDNwqx1s1gwcndk3+VIj6NxnUQOOv2xUWba2lRPwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://127.0.0.1:8080/notify_url";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://127.0.0.1:8080/return_url";

	// 签名方式D
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

