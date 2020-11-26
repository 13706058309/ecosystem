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
    UserInfo findPhone(String phone); //查找手机是否有该账号
    int changPasswordByPhone(String pwd,String phone); //通过手机修改密码
    public BackUser adminLog(String account,String pwd); //后台登录
    public UserInfo mesLog(String phone); //手机登录

    int register(UserInfo userInfo); //注册
    boolean isRepeat(String account);//判断账号是否重复
}
