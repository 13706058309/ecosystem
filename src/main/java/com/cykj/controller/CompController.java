package com.cykj.controller;

import com.cykj.entity.BackUser;
import com.cykj.service.BackUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/comp")
public class CompController {


    @Resource
    BackUserService backUserServiceImpl;


    @RequestMapping("/compReg")
    public String compReg() {
        return "comp/BackCompReg";
    }


    @RequestMapping("/join")
    public @ResponseBody
    String join(BackUser backUser) {
        System.out.println("执行企业入驻!");
        String account = backUser.getAccount();
        if (backUserServiceImpl.isRepeat(account)) {
            int i = backUserServiceImpl.register(backUser);
            if (i > 0) {
                return "regsuccess";
            } else {
                return "regfaid";
            }
        } else {

            return "repeat";
        }
    }
}
