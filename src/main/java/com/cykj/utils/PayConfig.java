package com.cykj.utils;

import java.io.FileWriter;
import java.io.IOException;

public class PayConfig {
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016110200786470";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCsd6zyDf5wYBrF0LYrVednwFulpny/7oUcOLiPyKFUWoR+Ar8AHysGrlyaU9KgtIGjMzHkSAD3Iw3HjyriP+zQkVJsvbAhOJwmQkL07Z+AhNjLjTvDU4EEqBXccx62SOwgWa3oWVds+GTSti9Xpw+/kZxF+HUcNYd3it3pV/SzAvFVZzx1RIYZCUN9qaqBXOvSKHyH4ARvYNRO8yQqF3lXRHqtiRfdrYUWxv9X788QioCpdchRwxbTADSHyIR6mt6gHQOV0Q7072wdUAwqORuhvhM9t4884Q5AbodZs2msZ851nmu76QcV5WnlPI23gZiPGn1MCPoPgUk80oGic4yHAgMBAAECggEAUJ0ryISD/rDdMsNosv7XSCagb+BPBUOPEm7szcBgsFYTAfd0obDv4pKTlEtD83wL8GWYl3SUhu/qm/GugMySe7bBiTRs5EpaqoNkWqnLWT4/O33LhnQ8pRmQBlgE7f1N6Z0hba587+F29wrTPCxJbyi3m/kTfFkE9fqB2XUUWqtr+SnoJA74mg3Q0GwRgn+oGj9k30HDvizKhsUFLZ0quJYX6XrvaVJL2cv/b37FLWvj7ev/+Mspci6aLX4xSDc7vhp8KmOjXTYJmoZbxh+h+5VuHKZmxTlLr+p2dltcnX9bugb15Ur4x5k7EQXcg/xyTMGpXBIdilrX1/w4L5e0aQKBgQDW54N5K9rOEzUCZKAvehE/4HsqNDTDtnlvSgIgKwwszZ8xXJlUtLJuDoUaz3l8teBoqAhU5U7l1jhIm/Tsg3EBZDFuhJB5IAJqAj+HFppZcEGggVbW3sH57ejSRBu+7tW7eOG8AdS/GU1c9lVfzlERTW+SQHZXdCEPh8gRykh3OwKBgQDNcrIre229zBhwrjopIi29fpr39ysZJN8y6hX6o7Uk08g7MCL5lkr2+VmKhAO5keMNWhqxQB5uCE4KQZ3NLfB6HgI19z0T0JXN8eo74crVHr8MNAEFSeN4OoDGCKpnUUF4Ef/4I17EO9s6FX8L7r9OKOf7VdIeQvSiv22Q8rPjJQKBgEjinhlzgTMRGpJkNFvFx6HlbYBD0n1qHsdaz1u/ndJ4LnycTjiHTFi9PfF42lgsix6TlrfMSbTzsYUWt7ubXLE/HPDBrwoVjBwOBSO4y8J3qxpXo28ef6VXRfZCOTLJZ928Qrrz2Aaz+yQDO7NRkvcOTz/H8xr3/Np6j6VQ+MDPAoGBAI0VX48GotT8rCftLVmD9B82Kxtva/RHYtMm91L4SvPwT4d9xfbZo784eqnpgFlV+rL3lm70VjE/mL/oUYJOMt7ZbrE6iIHr8oPLxgu7Qbva8l1h9PV5yTCOFFJqLwLmROw8iCgRuglOBX08t9Ms78ivxKbPR4yqdC6zAH3SfX/VAoGBAIRClgGeJ2vALnGh6inapwFIPe23bUovyOs6LUXQMmL3fTFPh5vux4CK8B5Q5KQEZAXpd8D2UVCGo7UCSWdv/uqif7cvxhJ8wiH5ESP9uja1/njV87HZec6DonC4RIHx2e7Yct/vMp8JkbbwW/RXsI8kSsw10o7Wad+8/2AAxuaC";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxci21SoLTNLhNpFX7/hu7Wkv5rRvKuWk4pp/EK5rR9n7XhJh9guhzyoGYIn2OwBGsCTHsFvYqz+yC8CxmIt2FoNjmj/3uKvMI9RUMn3DXsPBf/jNP94hrXbC+yp6GoZEn3Bx3YQF0qR9w1+R8mFr6R6xiFoofNOLOkcJW5/3nRbvfZamiEBz1L3hhWM+mNdmHt5vufpla+rBVoByityF17Q8nShrukVtyuQsKpqy4NalQ/60fu/s4mcGsq8y/Lmy/SZfZDZLU1UPDY2ObguZHvMUiI4ZrmxLzaeZZ5LUntg29vk9519zS4Mr/ye2fRZTFB2/XeMVKMuWTmM6Vn6V1wIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/springboot/notifyUrl";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/springboot/returnUrl";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


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
