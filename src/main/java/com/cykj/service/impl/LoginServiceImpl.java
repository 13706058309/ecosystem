package com.cykj.service.impl;

import com.cykj.entity.BackUser;
import com.cykj.entity.UserInfo;
//import com.cykj.log.Loger;
import com.cykj.mapper.UserInfoMapper;
import com.cykj.service.LoginService;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private UserInfoMapper userInfoMapper;


    /**
     * 执行前台登录
     * @param account
     * @param pwd
     * @return
     */
    @Override
    public UserInfo log(String account, String pwd) {
        Map<String,Object> map = new HashMap<>();
        map.put("account",account);
        map.put("pwd",pwd);
        UserInfo userInfo = userInfoMapper.log(map);
        return userInfo;
    }

    /**
     * 执行后台登录
     * @param account
     * @param pwd
     * @return
     */
    @Override
    public BackUser adminLog(String account, String pwd) {
        System.out.println("实现类的密码:"+pwd);
        Map<String,Object> map = new HashMap<>();
        map.put("account",account);
        map.put("pwd",pwd);

        BackUser backUser = userInfoMapper.adminLog(map);
        return backUser;
    }

    @Override
    public int register(UserInfo userInfo) {
        int n = userInfoMapper.register(userInfo);
        return n;
    }

    @Override
    public boolean isRepeat(String account) {
        UserInfo isRepeat = userInfoMapper.isRepeat(account);
        return isRepeat==null;
    }
}
