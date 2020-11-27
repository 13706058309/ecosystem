package com.cykj.service.impl;

import com.cykj.entity.CerUser;
import com.cykj.mapper.CerUserMapper;
import com.cykj.service.CerUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

    /**
     * @param map
     * @return 后台人员查询已获得证书
     */
    @Override
    public List<CerUser> backfindceruserlist(Map<String, Object> map) {
        return cerUserMapper.backfindceruserlist(map);
    }

    /**
     * @param map
     * @return 后台人员查询已获得证书总长度
     */
    @Override
    public int findceruserlistsize(Map<String, Object> map) {
        return cerUserMapper.findceruserlistsize(map);
    }

    /**
     * @param cerUser
     * @return 增加已获得证书
     */
    @Override
    public int insertCerUser(CerUser cerUser) {
        return cerUserMapper.insertCerUser(cerUser);
    }


}
