package com.cykj.service.impl;

import com.cykj.entity.CerUser;
import com.cykj.mapper.CerUserMapper;
import com.cykj.service.CerUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CerUserServiceImpl implements CerUserService {

    @Resource
    CerUserMapper cerUserMapper;

    /**
     * @param userid
     * @return查询用户已获得的证书集合
     */
    @Override
    public List<CerUser> findceruserlist(long userid) {

        return cerUserMapper.findceruserlist(userid);
    }
}
