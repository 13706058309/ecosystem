package com.cykj.util;

import java.io.FileWriter;
import java.io.IOException;

public class ProjectPayConfig {
        // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
        public static String app_id = "2016103100782673";

        // 商户私钥，您的PKCS8格式RSA2私钥
        public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCdKtqugQ0PcWj0WuZPNh7NELANKNL3rZVkIPEaI1/DsgLPJN2b7i0AtXcD9aaUMb8XnE/DDQIfWUradPgw4gJjbwrrTo2t5rWQ39rZwzawhFp/vwg0EhDYjM/S09lOCvMXgX5afUXW+kk7KDzdxxFxhpC7qAekwXfWaWETyyIk6zltqItTCccILE9I/mY+arrPx68NRGVU90L+5STCQKyyHRgoL7sXomapEexL84yy6ac6cy4SGAs9CJ4D2A9esOaOcIT1P4AbtsiSmF1+JWKmV/tA5PMr8rBoF7pg5AnieMiWuCk0h66ub0WZQPeGl+/HgTk9JQ2DNNrUySkTh5yXAgMBAAECggEAd83j9qOO9heoPqRP7U+++OhgmxdkgcKDH1lxEFCovj8inw5mE2fiTCkHuS/3M/4bwX642mE/HfBt+8qwKmsOEQfjVe2CWG6GNxI8/EQvmyy446oWMcMXrkrgXMB6ZGA6X8+pJodZxn7xdbO9ef02EcjW6QU0FmYX2IxpoLH2rBajvktdvgA6OXLGNnuG/OAp0pRrFnLMjTuFSQEFG8qs3HXtN/FVuntjkHC64FF9Tv+BcnjxBGOnLDT7LY3bFTe5eZHEr2VIyOKKo+hB3Aa5gONesKLRbxJNZJqOdEDXQ38XhMg7LcB20brL8znQEVVyuNzDNvP7bI2lCTzPTxcHaQKBgQDaW7Vo4yHR7MNuV/m+f4PmBwlwKJgmY/Jg9DWdR7PQnTwfogWluKI/OzJ1Eu9/4mRjO4Pfo4SnQv8cWdGCWI2AuoO5JokX8uXYRNGP2aG0yZd9NWJv9HRdZVqJDLaQxKhVVQs0lSBUloI8/n7iYZkeqxi+6+NJpqePJC1dVI3ANQKBgQC4QsEIcwrZL5MAxzGw9mNTOE99CvFG2SjSqnPuiWBR89Uj4zH2HPeGN1pTrfkxf2bz1GkUjNEKFcemmSAIAmYAUnNSHLoGFnGI7+Xg/v43ZKQ/sO7t5bGjP8f+oQBQbpvk6/IQQjksR7+0al/sTq9WRbAXS3m9/xhfydTqM2vbGwKBgCO9lRDo9HUu4sIh5j/3ETjKeBICovzNqTOTZV8sCFOiGOA4neIFOZFN+DFPeyIchT/00t39Hs5d2fHjBbbnFao3XS4mD5R67oIaqY55Gc3EnWYiIc2fXpiW6V27VfqWJdNpyx69NgCCbijboxsczHpHmRJO+/HnNE/qpP48w8LtAoGAa/sCsHbqlphgp4YUQsZBMtW/D2JIPuKoH7ywL8vl3GDuORe9gaM8EzWBA6TicfVdWerSoa5cGnLlC2aU9Nyi9fFbj3UyNrsUUdF0f8QvKjsaXhDMFDIVRbvs8fVb/8ayKRd0Rb7pTl/Fom7sQ8lgy0gPh7c9YvCJUikvUwhLXp0CgYBde6Djg9rZz5cPpTrwT9F6mPe6eDmRqJfU3s9T6dCbFz6gmEW6r2GEatOO9CTPmKP5qRka7jrDrzexuIXf3FOfBSUTA5I6in2pTdMvWUD7CHjrVlI8Xum7n6+9e4UlPnkt1IXuSgM19eFFLZMU61WYw8XqEXu2lWo61i4AY41AIg==";

        // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
        public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk10JpyzT6OwEo+pKE6u1/X9haiEguMNL0oJFhh37PbmSPEG+CdH0GHpEvAxPz9OfWY5z57YcU4Dy+8KiL/HaDA5amom2fzkk4yE+xF4MY2b48WenCoPeZiCFE93gwJGhmgW5H0zI3fDe9ni+ou62STqcDML0rW6mRWYgh4UZ4bEeUJZCGPTdPeHfkatmRPy7xzFD1wSXNsDrNJP7Km3y3dNd4O9rbM7CL6VbpenlKkw1YQrBcIpbdgX+caIsesce31B2HD6aEJVfsrGCWKtpVetpRFE+D2LL+Lout841KfHjx2pV8MGwgUKEmVHMjUQpkRK4+xnz+H5OSjVzusAeAQIDAQAB";

        // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
        public static String notify_url = "http://47.116.134.152:8080/springboot/userProject/notifyUrl";

        // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
        public static String return_url = "http://47.116.134.152:8080/springboot/userProject/returnUrl";

        // 签名方式
        public static String sign_type = "RSA2";

        // 字符编码格式
        public static String charset = "utf-8";

        // 支付宝网关
        public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

        // 支付宝网关
        public static String log_path = "E:\\沙箱支付宝";


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

