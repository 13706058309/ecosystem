package com.cykj.service;

import com.cykj.entity.BackUser;
import com.cykj.entity.UserInfo;

public interface LoginService {

    public UserInfo log(String account,String password); //用户登录
    public BackUser adminLog(String account,String password); //后台登录

}
