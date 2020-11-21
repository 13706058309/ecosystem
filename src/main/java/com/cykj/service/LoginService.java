package com.cykj.service;

import com.cykj.entity.BackUser;
import com.cykj.entity.UserInfo;



public interface LoginService {
    /**
     *
     * log前端登录
     * adminLog后台登录
     *
     */
    public UserInfo log(String account,String pwd); //用户登录
    public BackUser adminLog(String account,String pwd); //后台登录

    int register(UserInfo userInfo); //注册
    boolean isRepeat(String account);//判断账号是否重复
}
