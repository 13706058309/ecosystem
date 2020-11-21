package com.cykj.service;

import com.cykj.entity.BackUser;

public interface BackUserService {

    int register(BackUser backUser); //注册
    boolean isRepeat(String account);//判断账号是否重复
}
