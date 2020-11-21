package com.cykj.controller;

import com.cykj.service.impl.AlipayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/zhifubao")
public class PayController {

    @Autowired
    private AlipayService alipayService;

    //支付成功后的异步回调，用于处理服务端业务
    @RequestMapping("/notifyUrl")
    public void notifyUrl(HttpServletRequest request)throws Exception{
        alipayService.notifyUrl(request);

    }

    //支付成功后同步回调，用于展示给用户查看
    @RequestMapping("/returnUrl")
    public String returnUrl(HttpServletRequest request)throws Exception{
        System.out.println("同步回调");
        return alipayService.returnUrl(request);
    }

    //用户点击付款后请求此方法
    @RequestMapping("/alipayTradePagePay")
    public String alipayTradePagePay(HttpServletRequest request,HttpServletResponse response) throws Exception{
        return alipayService.alipayTradePagePay(request,response);
    }

}
