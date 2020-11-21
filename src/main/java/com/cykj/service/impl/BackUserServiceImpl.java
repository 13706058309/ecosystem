package com.cykj.service.impl;

import com.cykj.entity.BackUser;
import com.cykj.entity.UserInfo;
import com.cykj.mapper.BackUserMapper;
import com.cykj.service.BackUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service
public class BackUserServiceImpl implements BackUserService {

    @Resource
    private BackUserMapper backUserMapper;


    @Override
    public int register(BackUser backUser) {
        int n = backUserMapper.register(backUser);
        return n;
    }

    @Override
    public boolean isRepeat(String account) {
        BackUser isRepeat = backUserMapper.isRepeat(account);
        return isRepeat==null;
    }
}
