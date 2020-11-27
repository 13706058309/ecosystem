package com.cykj.controller;

import com.cykj.entity.BackUser;
import com.cykj.entity.Menu;
import com.cykj.service.PowerService;
import com.cykj.service.impl.PayService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class AliPayController {

    @Resource
    private PayService payService;
    @Resource
    private PowerService powerServiceImpl;
    //用于请求首页显示支付付款功能
    @RequestMapping("/payTest")
    public String hello(){
        return "comp/test";
    }

    //支付成功后的异步回调，用于处理服务端业务
    @RequestMapping("/notifyUrl")
    public void notifyUrl(HttpServletRequest request)throws Exception{
        payService.notifyUrl(request);

    }

    //支付成功后同步回调，用于展示给用户查看
    @RequestMapping("/returnUrl")
    public String returnUrl(HttpServletRequest request)throws Exception{
        System.out.println("同步回调");
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        if (backUser != null) {
            List<Menu> menuList = powerServiceImpl.findExistMenu(backUser.getRoleId());
            request.getSession().setAttribute("menuList", menuList);
            return payService.returnUrl(request,backUser.getbUserId());
        } else {
            return "";
        }
    }

    //用户点击付款后请求此方法
    @RequestMapping("/alipayTradePagePay")
    public String alipayTradePagePay(HttpServletRequest request, HttpServletResponse response) throws Exception{
        return payService.alipayTradePagePay(request,response);
    }
}
