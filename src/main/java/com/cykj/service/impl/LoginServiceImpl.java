package com.cykj.service.impl;

import com.cykj.entity.BackUser;
import com.cykj.entity.UserInfo;
import com.cykj.mapper.UserInfoMapper;
import com.cykj.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private UserInfoMapper userInfoMapper;


//    @Override
//    public UserInfo log(String account, String password) {
//        return userInfoMapper.log(account, password);
//    }

//    @Override
//    public BackUser adminLog(String account, String password) {
//        return userInfoMapper.adminLog(account, password);
//    }
}
